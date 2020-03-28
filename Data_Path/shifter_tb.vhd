----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 18:09:15
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity Shifter_tb is
end Shifter_tb;

architecture Behavioral of Shifter_tb is

    component Shifter 
      Port ( 
        b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        in_left, in_right : in std_logic;
        h : out std_logic_vector(15 downto 0)
        );
    end component;
    signal b, h : std_logic_vector(15 downto 0);
    signal s : std_logic_vector(1 downto 0);
    signal in_left, in_right : std_logic;
    
begin

     uut: Shifter port map (
          b => b,
          s => s,
          in_left => in_left,
          in_right => in_right,
          h => h
        );

   stim_proc: process
   begin
   in_left <= '0';
   in_right <= '0';
   b <= "1111111111111111";
   s <= "00";
   wait for 10 ns;
   s <= "01";
   wait for 10 ns;
   s <= "10";
   wait for 10 ns;
   end process;

end Behavioral;