----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 15:52:22
-- Design Name: 
-- Module Name: micro_control_tb - Behavioral
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

entity micro_controller_tb is
end micro_controller_tb;

architecture behaviour of micro_controller_tb is

    component micro_control is
        port( 
        intstruction_reg_in : in std_logic_vector (15 downto 0);
        V,C,N,Z, reset, clock : in std_logic; 
        PC_out  : out std_logic_vector(15 downto 0);
        data_control : out std_logic_vector (19 downto 0);       
        address_select, memory_load : out std_logic;
        fill_out : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Input Signals
    signal clock : std_logic := '0';
    signal reset : std_logic := '1';
    signal c, v, n, z : std_logic;
    signal intstruction_reg_in : std_logic_vector(15 downto 0);
    
    -- Output Signals
    signal data_control : std_logic_vector(19 downto 0);
    signal address_select, memory_load : std_logic;
    signal PC_out : std_logic_vector(15 downto 0);
    
    -- Constants
    constant clock_cycle : time := 30ns;

begin

    uut : micro_control port map( 
                                     clock => clock,
                                     reset => reset,
                                     c => c,
                                     v => v,
                                     n => n,
                                     z => z,
                                     intstruction_reg_in => intstruction_reg_in,
                                     data_control => data_control,
                                     address_select => address_select,
                                     memory_load => memory_load,
                                     PC_out => PC_out);

    clck : process
    begin
        wait for clock_cycle / 2;
        clock <= not clock;
    end process;

    simulation : process
    begin
        wait for clock_cycle;
        reset <= '0';
        intstruction_reg_in <= x"0000";
        c <= '0';
        v <= '1';
        n <= '1';
        z <= '0';
        wait for clock_cycle;
        intstruction_reg_in <= x"0001";
        wait for clock_cycle;
        intstruction_reg_in <= x"0002";
        wait for clock_cycle;
        intstruction_reg_in <= x"0003";
        wait for clock_cycle;
        intstruction_reg_in <= x"0004";
        wait for clock_cycle;
        std.env.stop;
    end process;
        

end behaviour;