----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2020 17:15:41
-- Design Name: 
-- Module Name: mux2_to_1_tb - Behavioral
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

entity mux2_to_1_tb is
end mux2_to_1_tb;

architecture Behavioral of mux2_to_1_tb is

component mux2_to_1 
    port ( 
    In0 : in std_logic_vector(15 downto 0);
    In1 : in std_logic_vector(15 downto 0);
    s : in std_logic;
    Z : out std_logic_vector(15 downto 0)
    );
    end component;
    
    --inputs
    signal In0, In1: std_logic_vector(15 downto 0);
    signal s: std_logic;
    --outputs
    signal Z :  std_logic_vector(15 downto 0);
    
    begin
    uut: mux2_to_1 port map(
                            In0=>In0,
                            In1=>In1,
                            s=>s,
                            Z=>z
                            );
    
    stim_proc: process
    begin
    In0<="0000000000000000";
    In1<="0000000000000001";
    wait for 5ns;
    s<='1';
    wait for 5ns;
    s<='0';
    end process;
    
 end Behavioral;
    
    
