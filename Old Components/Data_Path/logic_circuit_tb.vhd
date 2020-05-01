----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 21:01:31
-- Design Name: 
-- Module Name: logic_circuit_tb - Behavioral
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

entity logic_circuit_tb is
end;

architecture Behavioral of logic_circuit_tb is

  component logic_circuit
      Port ( A : in std_logic;
             B : in std_logic;
             S0 : in std_logic;
             S1 : in std_logic;
             Logic_out : out std_logic);
  end component;
  -- inputs
  signal A: std_logic := '0';
  signal B: std_logic := '0';
  signal S0: std_logic := '0';
  signal S1: std_logic := '0';  
  -- output
  signal Logic_out: std_logic;

begin
  uut: logic_circuit port map ( 
    A  => A,
    B  => B,
    S0 => S0,
    S1 => S1,
    Logic_out  => Logic_out
    );

  stim_proc: process
    begin
     wait for 5ns;
     A <= '1';
     wait for 5ns;
     B <= '1';
     wait for 5ns;
     S0 <= '0';
     S1 <= '0';
     wait for 5ns;
     S0 <= '0';
     S1 <= '1';
     wait for 5ns;
     S0 <= '1';
     S1 <= '0';
     wait for 5ns;
     S0 <= '1';
     S1 <= '1';
     wait for 5ns;
     A <= '1';
     wait for 5ns;
     B <= '0';
     wait for 5ns;
     S0 <= '0';
     S1 <= '0';
     wait for 5ns;
     S0 <= '0';
     S1 <= '1';
     wait for 5ns;
     S0 <= '1';
     S1 <= '0';
     wait for 5ns;
     S0 <= '1';
     S1 <= '1';
     wait for 5ns;
  end process;

end Behavioral;