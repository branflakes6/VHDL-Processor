----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2020 02:13:47
-- Design Name: 
-- Module Name: mux_3_to_1_tb - Behavioral
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

entity mux_3_to_1_tb is
end mux_3_to_1_tb;

architecture Behavioral of mux_3_to_1_tb is
component mux_3_to_1
      Port ( S : in std_logic_vector (1 downto 0);
             in0 : in std_logic;
             in1 : in std_logic;
             in2 : in std_logic;
             Z : out std_logic
             );
  end component;
  -- input
  signal S: STD_LOGIC_VECTOR (1 downto 0);
  signal in0: std_logic;
  signal in1: std_logic;
  signal in2: std_logic;
  -- output
  signal Z: std_logic;
begin
  uut: mux_3_to_1 port map ( 
        S  => S,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        Z  => Z 
   );

  stim_proc: process
     begin
        wait for 10ns;
        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        wait for 10ns;
        S <= "00";
        wait for 10ns;
        S <= "01";
        wait for 10ns;
        S <= "10";
        wait for 10ns;
  end process;
end Behavioral;