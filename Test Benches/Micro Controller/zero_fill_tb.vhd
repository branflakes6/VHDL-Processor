----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 13:05:43
-- Design Name: 
-- Module Name: zero_fill_tb - Behavioral
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

entity zero_fill_tb is
end zero_fill_tb;

architecture Behavioral of zero_fill_tb is
    component zero_fill is 
    port(
       fill_in : in std_logic_vector (2 downto 0);
       fill_out: out std_logic_vector (15 downto 0)
       );
       end component;
       
       signal fill_in : std_logic_vector(2 downto 0) := "100";
       signal fill_out : std_logic_vector(15 downto 0); 
begin
        uut: zero_fill port map(
                                fill_in => fill_in,
                                fill_out => fill_out
                                );
stim: process
        begin
        wait for 100ns;
        fill_in <= "010";    
        end process;

end Behavioral;
