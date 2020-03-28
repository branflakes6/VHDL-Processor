----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 07:59:57 PM
-- Design Name: 
-- Module Name: mux8_to_16_tb - Behavioral
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

entity mux8_to_16_tb is
end mux8_to_16_tb;

architecture Behavioral of mux8_to_16_tb is

component mux8_to_16 
Port ( 
    In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
    S0, S1, S2 : in std_logic;
    Z : out std_logic_vector(15 downto 0)
     );
end component;

--Inputs
    signal In0, In1, In2, In3, In4, In5, In6, In7 : std_logic_vector(15 downto 0);
    signal S0, S1, S2 : std_logic;

--Outputs
    signal  Z : std_logic_vector(15 downto 0);

begin

    uut: mux8_to_16  port map (In0 => In0,
                               In1 => In1,
                               In2 => In2,
                               In3 => In3,
                               In4 => In4,
                               In5 => In5,
                               In6 => In6,
                               In7 => In7,
                               S0 => S0,
                               S1 => S1,
                               S2 => S2,
                               z => z);
                               
    stim_proc: process
    begin
 
        In0 <= "0000000000000000";
        In1 <= "0000000000000001";
        In2 <= "0000000000000010";
        In3 <= "0000000000000011";
        In4 <="0000000000000100";
        In5 <= "0000000000000101";
        In6 <= "0000000000000110";
        In7 <= "0000000000000111";
        wait for 10ns;
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 10ns;
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 10ns;
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 10ns;
        S0 <= '0';
        S1 <= '1';
        S2 <= '1';
        wait for 10ns;
        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 10ns;
        S0 <= '1';
        S1 <= '0';
        S2 <= '1';
        wait for 10ns;
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 10ns;
        S0 <= '1';
        S1 <= '1';
        S2 <= '1';
       end process;
end Behavioral;
