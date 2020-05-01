----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 02:06:36
-- Design Name: 
-- Module Name: condition_mux - Behavioral
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

entity condition_mux is
    Port ( 
    C, V, Z, N : in std_logic;
    S : in std_logic_vector (2 downto 0);
    mux_out : out std_logic
    );
    end condition_mux;
    
    architecture Behavioral of condition_mux is
    begin
    mux_out <= '0' after 1ns when S = "000" else
              '1' after 1ns when S = "001" else
              C after 1ns when S = "010" else
              V after 1ns when S = "011" else
              Z after 1ns when S = "100" else
              N after 1ns when S = "101" else
              not C after 1ns when S = "110" else
              not Z after 1ns when S = "111" else
              '0' after 1ns;
    end Behavioral;
