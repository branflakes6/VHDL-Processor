----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 9.03.2020 20:34:41
-- Design Name: 
-- Module Name: Arithmetic_circuit_tb - Behavioral
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
entity Arithmetic_circuit_tb is
end;

architecture Behavioral of Arithmetic_circuit_tb is

  component arithmetic_circuit
      Port ( A : in std_logic;
             B : in std_logic;
             Cin : in std_logic;
             S0 : in std_logic;
             S1 : in std_logic;
             Art_out : out std_logic;
             Cout : out std_logic);
  end component;
  
 -- inputs
  signal A: std_logic := '0';
  signal B: std_logic := '0';
  signal Cin: std_logic := '0'; 
  signal S0: std_logic := '0';
  signal S1: std_logic :='0';
  
  --outputs
  signal Art_out: std_logic;
  signal Cout: std_logic;
  
begin

  uut: arithmetic_circuit port map ( 
    A => A,
    B => B,
    Cin => Cin,
    S0 => S0,
    S1 => S1,
    Art_out => Art_out,
    Cout => Cout
    );

  stim_proc: process
      begin
      wait for 10ns;
      A <= '1';
      wait for 10ns;
      B <= '1';
      wait for 10ns;
      S0 <= '1';
      wait for 10ns;
      S1 <= '1';
      wait for 10ns;
      S0 <= '0';
      wait for 10ns;
      S0 <= '0';
      S1 <= '1';
      wait for 10ns;
      Cin <= '1';
      wait for 10ns;
      A <= '0';
      wait for 10ns;
      S0 <= '1';
      S1 <= '0';
      wait for 10ns;
      A <= '1';
      wait for 10ns;
      B <= '0';
      wait for 10ns;
      S0 <= '1';
      wait for 10ns;
      S1 <= '1';
      wait for 10ns;
      S0 <= '0';
      wait for 10ns;
      S0 <= '0';
      S1 <= '1';
      wait for 10ns;
      Cin <= '1';
      wait for 10ns;
    end process;

end Behavioral;