----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2020 18:28:58
-- Design Name: 
-- Module Name: registerfile_tb - Behavioral
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

entity registerfile_tb is
end registerfile_tb;

architecture Behavioral of registerfile_tb is
    
        component registerfile
        port( src_s0 : in std_logic;
        src_s1 : in std_logic;
        src_s2 : in std_logic;
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        Clk : in std_logic;
        data_src : in std_logic;
        data : in std_logic_vector(15 downto 0);
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

        --inputs
        signal src_s0, src_s1, src_s2, des_A0, des_A1, des_A2, Clk, data_src : std_logic;      
        --outputs
        signal data, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0);
begin
        uut: registerfile port map( src_s0=>src_s0,
                                    src_s1=>src_s1,
                                    src_s2=>src_s2,
                                    des_A0=>des_A0,
                                    des_A1=>des_A1,
                                    des_A2=>des_A2,
                                    Clk=>Clk,
                                    data_src=>data_src,
                                    data=>data,
                                    reg0=>reg0,
                                    reg1=>reg1,
                                    reg2=>reg2,
                                    reg3=>reg3,
                                    reg4=>reg4,
                                    reg5=>reg5,
                                    reg6=>reg6,
                                    reg7=>reg7
                                    );
                                    
            stim_proc: process
            begin
            wait for 10ns;
            Clk<='0';
            data<="0000000011111111";
            des_A0<= '0';
            des_A1<= '0';
            des_A2<= '0';
            data_src<='0';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '0';
            des_A1<= '0';
            des_A2<= '1';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '0';
            des_A1<= '1';
            des_A2<= '0';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '0';
            des_A1<= '1';
            des_A2<= '1';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            data<="1111111100000000";
            des_A0<= '1';
            des_A1<= '0';
            des_A2<= '0';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '1';
            des_A1<= '0';
            des_A2<= '1';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '1';
            des_A1<= '1';
            des_A2<= '0';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            des_A0<= '1';
            des_A1<= '1';
            des_A2<= '1';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            Clk<= not Clk;
            data_src<='1';
            src_s0<='0';
            src_s1<='0';
            src_s2<='0';
            wait for 10ns;
            Clk<= not Clk;
            wait for 10ns;
            end process;

end Behavioral;
