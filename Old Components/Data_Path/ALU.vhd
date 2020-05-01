----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2020 16:39:11
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cin : in std_logic;
           Sum_out : out std_logic_vector (15 downto 0);           
           Cout_final : out std_logic);
end ALU;

architecture Behavioral of ALU is
    component ALU_bit_slice is
        Port ( A : in std_logic;
           B : in std_logic;
           Cin : in std_logic;
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cout : out std_logic;
           ALU_out : out std_logic
           );
           
    end component;
    signal cout : std_logic_vector (15 downto 0);
   
begin
    bit0 : ALU_bit_slice port map(
        A => A(0),
        B => B(0),
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(0),
        ALU_out => Sum_out(0)
    );
    bit1 : ALU_bit_slice port map(
        A => A(1),
        B => B(1),
        Cin => cout(0),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(1),
        ALU_out => Sum_out(1)
    );
    bit2 : ALU_bit_slice port map(
        A => A(2),
        B => B(2),
        Cin => cout(1),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(2),
        ALU_out => Sum_out(2)
    );
    bit3 : ALU_bit_slice port map(
        A => A(3),
        B => B(3),
        Cin => cout(2),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(3),
        ALU_out => Sum_out(3)
    );
    bit4 : ALU_bit_slice port map(
        A => A(4),
        B => B(4),
        Cin => cout(3),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(4),
        ALU_out => Sum_out(4)
    );
    bit5 : ALU_bit_slice port map(
        A => A(5),
        B => B(5),
        Cin => cout(4),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(5),
        ALU_out => Sum_out(5)
    );
    bit6 : ALU_bit_slice port map(
        A => A(6),
        B => B(6),
        Cin => cout(5),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(6),
        ALU_out => Sum_out(6)
    );
    bit7 : ALU_bit_slice port map(
        A => A(7),
        B => B(7),
        Cin => cout(6),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(7),
        ALU_out => Sum_out(7)
    );
    bit8 : ALU_bit_slice port map(
        A => A(8),
        B => B(8),
        Cin => cout(7),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(8),
        ALU_out => Sum_out(8)
    );
    bit9 : ALU_bit_slice port map(
        A => A(9),
        B => B(9),
        Cin => cout(8),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(9),
        ALU_out => Sum_out(9)
    );
    bit10 : ALU_bit_slice port map(
        A => A(10),
        B => B(10),
        Cin => cout(9),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(10),
        ALU_out => Sum_out(10)
    );
    bit11 : ALU_bit_slice port map(
        A => A(11),
        B => B(11),
        Cin => cout(10),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(11),
        ALU_out => Sum_out(11)
    );
    bit12 : ALU_bit_slice port map(
        A => A(12),
        B => B(12),
        Cin => cout(11),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(12),
        ALU_out => Sum_out(12)
    );
    bit13 : ALU_bit_slice port map(
        A => A(13),
        B => B(13),
        Cin => cout(12),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(13),
        ALU_out => Sum_out(13)
    );
    bit14 : ALU_bit_slice port map(
        A => A(14),
        B => B(14),
        Cin => cout(13),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => cout(14),
        ALU_out => Sum_out(14)
    );
    bit15 : ALU_bit_slice port map(
        A => A(15),
        B => B(15),
        Cin => cout(14),
        S0 => S0,
        S1 => S1,
        S2 => S2,
        Cout => Cout_final,
        ALU_out => Sum_out(15)
    );
end Behavioral;
