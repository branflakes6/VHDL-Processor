----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 19:01:43
-- Design Name: 
-- Module Name: processor_tb - Behavioral
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

entity processor_tb is
end processor_tb;

architecture behaviour of processor_tb is

    component processor is
        port( clock, reset : in std_logic;
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0)
        );
    end component;
    
    -- Input Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 64ns;
    
begin

    uut : processor port map( clock => clk,
                            reset => reset,
                            reg0=>reg0,
        reg1=>reg1,
        reg2=>reg2,
        reg3=>reg3,
        reg4=>reg4,
        reg5=>reg5,
        reg6=>reg6,
        reg7=>reg7);

   clock : process
    begin
        wait for clock_cycle / 2;
        clk <= not clk;
    end process;
    
    simulation : process
    begin
        wait for clock_cycle / 3;
        reset <= '0';
        wait for 10000ns;
        std.env.stop;
        wait;
    end process;

end behaviour;