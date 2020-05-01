----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 23:07:27
-- Design Name: 
-- Module Name: CAR - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAR is
    port(
        op_in : in std_logic_vector(7 downto 0);
        clock, reset, sel : in std_logic;
        car_out : out std_logic_vector(7 downto 0)
    );
end CAR;

architecture Behavioral of CAR is
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
           
      
    signal b_input : std_logic_vector(15 downto 0) := x"0001";
    signal alu_sel : std_logic_vector(2 downto 0) := "001"; --Only ever need to add 1 so we can set this value to be fixed
    signal alu_out : std_logic_vector(15 downto 0);
    signal CAR_address: std_logic_vector(7 downto 0);

begin
      alu_car : alu port map( 
                    A (7 downto 0) => CAR_address,
                    A (15 downto 8) => x"00",
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
            CAR_address <= x"00";
        elsif(clock = '1' and sel = '0') then
            CAR_address <= alu_out(7 downto 0);
        elsif(clock = '1' and sel = '1') then
            CAR_address <= op_in;
        end if;
    end process;
car_out <= CAR_address after 1ns;   

    
                 
end Behavioral;
