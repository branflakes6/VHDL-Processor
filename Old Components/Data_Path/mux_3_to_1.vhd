----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 12:24:01
-- Design Name: 
-- Module Name: mux_3_to_1 - Behavioral
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

entity mux_3_to_1 is
    Port ( S : in std_logic_vector (1 downto 0);
           in0, in1, in2 : in std_logic;
           Z : out STD_LOGIC);
end mux_3_to_1;
architecture Behavioral of mux_3_to_1 is

begin
    Z <=  in0 after 1ns when S = "00" else
          in1 after 1ns when S = "01" else
          in2 after 1ns when S = "10" else
          '0' after 1ns;
end Behavioral;