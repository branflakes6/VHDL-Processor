----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2020 12:26:43
-- Design Name: 
-- Module Name: pc_extend - Behavioral
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

entity pc_extend is
port (  
    extend_in : in std_logic_vector(5 downto 0);
    extend_out : out std_logic_vector(15 downto 0)
    );
    
end pc_extend;

architecture Behavioral of pc_extend is
       
        
begin
         extend_out(5 downto 0) <= extend_in after 1ns;
         extend_out(15 downto 6) <= "0000000000" after 1ns when extend_in(5) = '1' else
                                    "1111111111" after 1ns when extend_in(5) = '0';
         
end Behavioral;
