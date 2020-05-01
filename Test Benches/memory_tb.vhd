----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 17:06:59
-- Design Name: 
-- Module Name: memory_tb - Behavioral
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

entity memory_tb is
end memory_tb;

architecture Behavioral of memory_tb is
        component memory is
        port(
            address, data_in : in std_logic_vector(15 downto 0);
            load : in std_logic;
            data_out : out std_logic_vector(15 downto 0)
            );        
         end component;
         signal address, data_in : std_logic_vector(15 downto 0);
         signal load : std_logic;
         signal data_out : std_logic_vector (15 downto 0);
         
begin
        uut: memory port map (
                                address => address,
                                data_in => data_in,
                                load => load,
                                data_out => data_out
                                );
simulation : process
begin
        data_in <= x"9999";
        address <= x"0000";
        load <= '0';
        wait for 20ns;
        address <= x"0001";
        wait for 20ns;
        address <= x"0002";
        wait for 20ns;
        address <= x"0001";
        load <= '1';
        wait for 20ns;
        std.env.stop;
end process;
end Behavioral;
