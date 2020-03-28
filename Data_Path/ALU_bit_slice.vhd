----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2020 16:35:24
-- Design Name: 
-- Module Name: ALU_bit_slice - Behavioral
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

entity ALU_bit_slice is
    Port ( A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cout : out std_logic;
           ALU_out : out std_logic
           );
end ALU_bit_slice;

architecture Behavioral of ALU_bit_slice is

    component Arithmetic_circuit is
        Port ( A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           Art_out : out std_logic;
           Cout : out std_logic);
    end component;
    component logic_circuit is
        Port ( A : in std_logic;
           B : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           Logic_out : out std_logic);  
    end component;
    component mux_2_to_1_1bit is
        Port ( in0 : in std_logic;
           in1 : in std_logic;
           S : in std_logic;
           Z : out std_logic);
    end component;
    signal Art_out : std_logic;
    signal logic_out : std_logic;
    
begin
    Arithmetic : arithmetic_circuit port map(
        A => A,
        B => B,
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        Art_out => Art_out,
        Cout => Cout
    );
    Logic : logic_circuit port map(
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        logic_out => logic_out
    );
   Mux : mux_2_to_1_1bit port map(
        in0 => Art_out,
        in1 => logic_out,
        S => S2,
        Z => ALU_out
    );
end Behavioral;
