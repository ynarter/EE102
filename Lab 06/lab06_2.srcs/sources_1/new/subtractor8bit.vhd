----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2022 23:34:13
-- Design Name: 
-- Module Name: subtractor8bit - Behavioral
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

entity subtractor8bit is
 port (in_a, in_b: IN STD_LOGIC_VECTOR ( 7 DOWNTO 0);
 output : OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0);
 test: out std_logic
 );
end subtractor8bit;
architecture rtl_subtractor8bit of subtractor8bit is
 signal b1,b2,b3,b4,b5,b6,b7,b8: std_logic;
BEGIN
 test <= in_a(0) XOR in_b(0) xor '0';
 output(0) <= in_a(0) XOR in_b(0) xor '0';
 b1 <= (not(in_a(0)) and '0') or (not(in_a(0)) and in_b(0)) or (in_b(0) and '0');
 output(1) <= in_a(1) XOR in_b(1) xor b1;
 b2 <= (not(in_a(1)) and b1) or (not(in_a(1)) and in_b(1)) or (in_b(1) and b1) ;
 output(2) <= in_a(2) XOR in_b(2) xor b2;
 b3 <= (not(in_a(2)) and b2) or (not(in_a(2)) and in_b(2)) or (in_b(2) and b2);
 output(3) <= in_a(3) XOR in_b(3) xor b3;
 b4 <= (not(in_a(3)) and b3) or (not(in_a(3)) and in_b(3)) or (in_b(3) and b3);
 output(4) <= in_a(4) XOR in_b(4) xor b4;
 b5 <= (not(in_a(4)) and b4) or (not(in_a(4)) and in_b(4)) or (in_b(4) and b4);
 output(5) <= in_a(5) XOR in_b(5) xor b5;
 b6 <= (not(in_a(5)) and b5) or (not(in_a(5)) and in_b(5)) or (in_b(5) and b5);
 output(6) <= in_a(6) XOR in_b(6) xor b6;
 b7 <= (not(in_a(6)) and b6) or (not(in_a(6)) and in_b(6)) or (in_b(6) and b6);
 output(7) <= in_a(7) XOR in_b(7) xor b7;
END rtl_subtractor8bit;

