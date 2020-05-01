----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 17:20:29
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
   port ( clock, reset : in std_logic;
          reg0 : out std_logic_vector(15 downto 0);
          reg1 : out std_logic_vector(15 downto 0);
          reg2 : out std_logic_vector(15 downto 0);
          reg3 : out std_logic_vector(15 downto 0);
          reg4 : out std_logic_vector(15 downto 0);
          reg5 : out std_logic_vector(15 downto 0);
          reg6 : out std_logic_vector(15 downto 0);
          reg7 : out std_logic_vector(15 downto 0)
        );
end Processor;

architecture Behavioral of Processor is
    component data_path is 
    port (
           Dest_select : in std_logic_vector (3 downto 0);
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
    end component;
    
    component micro_control is 
    port ( 
        intstruction_reg_in : in std_logic_vector (15 downto 0);
        V,C,N,Z, reset, clock : in std_logic; 
        PC_out  : out std_logic_vector (15 downto 0);
        data_control : out std_logic_vector (19 downto 0);       
        address_select, memory_load : out std_logic;
        fill_out : out std_logic_vector(15 downto 0)  
    );
    end component;
    
    component memory is 
    port(
          address, data_in : in std_logic_vector(15 downto 0);
          load : in std_logic;
          data_out : out std_logic_vector(15 downto 0)
    );
    end component;
    component mux2_to_1 is
    Port ( in0 : in std_logic_vector (15 downto 0);
           in1 : in std_logic_vector (15 downto 0);
           S : in std_logic;
           Z : out std_logic_vector (15 downto 0)
           );
    end component;
        
    signal n,c,z,v,RW, MD, MB, MW, MM, memory_load, address_select  : std_logic;
    signal Dest_select, A_select, B_select : std_logic_vector(3 downto 0);
    signal memory_out, memory_data_in, muxM_in0, muxM_in1, muxM_out, zero_fill_out : std_logic_vector(15 downto 0);
    signal fs : std_logic_vector (4 downto 0);
    signal data_control : std_logic_vector (19 downto 0);
    
begin
    RW <= data_control(0);
    MD <= data_control(1);
    MB <= data_control(7);
    FS <= data_control(6 downto 2);
    MW <= memory_load;
    MM <= address_select;
     dataPath : data_path port map
                            (
                             Dest_select  => data_control(19 downto 16), 
                             A_select => data_control(15 downto 12),
                             B_select => data_control (11 downto 8),
                             load_enable => RW,
                             data_in => memory_out,
                             data_out => memory_data_in,
                             address_out => muxM_in0,
                             MD_select => MD,
                             MB_select => MB,
                             constant_in => zero_fill_out,
                             Function_select => fs,
                             reset => reset,
                             Clk => clock,
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
     micro_controller : micro_control port map (
     
            intstruction_reg_in => memory_out,
            V => V,
            C => C,
            N => N,
            Z => Z,
            reset => reset,
            clock => clock, 
            PC_out => muxM_in1,
            data_control => data_control,       
            address_select => address_select,
            memory_load => memory_load,
            fill_out => zero_fill_out
     );   
     mem : memory port map(
                address => muxM_out,
                data_in =>memory_data_in,
                load => MW,
                data_out => memory_out
                );
                
     muxM : mux2_to_1 port map(
                in0 => muxM_in0,
                in1 => muxM_in1,
                S => MM,
                Z => muxM_out  
                );

end Behavioral;
