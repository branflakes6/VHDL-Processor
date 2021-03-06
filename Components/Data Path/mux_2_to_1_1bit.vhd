----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2020 21:01:35
-- Design Name: 
-- Module Name: mux_2_to_1_1bit - Behavioral
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

entity mux_2_to_1_1bit is
    Port ( in0 : in std_logic;
           in1 : in std_logic;
           S : in std_logic;
           Z : out std_logic
           );
end mux_2_to_1_1bit;

architecture Behavioral of mux_2_to_1_1bit is
begin
    Z <= in0 after 1ns when S ='0' else
         in1 after 1ns when S ='1' else
         '0' after 1ns;
end Behavioral;