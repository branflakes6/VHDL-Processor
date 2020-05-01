----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 06:33:57 PM
-- Design Name: 
-- Module Name: decoder3to8_tb - Behavioral
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

entity decoder3to8_tb is
end decoder3to8_tb;

architecture Behavioral of decoder3to8_tb is

component decoder3to8 
    port(
         A0, A1, A2 : in std_logic;
         D0,D1,D2,D3,D4,D5,D6,D7: out std_logic);
end component;

--Inputs
    signal A0, A1, A2 : std_logic;

--Outputs
signal  D0,D1,D2,D3,D4,D5,D6,D7: std_logic;

begin

    uut: decoder3to8 port map (A0 => A0,
                               A1 => A1,
                               A2 => A2,                    
                               D0 => D0,   
                               D1 => D1, 
                               D2 => D2, 
                               D3 => D3,
                               D4 => D4, 
                               D5 => D5, 
                               D6 => D6,
                               D7 => D7);
                               
    stim_proc: process
    begin
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        wait for 5ns;
        A0 <= '0';
        A1 <= '0';
        A2 <= '1';
        wait for 5ns;
        A0 <= '0';
        A1 <= '1';
        A2 <= '0';
        wait for 5ns;
        A0 <= '0';
        A1 <= '1';
        A2 <= '1';
        wait for 5ns;
        A0 <= '1';
        A1 <= '0';
        A2 <= '0';
        wait for 5ns;
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        wait for 5ns;
        A0 <= '1';
        A1 <= '1';
        A2 <= '0';
        wait for 5ns;
        A0 <= '1';
        A1 <= '1';
        A2 <= '1';
        wait for 5ns;
     end process;   
        
            
end Behavioral;
