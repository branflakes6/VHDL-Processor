----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2020 22:20:08
-- Design Name: 
-- Module Name: Function_unit - Behavioral
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

entity Function_unit is
       Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           Gout : out std_logic_vector (15 downto 0);
           Func_select : in std_logic_vector (4 downto 0);
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic
           );
end Function_unit;

architecture Behavioral of Function_unit is
    component ALU is
        Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           S0 : in std_logic;
           S1 : in std_logic;
           S2 : in std_logic;
           Cin : in std_logic;
           Sum_out : out std_logic_vector (15 downto 0);           
           Cout_final : out std_logic
           ); 
    end component;
    component shifter is
             Port (  b : in std_logic_vector(15 downto 0);
                s : in std_logic_vector(1 downto 0);
                in_left, in_right : in std_logic;
                h : out std_logic_vector(15 downto 0)
                );
    end component;
    component mux2_to_1 is
              Port ( in0 : in std_logic_vector (15 downto 0);
                  in1 : in std_logic_vector (15 downto 0);
                  S : in std_logic;
                  Z : out std_logic_vector (15 downto 0)
                );
    end component;
    signal ALU_out : std_logic_vector (15 downto 0);
    signal shifter_out : std_logic_vector (15 downto 0);
    signal func_out : std_logic_vector (15 downto 0);

    
   begin
   ALU1 : ALU port map (
          A => A,
          B => B,
          S0 => Func_select(1),
          S1 => Func_select(2),
          S2 => Func_select(3),
          Sum_out => ALU_out,
          Cin => Func_select(0),
          Cout_final => C
    );
     shifter1 : shifter port map(
        b => B,
        H => shifter_out,
        s => Func_select(3 downto 2),
        in_left => '0',
        in_right => '0'
    );
    mux2to1 : mux2_to_1 port map(
        in0 => ALU_out,
        in1 => shifter_out,
        Z => func_out,
        s => Func_select(4)
    );
    N <= '1' after 1ns when func_out(15) = '1' else
         '0' after 1ns;
    Z <= '1' after 1ns when func_out = "0000000000000000" else
         '0' after 1ns;
    V <=  '1' after 1ns when A(15) = '0' and B(15) = '1' and func_out(15) = '1' and Func_select = "00101" else
          '1' after 1ns when A(15) = '1' and B(15) = '0' and func_out(15) = '0' and Func_select = "00101" else
          '1' after 1ns when A(15) = '0' and B(15) = '0' and func_out(15) = '1' else 
          '1' after 1ns when A(15) = '1' and B(15) = '1' and func_out(15) = '0' else
          '0' after 1ns;
    Gout <= func_out;
end Behavioral;
    