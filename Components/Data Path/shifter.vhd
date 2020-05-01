----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2020 16:18:29
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity Shifter is
  Port ( 
    b : in std_logic_vector(15 downto 0);
    s : in std_logic_vector(1 downto 0);
    in_left, in_right : in std_logic;
    h : out std_logic_vector(15 downto 0)
  );
end Shifter;

architecture Behavioral of Shifter is
    component mux_3_to_1 is
      Port ( 
        in0, in1, in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic
      );
    end component;
begin
    bit0: mux_3_to_1 Port map (
		in0 => b(0),
		in1 => b(1),
		in2 => in_left,
		s => s,
		z => h(0)
    );    
    bit01: mux_3_to_1 Port map (
		in0 => b(1),
		in1 => b(2),
		in2 => b(0),
        s => s,
		z => h(1)
    );
    bit02: mux_3_to_1 Port map (
		in0 => b(2),
		in1 => b(3),
		in2 => b(1),
		s => s,
		z => h(2)
    );
    bit03: mux_3_to_1 Port map (
		in0 => b(3),
		in1 => b(4),
		in2 => b(2),
		s => s,
		z => h(3)
    );
    bit04: mux_3_to_1 Port map (
		in0 => b(4),
		in1 => b(5),
		in2 => b(3),
		s => s,
		z => h(4)
    );
    bit05: mux_3_to_1 Port map (
		in0 => b(5),
		in1 => b(6),
		in2 => b(4),
		s => s,
		z => h(5)
    );
    bit06: mux_3_to_1 Port map (
		in0 => b(6),
		in1 => b(7),
		in2 => b(5),
		s => s,
		z => h(6)
    );
    bit07: mux_3_to_1 Port map (
		in0 => b(7),
		in1 => b(8),
		in2 => b(6),
		s => s,
		z => h(7)
    );
    bit08: mux_3_to_1 Port map (
		in0 => b(8),
		in1 => b(9),
		in2 => b(7),
		s => s,
		z => h(8)
    );
    bit09: mux_3_to_1 Port map (
		in0 => b(9),
		in1 => b(10),
		in2 => b(8),
		s => s,
		z => h(9)
    );
    bit10: mux_3_to_1 Port map (
		in0 => b(10),
		in1 => b(11),
		in2 => b(9),
		s => s,
		z => h(10)
    );
    bit11: mux_3_to_1 Port map (
		in0 => b(11),
		in1 => b(12),
		in2 => b(10),
		s => s,
		z => h(11)
    );
    bit12: mux_3_to_1 Port map (
		in0 => b(12),
		in1 => b(13),
		in2 => b(11),
		s => s,
		z => h(12)
    );
    bit13: mux_3_to_1 Port map (
		in0 => b(13),
		in1 => b(14),
		in2 => b(12),
		s => s,
		z => h(13)
    );
    bit14: mux_3_to_1 Port map (
		in0 => b(14),
		in1 => b(15),
		in2 => b(13),
		s => s,
		z => h(14)
    );
    bit15: mux_3_to_1 Port map (
		in0 => b(15),
		in1 => in_right,
		in2 => b(14),
		s => s,
		z => h(15)
    );
end Behavioral;
