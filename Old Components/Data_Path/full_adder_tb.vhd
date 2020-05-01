----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2020 18:02:33
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    component full_adder
    port ( X, Y, Cin : in std_logic;
       s, Cout : out std_logic
       ); 
    end component;
    --inputs
    signal  X, Y, Cin : std_logic;
    --outputs
    signal s, Cout : std_logic;

begin
    uut:
    full_adder port map (
                X => X,
                Y => Y,
                Cin => Cin,
                Cout => Cout,
                s => s );
                
    stim_proc: process
    begin
    X <= '0';
    Y <= '0';
    Cin <= '0';
    wait for 5 ns;
    X <= '1';
    wait for 5 ns;
    Y <= '1';
    wait for 5 ns;
    Cin <= '1';
    wait for 5 ns;
    Y <= '0';
    wait for 5 ns;
    X <= '0';
    wait for 5 ns;
    Y <= '1';
    wait for 5 ns;
    Cin <= '0';
    wait for 5 ns;
    end process; 

end Behavioral;
