----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 19:55:56
-- Design Name: 
-- Module Name: mux9_to_16 - Behavioral
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

 entity mux9_to_16 is
    Port ( In0, In1, In2, In3, In4, In5, In6, In7, in8 : in std_logic_vector(15 downto 0);
    S0, S1, S2, S3 : in std_logic;
    Z : out std_logic_vector(15 downto 0));
    end mux9_to_16;
    
    architecture Behavioral of mux9_to_16 is
    begin
    Z <= In0 after 5 ns when S0='0' and S1='0' and S2='0' else
         In1 after 5 ns when S0='0' and S1='0' and S2='1' else
         In2 after 5 ns when S0='0' and S1='1' and S2='0' else
         In3 after 5 ns when S0='0' and S1='1' and S2='1' else
         In4 after 5 ns when S0='1' and S1='0' and S2='0' else
         In5 after 5 ns when S0='1' and S1='0' and S2='1' else
         In6 after 5 ns when S0='1' and S1='1' and S2='0' else
         In7 after 5 ns when S0='1' and S1='1' and S2='1' else
         in8 after 5 ns when S0='0' and S1='0' and S2='0' and S3='1' else 
         "0000000000000000" after 5 ns;
    end Behavioral;
