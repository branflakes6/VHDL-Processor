----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2020 23:21:52
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
component ALU
      Port ( A : in std_logic_vector (15 downto 0);
             B : in std_logic_vector (15 downto 0);
             S0 : in std_logic;
             S1 : in std_logic;
             S2 : in std_logic;
             Sum_out : out std_logic_vector (15 downto 0);
             Cin : in std_logic;
             Cout_final : out std_logic);
  end component;

  --inputs
  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal S0: std_logic := '0';
  signal S1: std_logic := '0';
  signal S2: std_logic := '0';
  signal Cin: std_logic := '0';
  
  --outputs
  signal Sum_out: std_logic_vector (15 downto 0);
  signal Cout_final: std_logic;


begin

  uut: ALU port map ( 
        A => A,
        B => B,
        S0 => S0,
        S1  => S1,
        S2 => S2,
        Sum_out => Sum_out,
        Cin => Cin,
        Cout_final => Cout_final 
        );

  stimul: process
  begin
    wait for 10ns;
    A <= "0000000011111111";
    B <= "1111111100000000";
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    S0 <= '0';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '0';
    S2 <= '1';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '0';
    wait for 10ns;
    S0 <= '1';
    S1 <= '1';
    S2 <= '1';
    wait for 10ns;
    wait;
  end process;
end Behavioral;