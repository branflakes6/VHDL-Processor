----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2020 22:57:17
-- Design Name: 
-- Module Name: ALU_bit_slice_tb - Behavioral
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
entity ALU_bit_slice_tb is
end ALU_bit_slice_tb;

architecture Behavioral of ALU_bit_slice_tb is
component ALU_bit_slice
      Port ( A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cout : out std_logic;
           ALU_out : out std_logic);
  end component;
  --inputs
  signal A: std_logic := '1';
  signal B: std_logic := '1';
  signal Cin: std_logic := '0';
  signal S0: std_logic := '0';
  signal S1: std_logic := '0';
  signal S2: std_logic := '0'; 
  --outputs
  signal Cout: std_logic;
  signal ALU_out: std_logic;
 
begin
  uut: ALU_bit_slice port map ( 
    A => A,
    B => B,
    Cin => Cin,
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => Cout,
    ALU_out => ALU_out 
    );

  stim_proc: process
     begin
        wait for 10ns;
        Cin <= '1';
        wait for 10ns;
        Cin <= '0';
        S0 <= '1';
        wait for 10ns;
        B <= '0';
        wait for 10ns;
        S0 <= '0';
        S1 <= '1';
        wait for 10ns;
        Cin <= '1';
        wait for 10ns;
        Cin <= '0';
        S0 <= '1';
        wait for 10ns;
        Cin <= '1';
        wait for 10ns;
        Cin <= '0';
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 10ns;
        B <= '1';
        wait for 10ns;
        S0 <= '1';
        wait for 10ns;
        B <= '0';
        wait for 10ns;
        A <= '0';
        wait for 10ns;
        S1 <= '1';
        S0 <= '0';
        wait for 10ns;
        A <= '1';
        wait for 10ns;
        S0 <= '1';
        wait;
  end process;

end Behavioral;
