----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 13:35:53
-- Design Name: 
-- Module Name: mux2_to_1_8bit - Behavioral
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

entity mux2_to_1_8bit is
    Port ( in0 : in std_logic_vector (7 downto 0);
           in1 : in std_logic_vector (7 downto 0);
           S : in std_logic;
           Z : out std_logic_vector (7 downto 0)
           );
end mux2_to_1_8bit;

architecture Behavioral of mux2_to_1_8bit is
begin
    Z <= in0 after 1ns when S ='0' else
         in1 after 1ns when S ='1' else
         "00000000" after 1ns;
end Behavioral;