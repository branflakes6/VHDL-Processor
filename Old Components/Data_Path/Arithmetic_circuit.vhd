----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 9.03.2020 19:12:41
-- Design Name: 
-- Module Name: Arithmetic_circuit - Behavioral
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

entity Arithmetic_circuit is
    Port(
           A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           Art_out : out std_logic;
           Cout : out std_logic
           );
end Arithmetic_circuit;

architecture Behavioral of Arithmetic_circuit is
       --B input logic
     component Bin_logic is
        Port( B : in std_logic;
              S0 : in std_logic;
              S1 : in std_logic;
              Bout : out std_logic);
    end component;
    
    component full_adder is
        Port ( X : in std_logic;
               Y : in std_logic;
               Cin : in std_logic;
               S : out std_logic;
               Cout : out std_logic);
    end component;
    
    signal Bout: std_logic;
    
begin
    --port maping
     b_input : Bin_logic port map(
        B => B,
        S0 => S0,
        S1 => S1,
        Bout =>Bout
    );
    f_adder : full_adder port map(
        X => A,
        Y => Bout,
        Cin => Cin,
        Cout => Cout,
        s => Art_out
    );   
end Behavioral;
