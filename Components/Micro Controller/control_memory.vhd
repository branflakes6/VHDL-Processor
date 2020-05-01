----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 21:05:50
-- Design Name: 
-- Module Name: control_memory - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_memory is
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
       IN_CAR : in std_logic_vector(7 downto 0));
end control_memory;

architecture Behavioral of control_memory is
type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
begin
memory_m: process(IN_CAR)
variable control_mem : mem_array:=(   
                            0 => X"0E20024", -- ADD
                           1 => X"0E2000C", -- LD
                           2 => X"0EE1004", -- SR
                           3 => X"0E20014", -- INC 
                           4 => X"0E200E4", -- NOT
                           5 => X"0E20224", -- ADI
                           6 => X"0E22000", -- Branch
                           7 => X"0020000", -- BEQ Conditional Branch Equals Zero
                           8 => X"0020054", -- SUB
                           9 => X"0000000", -- 
                           10 => X"0000000", -- 
                           11 => X"0000000", -- 
                           12 => X"0000000", -- 
                           13 => X"0000000", -- 
                           14 => X"0F0C002", -- Fetch
                           15 => X"0030000", -- Execute
                           others => x"0020000"  );


variable addr : integer;
variable control_out : std_logic_vector(27 downto 0);

begin
    addr := conv_integer(IN_CAR);
    control_out := control_mem(addr);
    MW <= control_out(0);
    MM <= control_out(1);
    RW <= control_out(2);
    MD <= control_out(3);
    FS <= control_out(8 downto 4);
    MB <= control_out(9);
    TB <= control_out(10);
    TA <= control_out(11);
    TD <= control_out(12);
    PL <= control_out(13);
    PI <= control_out(14);
    IL <= control_out(15);
    MC <= control_out(16);
    MS <= control_out(19 downto 17);
    NA <= control_out(27 downto 20);
end process;
end Behavioral;