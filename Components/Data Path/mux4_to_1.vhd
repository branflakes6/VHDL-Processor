----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 9.03.2020 22:22:34
-- Design Name: 
-- Module Name: mux4_to_1 - Behavioral
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

entity mux4_to_1 is
    Port ( S0 : in std_logic;
           S1 : in std_logic;
           in0 : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           in3 : in std_logic;
           Mux4_out : out std_logic);
end mux4_to_1;

architecture Behavioral of mux4_to_1 is

begin
    Mux4_out <= in0 after 1ns when S0 = '0' and S1 = '0' else
          in1 after 1ns when S0 = '1' and S1 = '0' else
          in2 after 1ns when S0 = '0' and S1 = '1' else
          in3 after 1ns when S0 = '1' and S1 = '1' else
          '0' after 1ns;

end Behavioral;