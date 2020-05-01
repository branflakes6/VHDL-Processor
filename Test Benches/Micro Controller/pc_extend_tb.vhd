----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 16:15:02
-- Design Name: 
-- Module Name: pc_extend_tb - Behavioral
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

entity pc_extend_tb is
end pc_extend_tb;

architecture Behavioral of pc_extend_tb is
        component pc_extend is 
        port (  
             extend_in : in std_logic_vector(5 downto 0);
             extend_out : out std_logic_vector(15 downto 0)
            );
        end component;
        
        signal extend_in : std_logic_vector(5 downto 0) := "100000";
       signal extend_out : std_logic_vector(15 downto 0); 
begin
        uut: pc_extend port map(
                                extend_in => extend_in,
                                extend_out => extend_out
                                );
stim: process
        begin
        wait for 100ns;
        extend_in <= "000010";    
        end process;
end Behavioral;
