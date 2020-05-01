----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2020 12:04:38
-- Design Name: 
-- Module Name: registerfile - Behavioral
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

entity registerfile is
    Port (
        reset : in std_logic;
        load_enable : in std_logic;
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
        reg7 : out std_logic_vector(15 downto 0);
        reg8 : out std_logic_vector(15 downto 0)
        );
    end registerfile;

architecture Behavioral of registerfile is
--components 
        --Reg 8
        COMPONENT reg16
        PORT (
        reset : in std_logic;
        D : in std_logic_vector(15 downto 0);
        load, Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0)
        );
        END COMPONENT;    
        
        --3 to 8 Decoder
        COMPONENT decoder4to9
        PORT(
         A0, A1, A2, A3 : in std_logic;
         D0,D1,D2,D3,D4,D5,D6,D7, D8: out std_logic
         );        
         END COMPONENT;
                  
          --8 to 1 Multiplexer
          COMPONENT mux9_to_1
          PORT (
            In0, In1, In2, In3, In4, In5, In6, In7, in8 : in std_logic_vector(15 downto 0);
            S0, S1, S2, S3 : in std_logic;
            Z : out std_logic_vector(15 downto 0)
            );
            END COMPONENT;
            
      --signals    
      signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7,load_reg8, load0, load1, load2, load3, load4, load5, load6, load7, load8 : std_logic;
      signal reg0_q, reg1_q, reg2_q, reg3_q,reg4_q, reg5_q, reg6_q, reg7_q, reg8_q: std_logic_vector(15 downto 0);
begin
        --port maps ;+)
         
         --reg0
           reg00:reg16 PORT MAP(
                  reset =>reset,
                  D=>data,
                  load=>load0,
                  Clk=>Clk,
                  Q=>reg0_q
                  );
           --reg1
           reg01:reg16 PORT MAP(
                  reset =>reset,
                  D=>data,
                  load=>load1,
                  Clk=>Clk,
                  Q=>reg1_q
                  );
           --reg2
           reg02:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load2,
                  Clk=>Clk,
                  Q=>reg2_q
                  );
           --reg3
           reg03:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load3,
                  Clk=>Clk,
                  Q=>reg3_q
                  );
           --reg4
           reg04:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load4,
                  Clk=>Clk,
                  Q=>reg4_q
                  );
           --reg5
           reg05:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load5,
                  Clk=>Clk,
                  Q=>reg5_q
                  );
           --reg6
           reg06:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load6,
                  Clk=>Clk,
                  Q=>reg6_q
                  );
           --reg7
           reg07:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load7,
                  Clk=>Clk,
                  Q=>reg7_q
                  ); 
                  --reg7
           reg08:reg16 PORT MAP(
           reset =>reset,
                  D=>data,
                  load=>load8,
                  Clk=>Clk,
                  Q=>reg8_q
                  ); 
                  
          des_decoder_3to8: decoder4to9 PORT MAP (
                               A0 => des_A0,
                               A1 => des_A1,
                               A2 => des_A2,
                               A3 => des_A3,                    
                               D0 => load_reg0,   
                               D1 => load_reg1, 
                               D2 => load_reg2, 
                               D3 => load_reg3,
                               D4 => load_reg4, 
                               D5 => load_reg5, 
                               D6 => load_reg6,
                               D7 => load_reg7,
                               D8 => load_reg8
                               );   
                                           
            inst_mux9_to_1A: mux9_to_1 PORT MAP(
                            In0=>reg0_q,
                            In1=>reg1_q,
                            In2=>reg2_q,
                            In3=>reg3_q,
                            In4=>reg4_q,
                            In5=>reg5_q,
                            In6=>reg6_q,
                            In7=>reg7_q,
                            in8=>reg8_q,
                            S0=>a_select(2),
                            S1=>a_select(1),
                            S2=>a_select(0),
                            S3=>a_select(3),
                            Z=>A_Data
                            );
               inst_mux9_to_1B: mux9_to_1 PORT MAP(
                            In0=>reg0_q,
                            In1=>reg1_q,
                            In2=>reg2_q,
                            In3=>reg3_q,
                            In4=>reg4_q,
                            In5=>reg5_q,
                            In6=>reg6_q,
                            In7=>reg7_q,
                            in8=>reg8_q,
                            S0=>b_select(2),
                            S1=>b_select(1),
                            S2=>b_select(0),
                            S3=>b_select(3),
                            Z=>B_Data
                            );
             load0 <= load_enable and load_reg0 after 1ns;
             load1 <= load_enable and load_reg1 after 1ns;
             load2 <= load_enable and load_reg2 after 1ns;
             load3 <= load_enable and load_reg3 after 1ns;
             load4 <= load_enable and load_reg4 after 1ns;
             load5 <= load_enable and load_reg5 after 1ns;
             load6 <= load_enable and load_reg6 after 1ns;
             load7 <= load_enable and load_reg7 after 1ns;
             load8 <= load_enable and load_reg8 after 1ns;
                reg0<=reg0_q;
                reg1<=reg1_q;
                reg2<=reg2_q;
                reg3<=reg3_q;
                reg4<=reg4_q;
                reg5<=reg5_q;
                reg6<=reg6_q;
                reg7<=reg7_q;
                reg8<=reg8_q;
                             
end Behavioral;
