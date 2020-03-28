----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2020 02:53:22
-- Design Name: 
-- Module Name: shifter_4bit - Behavioral
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

entity shifter_4bit is
    Port ( B0 : in std_logic;
           B1 : in std_logic;
           B2 : in std_logic;
           B3 : in std_logic;
           Lr : in std_logic;
           Ll : in std_logic;
           S : in std_logic_vector (1 downto 0);
           H0 : out std_logic;
           H1 : out std_logic;
           H2 : out std_logic;
           H3 : out std_logic;
           OutR : out std_logic;
           OutL : out std_logic
           );
end shifter_4bit;

architecture Behavioral of shifter_4bit is
    component mux_3_to_1 is
        Port ( 
           S : in std_logic_vector(1 downto 0);
           in0 : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           Z : out std_logic
           );  
    end component;
begin

    mux1 : mux_3_to_1 port map(
        S => S,
        in0 => B0,
        in1 => B1,
        in2 => Ll,
        Z => H0 
    );
    mux2 : mux_3_to_1 port map(
        S => S,
        in0 => B1,
        in1 => B2,
        in2 => B0,
        Z => H1
    );
    mux3 : mux_3_to_1 port map(
        S => S,
        in0 => B2,
        in1 => B3,
        in2 => B1,
        Z => H2
    );
    mux4 : mux_3_to_1 port map(
        S => S,
        in0 => B3,
        in1 => Lr,
        in2 => B2,
        Z => H3
    );
    OutR <= B0;
    OutL <= B3;

end Behavioral;
