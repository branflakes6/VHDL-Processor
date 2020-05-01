----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2020 18:57:10
-- Design Name: 
-- Module Name: ripple_adder16bit - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder16bit is
    port ( 
            Xf, Yf : in std_logic_vector (15 downto 0);
            carryIn : in std_logic;
            Sf : out std_logic_vector (15 downto 0);
            carryOut : out std_logic
            );
end ripple_adder16bit;

architecture Behavioral of ripple_adder16bit is

 component full_adder
    port ( X, Y, Cin : in std_logic;
       s, Cout : out std_logic
       ); 
    end component;
    signal carry : std_logic_vector (14 downto 0);
begin
     full_adder00: full_adder port map (
                    X => Xf(0),
                    Y => Yf(0),
                    Cin => carryIn,
                    s => Sf(0),
                    Cout => carry(0)
                    );
    full_adder01: full_adder port map (
                    X => Xf(1),
                    Y => Yf(1),
                    Cin => carry(0),
                    s => Sf(1),
                    Cout => carry(1)
                    );
    full_adder02: full_adder port map (
                    X => Xf(2),
                    Y => Yf(2),
                    Cin => carry(1),
                    s => Sf(2),
                    Cout => carry(2)
                    );
     full_adder03: full_adder port map (
                    X => Xf(3),
                    Y => Yf(3),
                    Cin => carry(2),
                    s => Sf(3),
                    Cout => carry(3)
                    );
     full_adder04: full_adder port map (
                    X => Xf(4),
                    Y => Yf(4),
                    Cin => carry(3),
                    s => Sf(4),
                    Cout => carry(4)
                    );
     full_adder05: full_adder port map (
                    X => Xf(5),
                    Y => Yf(5),
                    Cin => carry(4),
                    s => Sf(5),
                    Cout => carry(5)
                    );
      full_adder06: full_adder port map (
                    X => Xf(6),
                    Y => Yf(6),
                    Cin => carry(5),
                    s => Sf(6),
                    Cout => carry(6)
                    );
       full_adder07: full_adder port map (
                    X => Xf(7),
                    Y => Yf(7),
                    Cin => carry(6),
                    s => Sf(7),
                    Cout => carry(7)
                    );
       full_adder08: full_adder port map (
                    X => Xf(8),
                    Y => Yf(8),
                    Cin => carry(7),
                    s => Sf(8),
                    Cout => carry(8)
                    );
         full_adder09: full_adder port map (
                    X => Xf(9),
                    Y => Yf(9),
                    Cin => carry(8),
                    s => Sf(9),
                    Cout => carry(9)
                    );
        full_adder10: full_adder port map (
                    X => Xf(10),
                    Y => Yf(10),
                    Cin => carry(9),
                    s => Sf(10),
                    Cout => carry(10)
                    );
        full_adder11: full_adder port map (
                    X => Xf(11),
                    Y => Yf(11),
                    Cin => carry(10),
                    s => Sf(11),
                    Cout => carry(11)
                    );
         full_adder12: full_adder port map (
                    X => Xf(12),
                    Y => Yf(12),
                    Cin => carry(11),
                    s => Sf(12),
                    Cout => carry(12)
                    );
          full_adder13: full_adder port map (
                    X => Xf(13),
                    Y => Yf(13),
                    Cin => carry(12),
                    s => Sf(13),
                    Cout => carry(13)
                    );
          full_adder14: full_adder port map (
                    X => Xf(14),
                    Y => Yf(14),
                    Cin => carry(13),
                    s => Sf(14),
                    Cout => carry(14)
                    );
        full_adder15: full_adder port map (
                    X => Xf(15),
                    Y => Yf(15),
                    Cin => carry(14),
                    s => Sf(15),
                    Cout => carryOut
                    );
end Behavioral;
