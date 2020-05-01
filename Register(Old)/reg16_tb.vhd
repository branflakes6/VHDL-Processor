----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2020 18:04:41
-- Design Name: 
-- Module Name: reg16_tb - Behavioral
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

entity reg16_tb is
end reg16_tb;

architecture Behavioral of reg16_tb is

    component reg16
     port ( 
        D : in std_logic_vector(15 downto 0);
        load, Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0)
        );
     end component;
     --inputs
     signal D : std_logic_vector(15 downto 0);
     signal load, Clk : std_logic;
     --outputs
     signal Q : std_logic_vector(15 downto 0);
     
begin
    uut: reg16 port map(
                        D=>D,
                        load=>load,
                        Clk=>Clk,
                        Q=>Q
                        );
                        
    stim_proc: process
    begin
    wait for 10ns;
    Clk<='0';
    D<="0000000011111111";
    load<='0';
    wait for 10ns;
    load<='1';
    wait for 10ns;
    Clk<= not Clk;
    
    
    
    end process;
    

end Behavioral;
