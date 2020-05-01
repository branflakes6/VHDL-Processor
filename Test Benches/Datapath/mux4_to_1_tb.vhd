----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 9.03.2020 22:39:50
-- Design Name: 
-- Module Name: mux4_to_1_tb - Behavioral
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

entity mux4_to_1_tb is
end;

architecture Behavioral of mux4_to_1_tb is

  component mux4_to_1
      Port ( S0 : in std_logic;
             S1 : in std_logic;
             in0 : in std_logic;
             in1 : in std_logic;
             in2 : in std_logic;
             in3 : in std_logic;
             Mux4_out : out std_logic);
  end component;
  
  -- input
  signal S0: std_logic := '0';
  signal S1: std_logic := '0';
  signal in0: std_logic := '1';
  signal in1: std_logic := '1';
  signal in2: std_logic := '1';
  signal in3: std_logic := '1';
  
  -- output
  signal Mux4_out: std_logic;
  

begin

  uut: mux4_to_1 port map ( 
        S0 => S0,
        S1 => S1,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        Mux4_out => Mux4_out
        );

  stim_proc: process
      begin
        wait for 10ns;
        in0 <= '0';
        wait for 10ns;
        S0 <= '1';
        wait for 10ns;
        in1 <= '0';
        wait for 10ns;
        S1 <= '1';
        wait for 10ns;
        in3 <= '0';
        wait for 10ns;
        S0 <= '0';
        wait for 10ns;
        in2 <= '0';
        wait;
  end process;


end Behavioral;