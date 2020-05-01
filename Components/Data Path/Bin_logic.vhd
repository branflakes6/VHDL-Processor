----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2020 18:02:20
-- Design Name: 
-- Module Name: Bin_logic - Behavioral
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

entity Bin_logic is
    Port(
        B : in std_logic;
        S0 : in std_logic;
        S1 : in std_logic;
        Bout : out std_logic
        );
end Bin_logic;

architecture Behavioral of Bin_logic is
begin
            Bout <= '0' after 1ns when S0 = '0' and S1 = '0' else
                B after 1ns when S0 = '1' and S1 = '0' else
                (NOT B) after 1ns when S0 = '0' and S1 = '1' else
                '1' after 1ns when S0 = '1' and S1 = '1' else
                '0' after 1ns;
end Behavioral;
