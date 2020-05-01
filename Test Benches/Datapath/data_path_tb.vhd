----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2020 04:18:57
-- Design Name: 
-- Module Name: data_path_tb - Behavioral
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

entity data_path_tb is
end data_path_tb;

architecture Behavioral of data_path_tb is
component data_path
      Port ( Dest_select : in std_logic_vector (2 downto 0);
            reset : in std_logic;
           Load_enable : in std_logic;
           A_select : in std_logic_vector (2 downto 0);
           B_select : in std_logic_vector (2 downto 0);
           Data_in : in std_logic_vector (15 downto 0);
           Data_out : out std_logic_vector (15 downto 0);
           Address_out : out std_logic_vector (15 downto 0);
           MD_select : in std_logic;
           MB_select : in std_logic;
           Constant_in : in std_logic_vector (15 downto 0);
           Function_select : in std_logic_vector ( 4 downto 0);
           Clk : in std_logic;
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic;
           reg0 : out std_logic_vector(15 downto 0);
           reg1 : out std_logic_vector(15 downto 0);
           reg2 : out std_logic_vector(15 downto 0);
           reg3 : out std_logic_vector(15 downto 0);
           reg4 : out std_logic_vector(15 downto 0);
           reg5 : out std_logic_vector(15 downto 0);
           reg6 : out std_logic_vector(15 downto 0);
           reg7 : out std_logic_vector(15 downto 0));
  end component;

  --inputs
    signal    Dest_select : std_logic_vector (2 downto 0) := "000";
    signal    Load_enable : std_logic := '0';
    signal    A_select : std_logic_vector (2 downto 0) := "000";
    signal    B_select : std_logic_vector (2 downto 0) := "001";
    signal    Data_in : std_logic_vector (15 downto 0) := x"CAFE";
    signal    MD_select : std_logic := '0';
    signal    MB_select : std_logic := '0';
    signal    Constant_in : std_logic_vector (15 downto 0) := x"DEAD";
    signal    Function_select : std_logic_vector ( 4 downto 0) := "00000";
    signal    Clk : std_logic := '0';
    signal    reset : std_logic := '1';
  --outputs
    signal    V : std_logic;
    signal    C : std_logic;
    signal    N : std_logic;
    signal    Z : std_logic;
    signal    Data_out : std_logic_vector (15 downto 0);
    signal    Address_out : std_logic_vector (15 downto 0);
    signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
     constant TIME_CYCLE: time := 40ns;

begin

  uut: data_path port map (
        reset => reset, 
        Dest_select => Dest_select,
        load_enable => load_enable,
        A_select => A_select,
        B_select => B_select,
        Data_in => Data_in,
        Data_out => Data_out,
        Address_out => Address_out,
        MD_select => MD_select,
        MB_select => MB_select,
        Constant_in => Constant_in,
        Function_select => Function_select,
        Clk => Clk,
        V => V,
        C => C,
        N => N,
        Z => Z,
        reg0=>reg0,
        reg1=>reg1,
        reg2=>reg2,
        reg3=>reg3,
        reg4=>reg4,
        reg5=>reg5,
        reg6=>reg6,
        reg7=>reg7
        );
   
  clock : process
  begin
    wait for 40ns/2;
    Clk <= not Clk;
  end process;
  
  stimul: process
    begin
       wait for TIME_CYCLE;
        Reset <= '0';
        load_enable <= '1';
        MD_select <= '1';
        wait for TIME_CYCLE;
        Dest_select <= "001";
        wait for TIME_CYCLE;
        Dest_select <= "010";
        wait for TIME_CYCLE;
        Dest_select <= "011";
        wait for TIME_CYCLE;
        Dest_select <= "100";
        wait for TIME_CYCLE;
        Dest_select <= "101";
        wait for TIME_CYCLE;
        Dest_select <= "110";
        wait for TIME_CYCLE;
        Dest_select <= "111";
        wait for TIME_CYCLE;
        MD_select <= '0';
        Function_select <= "00001";
        wait for TIME_CYCLE;
        Dest_select <= "000";
        A_select <= "011";
        Function_select <= "00010";
        wait for TIME_CYCLE;
        Dest_select <= "010";
        B_select <= "100";
        Function_select <= "00011";
        wait for TIME_CYCLE;
        Dest_select <= "011";
        A_select <= "101";
        Function_select <= "00100";
        wait for TIME_CYCLE;
        Dest_select <= "100";
        B_select <= "110";
        Function_select <= "00101";
        wait for TIME_CYCLE;
        Dest_select <= "101";
        A_select <= "111";
        Function_select <= "00110";
        wait for TIME_CYCLE;
        Dest_select <= "110";
        Function_select <= "00111";
        wait for TIME_CYCLE;
        Dest_select <= "000";
        MB_Select <= '1';
        Function_select <= "01000";
        wait for TIME_CYCLE;
        Function_select <= "01010";
        wait for TIME_CYCLE;
        Function_select <= "01100";
        wait for TIME_CYCLE;
        Function_select <= "01110";
        wait for TIME_CYCLE;
        Dest_select <= "001";
        Function_select <= "10000";
        wait for TIME_CYCLE;
        Function_select <= "10100";
        wait for TIME_CYCLE;
        Function_select <= "11000";
        wait;
  end process;
end Behavioral;