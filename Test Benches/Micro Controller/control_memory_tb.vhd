----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 16:30:32
-- Design Name: 
-- Module Name: control_memory_tb - Behavioral
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

entity control_memory_tb is
end control_memory_tb;

architecture behaviour of control_memory_tb is

    component control_memory is
        port( MW : out std_logic;
       MM : out std_logic;
       RW : out std_logic;
       MD : out std_logic;
       FS : out std_logic_vector(4 downto 0);
       MB : out std_logic;
       TB : out std_logic;
       TA : out std_logic;
       TD : out std_logic;
       PL : out std_logic;
       PI : out std_logic;
       IL : out std_logic;
       MC : out std_logic;
       MS : out std_logic_vector(2 downto 0);
       NA : out std_logic_vector(7 downto 0);
       IN_CAR : in std_logic_vector(7 downto 0));
    end component;

    -- Input Signals
    signal IN_CAR : std_logic_vector(7 downto 0);
    
    -- Output Signals
    signal MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : std_logic;
    signal fs : std_logic_vector(4 downto 0);
    signal MS : std_logic_vector (2 downto 0);
    signal NA : std_logic_vector (7 downto 0);
    
    -- Constants
    constant clock_cycle : time := 20ns;

begin

    uut : control_memory port map( IN_CAR => IN_CAR,
                                   MW => MW,
                                   MM => MM,
                                   RW => RW,
                                   MD => MD,
                                   MB => MB,
                                   TB => TB,
                                   TA => TA,
                                   TD => TD,
                                   PL => PL,
                                   PI => PI,
                                   IL => IL,
                                   MC => MC,
                                   FS => FS,
                                   MS => MS,
                                   NA => NA
                                   );

    simulation : process
    begin
        IN_CAR <= "00000000";
        wait for clock_cycle;
        IN_CAR <= "00000001";
        wait for clock_cycle;
        IN_CAR <= "00000010";
        wait for clock_cycle;
        IN_CAR <= "00000011";
        wait for clock_cycle;
        IN_CAR <= "00000100";
        wait for clock_cycle;
        IN_CAR <= "00000101";
        wait for clock_cycle;
        IN_CAR <= "00000110";
        wait for clock_cycle;
        IN_CAR <= "00000111";
        wait for clock_cycle;
        IN_CAR <= "00001000";
        wait for clock_cycle;
        IN_CAR <= "00001001";
        wait for clock_cycle;
        IN_CAR <= "00001010";
        wait for clock_cycle;
        IN_CAR <= "00001011";
        wait for clock_cycle;
        IN_CAR <= "00001100";
        wait for clock_cycle;
        IN_CAR <= "00001101";
        wait for clock_cycle;
        IN_CAR <= "00001110";
        wait for clock_cycle;
        IN_CAR <= "00001111";
        wait for clock_cycle;
        IN_CAR <= "00010000";
        wait for clock_cycle;
        std.env.stop;
    end process;

end behaviour;