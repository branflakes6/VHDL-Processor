----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 02:15:50
-- Design Name: 
-- Module Name: program_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
       port(
       PI, PL, reset, clock : in std_logic;
       offset : in std_logic_vector (15 downto 0);
       PC_out : out std_logic_vector(15 downto 0)
       );
end program_counter;

architecture Behavioral of program_counter is
        component alu is --we need an ALU to do some addition
        port(
           A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cin : in std_logic;
           Sum_out : out std_logic_vector (15 downto 0);           
           Cout_final : out std_logic
           );
           end component;
           
      
    signal b_input : std_logic_vector(15 downto 0) := x"0000";
    signal alu_sel : std_logic_vector(2 downto 0) := "001"; --Only ever need to add 1 so we can set this value to be fixed
    signal alu_out : std_logic_vector(15 downto 0);
    signal count: std_logic_vector(15 downto 0);

begin
      alu_car : alu port map( 
                    A => count,
                    B => b_input,
                    S0 => alu_sel(0),
                    S1 => alu_sel(1),
                    S2 => alu_sel(2),
                    Cin => '0',
                    Sum_out => alu_out
                    );
   process(clock, reset)
    begin
        if(reset = '1') then
            count <= x"0000";
        elsif(clock = '1' and PI = '1' and PL = '0') then
            count <= alu_out;
        elsif(clock = '1' and PI = '0' and PL = '1') then
            count <= alu_out;
        else count <= count;
        end if;
    end process;
    
     b_input <= x"0001" after 1ns when PI = '1' and PL = '0' else
                   offset after 1ns when PI = '0' and PL = '1' else
                   x"0000" after 1ns;
                   
    pc_out <= count after 1ns;
end Behavioral;
