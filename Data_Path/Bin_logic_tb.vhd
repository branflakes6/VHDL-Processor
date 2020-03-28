----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2020 21:26:37
-- Design Name: 
-- Module Name: Bin_logic_tb - Behavioral
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

entity Bin_logic_tb is
end;

architecture Behavioral of Bin_logic_tb is

  component Bin_logic
      Port ( B : in std_logic;
             S0 : in std_logic;
             S1 : in std_logic;
             Bout : out std_logic);
  end component;
  --inputs 
  signal B: std_logic := '0';
  signal S0: std_logic := '0';
  signal S1: std_logic := '0';
  -- output
  signal Bout: std_logic;

begin

  uut: Bin_logic port map ( 
    B  => B,
    S0 => S0,
    S1 => S1,
    Bout  => Bout 
    );

stim_proc: process
     begin
        wait for 10ns;
        B <= '1';
        wait for 10ns;
        S0 <= '1';
        wait for 10ns;
        S1 <= '1';
        S0 <= '0';
        wait for 10ns;
        S0 <= '1';
        wait for 10ns;
        S1 <= '0';
        B <= '0';    
        wait for 10ns;
        S1 <= '1';
        S0 <= '0';      
        wait;
     end process;

end Behavioral;