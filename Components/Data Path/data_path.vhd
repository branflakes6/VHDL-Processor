----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2020 03:33:30
-- Design Name: 
-- Module Name: data_path - Behavioral
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

entity data_path is
    Port ( Dest_select : in std_logic_vector (3 downto 0);
           Load_enable : in std_logic;
           A_select : in std_logic_vector (3 downto 0);
           B_select : in std_logic_vector (3 downto 0);
           Data_in : in std_logic_vector (15 downto 0);
           Data_out : out std_logic_vector (15 downto 0);
           Address_out : out std_logic_vector (15 downto 0);
           MD_select : in std_logic;
           MB_select : in std_logic;
           Constant_in : in std_logic_vector (15 downto 0);
           Function_select : in std_logic_vector ( 4 downto 0);
           Reset : in std_logic;
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
        reg7 : out std_logic_vector(15 downto 0)
           );
end data_path;
architecture Behavioral of data_path is
        component Function_unit is
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
         component registerfile is
         Port (  load_enable : in std_logic;
                 reset : in std_logic;
                 des_A0 : in std_logic;
                 des_A1 : in std_logic;
                 des_A2 : in std_logic;
                 des_A3 : in std_logic;
                 Clk : in std_logic;
                 data : in std_logic_vector(15 downto 0);
                 a_select : in std_logic_vector(3 downto 0);
                 b_select : in std_logic_vector(3 downto 0);
                 A_data : out std_logic_vector(15 downto 0);
                 B_data : out std_logic_vector(15 downto 0);
                 
                reg0 : out std_logic_vector(15 downto 0);
                 reg1 : out std_logic_vector(15 downto 0);
                 reg2 : out std_logic_vector(15 downto 0);
                 reg3 : out std_logic_vector(15 downto 0);
                reg4 : out std_logic_vector(15 downto 0);
                reg5 : out std_logic_vector(15 downto 0);
                 reg6 : out std_logic_vector(15 downto 0);
                 reg7 : out std_logic_vector(15 downto 0)       
                 );
        end component;
         component mux2_to_1 is
           Port ( in0 : in std_logic_vector (15 downto 0);
           in1 : in std_logic_vector (15 downto 0);
           S : in std_logic;
           Z : out std_logic_vector (15 downto 0)
           );
         end component;
         
    signal muxB_out : std_logic_vector(15 downto 0);
    signal muxD_out : std_logic_vector(15 downto 0);
    signal function_out : std_logic_vector (15 downto 0);
    signal a_data : std_logic_vector (15 downto 0);
    signal b_data : std_logic_vector (15 downto 0);
    
    begin

  reg_file : registerfile port map( 
        reset => reset,
        a_select => A_select,
        b_select => B_select,
        des_A0 => Dest_select(2),
        des_A1 => Dest_select(1),
        des_A2 => Dest_select(0),
        des_A3 => Dest_select(3),
        Clk => Clk,
        data => muxD_out,
        load_enable => load_enable,
        A_data => a_data,
        B_data => b_data,
        reg0=>reg0,
        reg1=>reg1,
        reg2=>reg2,
        reg3=>reg3,
        reg4=>reg4,
        reg5=>reg5,
        reg6=>reg6,
        reg7=>reg7
    );
    func : Function_unit port map(
        A => a_data,
        B => muxB_out,
        Gout => function_out,
        Func_select => Function_select,
        C => C,
        V => V,
        N => N,
        Z => Z 
    );
    muxB : mux2_to_1 port map(
        in0 => b_data,
        in1 => Constant_in,
        Z => muxB_out,
        s => MB_select
    );
    muxD : mux2_to_1 port map(
        in0 => function_out,
        in1 => Data_in,
        Z => muxD_out,
        s => MD_select
    );
    Data_out <= b_data after 1ns;
    Address_out <= a_data after 1ns;
end Behavioral;