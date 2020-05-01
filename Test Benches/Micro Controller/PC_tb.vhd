----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 12:42:59
-- Design Name: 
-- Module Name: PC_tb - Behavioral
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

entity PC_tb is
end PC_tb;

architecture Behavioral of PC_tb is

component program_counter
    Port ( PI, PL, reset, clock : in std_logic;
       offset : in std_logic_vector (15 downto 0);
       PC_out : out std_logic_vector(15 downto 0)
           );
  end component;

  signal PL: std_logic := '0';
  signal PI: std_logic := '0';
  signal clock: std_logic := '0';
  signal offset: std_logic_vector (15 downto 0) := x"0004";
  signal PC_out: std_logic_vector (15 downto 0) ;
  signal reset: std_logic := '1' ;
begin
  
  uut: program_counter port map ( PL           => PL,
                                  PI           => PI,
                                  clock          => clock,
                                  offset => offset,
                                  PC_out    => PC_out,
                                  reset        => reset
                                   );
  clk : process
  begin
    wait for 50ns;
    clock <= not clock;
  end process;
  
  stim: process
  begin
    wait for 100ns;
    Reset <= '0';
    wait for 100ns;
    PI <= '1';
    wait for 100ns;
    wait for 100ns;
    PI <= '0';
    PL <= '1';
    wait for 100ns;
    PL <= '0';
    PI <= '1';
    wait for 100ns;
    wait;
  end process;

end Behavioral;
