----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 02:39:42
-- Design Name: 
-- Module Name: CAR_tb - Behavioral
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
use IEEE.Std_logic_1164.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAR_tb is
end CAR_tb;
    
    architecture behav of CAR_tb is

   component CAR
    port(
        op_in : in std_logic_vector(7 downto 0);
        clock, reset, sel : in std_logic;
        car_out : out std_logic_vector(7 downto 0)
    );
    end component;
    
    signal op_in : std_logic_vector(7 downto 0) := x"10";
    signal clock : std_logic := '0';
    signal sel : std_logic := '0';
    signal reset : std_logic := '1';
    signal car_out : std_logic_vector(7 downto 0) := x"00";
    
begin

  uut: CAR port map ( op_in => op_in,
                      car_out => car_out,
                      sel => sel,
                      clock => clock,
                      reset => reset 
                   );

  clk : process
  begin
    wait for 25ns;
    clock <= not clock;
  end process;
  
  stim: process
  begin
    wait for 50ns;
    reset <= '0';
    wait for 50ns;
    wait for 50ns;
    wait for 50ns;
    sel <= '1';
    wait for 50ns;
    sel <= '0';
    wait for 50ns;
    wait;
  end process;
end behav;