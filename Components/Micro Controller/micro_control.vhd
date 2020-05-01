----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 23:06:41
-- Design Name: 
-- Module Name: micro_control - Behavioral
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

entity micro_control is
     port(
        intstruction_reg_in : in std_logic_vector (15 downto 0);
        V,C,N,Z, reset, clock : in std_logic; 
        PC_out  : out std_logic_vector(15 downto 0);
        data_control : out std_logic_vector (19 downto 0);       
        address_select, memory_load : out std_logic;
        fill_out : out std_logic_vector(15 downto 0)
     );
end micro_control;

architecture Behavioral of micro_control is
    component control_memory is 
    Port ( MW : out std_logic;
       MM : out std_logic;
       RW : out std_logic;
       MD : out std_logic;
       FS : out std_logic_vector(4 downto 0);
       MB : out std_logic;
       TB : out std_logic;
       TA : out std_logic;
       TD : out std_logic;
       PL : out std_logic;
       PI : out std_logic;
       IL : out std_logic;
       MC : out std_logic;
       MS : out std_logic_vector(2 downto 0);
       NA : out std_logic_vector(7 downto 0);
       IN_CAR : in std_logic_vector(7 downto 0)
       );
    end component;
    
    component CAR is 
    port(
           op_in : in std_logic_vector(7 downto 0);
        clock, reset, sel : in std_logic;
        car_out : out std_logic_vector(7 downto 0)
           );
    end component;
     
    component mux2_to_1_8bit is
    Port ( in0 : in std_logic_vector (7 downto 0);
           in1 : in std_logic_vector (7 downto 0);
           S : in std_logic;
           Z : out std_logic_vector (7 downto 0)
           );
    end component;

    component reg16 is
    port ( 
        reset : in std_logic;
        D : in std_logic_vector(15 downto 0);
        load, Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0)
        );    
    end component;

     component program_counter is
     port(
       PI, PL, reset, clock : in std_logic;
       offset : in std_logic_vector (15 downto 0);
       PC_out : out std_logic_vector(15 downto 0)
       );
    end component;
  
    component pc_extend is 
    port (  
        extend_in : in std_logic_vector(5 downto 0);
        extend_out : out std_logic_vector(15 downto 0)
    );
    end component;

    component zero_fill is
    port(
       fill_in : in std_logic_vector (2 downto 0);
       fill_out: out std_logic_vector (15 downto 0)
       );
    end component;
    
    component condition_mux is
    Port ( 
        C, V, Z, N : in std_logic;
        S : in std_logic_vector (2 downto 0);
        mux_out : out std_logic
    );
    end component;
    --signals
    signal control_memory_out : std_logic_vector (27 downto 0);
    signal car_out, instruction_reg_op, muxC_out : std_logic_vector (7 downto 0);
    signal condition_mux_out : std_logic;
    signal extend_out, instruction_reg_out : std_logic_vector(15 downto 0);
    signal offset : std_logic_vector (5 downto 0);

begin
    control_mem : control_memory port map
    (
       MW => control_memory_out(0), 
       MM => control_memory_out(1),
       RW => control_memory_out(2),
       MD => control_memory_out(3),
       FS => control_memory_out(8 downto 4),
       MB => control_memory_out(9),
       TB => control_memory_out(10),
       TA => control_memory_out(11),
       TD => control_memory_out(12),
       PL => control_memory_out(13),
       PI => control_memory_out(14),
       IL => control_memory_out(15),
       MC => control_memory_out(16),
       MS => control_memory_out(19 downto 17),
       NA => control_memory_out(27 downto 20),
       IN_CAR => car_out );
       
     instruction_reg : reg16 port map (
                reset => reset,
                D => intstruction_reg_in,
                load => control_memory_out(15),
                Clk => clock,
                Q => instruction_reg_out
     );
    instruction_reg_op(7) <= '0'; 
    instruction_reg_op(6 downto 0) <= instruction_reg_out (15 downto 9); --Opcode
    data_control(18 downto 16) <= instruction_reg_out(8 downto 6);  --DR
	data_control(14 downto 12) <= instruction_reg_out(5 downto 3);  --SA
	data_control(10 downto 8) <= instruction_reg_out(2 downto 0);  --SB
	
     control_address_register : CAR port map(
     op_in => muxC_out,
     clock => clock,
     reset => reset,
     sel => condition_mux_out,
     car_out => car_out   
     );
     
     PC : program_counter  port map (
     PI => control_memory_out(14),
     PL => control_memory_out(13),
     reset => reset,
     clock => clock,
     pc_out => pc_out,
     offset => extend_out
     );
     
     PC_ext : pc_extend port map (
     extend_in => offset,
     extend_out => extend_out 
     );
     
     muxC : mux2_to_1_8bit port map (
         in0 => control_memory_out(27 downto 20),
         in1 => instruction_reg_op,
         S => control_memory_out(16),
         Z => muxC_out  
     );
     
     flags_mux : condition_mux port map (
          C => C,
          V => V,
          Z => Z,
          N => N,
          S => control_memory_out(19 downto 17),
          mux_out => condition_mux_out       
     );
     
     ZeroFill : zero_fill port map (
           fill_in => instruction_reg_out(2 downto 0),
           fill_out => fill_out  
     );
    
    offset(5 downto 3) <= instruction_reg_out(8 downto 6); --Pc extend input
	offset(2 downto 0) <= instruction_reg_out(2 downto 0);
	
	data_control(19) <= control_memory_out(12); --TD  
	data_control(15) <= control_memory_out(11); --TA
	data_control(11) <= control_memory_out(10); --TB
	data_control(7) <= control_memory_out(9);   --MB
	data_control(6 downto 2) <= control_memory_out(8 downto 4); --FS
	data_control(1) <= control_memory_out(3); --MD
	data_control(0) <= control_memory_out(2); --RW

	address_select <= control_memory_out(1); --MM
	memory_load <= control_memory_out(0); --MW
end Behavioral;
