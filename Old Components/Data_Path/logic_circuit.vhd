----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 19:23:53
-- Design Name: 
-- Module Name: logic_circuit - Behavioral
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

entity logic_circuit is
    Port ( A : in std_logic;
           B : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           Logic_out : out std_logic);
end logic_circuit;

architecture Behavioral of logic_circuit is
    component mux4_to_1 is
        Port ( S0 : in std_logic;
           S1 : in std_logic;
           in0 : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           in3 : in std_logic;
           Mux4_out : out std_logic);   
    end component;
    
    signal and_out : std_logic;
    signal or_out : std_logic;
    signal xor_out : std_logic;
    signal not_out : std_logic;

begin
    mux : mux4_to_1 port map(
        S0 => S0,
        S1 => S1,
        in0 => and_out,
        in1 => or_out,
        in2 => xor_out,
        in3 => not_out,
        Mux4_out => Logic_out
        );        
    and_out <= A and B after 1ns;
    or_out <= A or B after 1ns;
    xor_out <= A xor B after 1ns;
    not_out <= not A after 1ns;

end Behavioral;