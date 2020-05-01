----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2020 01:09:35
-- Design Name: 
-- Module Name: Function_unit_tb - Behavioral
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

entity function_unit_tb is
end function_unit_tb;

architecture Behavioral of function_unit_tb is
component function_unit
      Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           Gout : out std_logic_vector (15 downto 0);
           Func_select : in std_logic_vector (4 downto 0);
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic
             );
  end component;
  --inputs
  signal A : std_logic_vector (15 downto 0) := "0000000011111111";
  signal B : std_logic_vector (15 downto 0) := "1111111100000000";
  signal Func_select: std_logic_vector (4 downto 0) := "00000";  
  -- outputs
  signal Gout: std_logic_vector (15 downto 0);
  signal V, C, N, Z: std_logic;
begin
  uut: function_unit port map ( 
        A => A,
        B => B,
        Gout => Gout,
        Func_select => Func_select,
        V => V,
        C => C,
        N => N,
        Z => Z 
  );
  stim_proc: process
  begin
    wait for 10ns;
    Func_select <= "00001";
    wait for 10ns;
    Func_select <= "00010";
    wait for 10ns;
    Func_select <= "00011";
    wait for 10ns;
    Func_select <= "00100";
    wait for 10ns;
    Func_select <= "00101";
    wait for 10ns;
    Func_select <= "00110";
    wait for 10ns;
    Func_select <= "00111";
    wait for 10ns;
    Func_select <= "01000";
    wait for 10ns;
    Func_select <= "01010";
    wait for 10ns;
    Func_select <= "01100";
    wait for 10ns;
    Func_select <= "01110";
    wait for 10ns;
    Func_select <= "10000";
    wait for 10ns;
    Func_select <= "10100";
    wait for 10ns;
    Func_select <= "11000";
    wait;
  end process;

end Behavioral;