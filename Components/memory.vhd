----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 21:24:56
-- Design Name: 
-- Module Name: memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity memory is
    port( 
        address, data_in : in std_logic_vector(15 downto 0);
          load : in std_logic;
          data_out : out std_logic_vector(15 downto 0));
end memory;

architecture behaviour of memory is

    -- Constants
    constant gate_delay : time := 1ns;

    type mem is array(0 to 511) of std_logic_vector(15 downto 0);
    
    signal m : mem :=(
                        0 => x"0A05",   -- ADI r0, r0, #5
                        1 => X"04C0",   -- ADI r3, r3, #1
                        2 => x"0003",   -- ADD r0, r3, r0
                        3 => x"0B14",   -- ADI r4, r4, #2
                        4 => x"1004",   -- SUB R0, R0, R4
                        5 => x"0690",   -- INC R2, R2
                        6 => x"0803",  -- NOT R0, R0, R3
                        7 => X"0B6D",   -- ADI R5, R5, #5
                        8 => X"0268",   -- LD R1, [R5]
                        9 => X"04C0",    -- SR R0, R0, R0
                                
                        others => x"0500");
begin

    mem_process : process(address, load) is
    begin
        if load = '1' then
            m(to_integer(unsigned(address(8 downto 0)))) <= data_in;
        end if;
        data_out <= m(to_integer(unsigned(address(8 downto 0)))) after gate_delay;
    end process;


end behaviour;