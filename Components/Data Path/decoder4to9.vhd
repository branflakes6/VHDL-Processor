----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2020 19:46:50
-- Design Name: 
-- Module Name: decoder4to9 - Behavioral
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

entity decoder4to9 is
    port(
         A0, A1, A2, A3 : in std_logic;
         D0,D1,D2,D3,D4,D5,D6,D7,D8: out std_logic
         );
end decoder4to9;

architecture structural_1 of decoder4to9 is
   
    begin
       D0<=((not A0) and (not A1) and (not A2));
       D1<=((not A0) and (not A1) and (A2));
       D2<=((not A0) and (A1) and (not A2));
       D3<=((not A0) and (A1) and (A2));                
       D4<=((A0) and (not A1) and (not A2));
       D5<=((A0) and (not A1) and (A2));
       D6<=((A0) and (A1) and (not A2));
       D7<=((A0) and (A1) and (A2));
       D8<=((A3) and (not A0) and (not A1) and (not A2));
end structural_1; 
