----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2020 06:21:12 PM
-- Design Name: 
-- Module Name: 3to8decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 0
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

entity decoder3to8 is
    port(
         A0, A1, A2 : in std_logic;
         D0,D1,D2,D3,D4,D5,D6,D7: out std_logic
         );
end decoder3to8;

architecture structural_1 of decoder3to8 is
   
    begin
       D0<=((not A0) and (not A1) and (not A2)) after 5ns;
       D1<=((not A0) and (not A1) and (A2)) after 5ns;
       D2<=((not A0) and (A1) and (not A2)) after 5ns;
       D3<=((not A0) and (A1) and (A2)) after 5ns;                
       D4<=((A0) and (not A1) and (not A2)) after 5ns;
       D5<=((A0) and (not A1) and (A2)) after 5ns;
       D6<=((A0) and (A1) and (not A2)) after 5ns;
       D7<=((A0) and (A1) and (A2)) after 5ns;
end structural_1; 
