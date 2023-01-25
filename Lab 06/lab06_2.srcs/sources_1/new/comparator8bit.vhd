library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------
entity comparator8bit is
 port (
 in_a, in_b: in unsigned(7 downto 0);
 output: out std_logic_vector(2 downto 0)
 );
end entity;
----------------------------------------------------------------
architecture rtl_comparator of comparator8bit is
 signal eq: std_logic_vector(7 downto 0);
 signal grtr1, grtr2: std_logic;
 signal result: std_logic_vector(2 downto 0);
 signal equal,greater, lesser: std_logic;
begin
 ----------------------------------------------------------------
 eq(0) <= (not in_a(0)) xnor (not in_b(0));
 eq(1) <= (not in_a(1)) xnor (not in_b(1));
 eq(2) <= (not in_a(2)) xnor (not in_b(2));
 eq(3) <= (not in_a(3)) xnor (not in_b(3));
 eq(4) <= (not in_a(4)) xnor (not in_b(4));
 eq(5) <= (not in_a(5)) xnor (not in_b(5));
 eq(6) <= (not in_a(6)) xnor (not in_b(6));
 eq(7) <= (not in_a(7)) xnor (not in_b(7));
 
 equal<= '1' when eq = x"FF" else '0';
 ----------------------------------------------------------------
 greater <= (in_a(7) and not(in_b(7)))or
 (in_a(6) and not(in_b(6)) and eq(7))or
 (in_a(5) and not(in_b(5)) and eq(7) and eq(6))or
 (in_a(4) and not(in_b(4)) and eq(7) and eq(6) and eq(5))or
 (in_a(3) and not(in_b(3)) and eq(7) and eq(6) and eq(5) and eq(4))or
 (in_a(2) and not(in_b(2)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3))or
 (in_a(1) and not(in_b(1)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3) and 
eq(2))or
 (in_a(0) and not(in_b(0)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3) and 
eq(2) and eq(1));
 ----------------------------------------------------------------
 lesser <= (in_b(7) and not(in_a(7)))or
 (in_b(6) and not(in_a(6)) and eq(7))or
 (in_b(5) and not(in_a(5)) and eq(7) and eq(6))or
 (in_b(4) and not(in_a(4)) and eq(7) and eq(6) and eq(5))or
 (in_b(3) and not(in_a(3)) and eq(7) and eq(6) and eq(5) and eq(4))or
 (in_b(2) and not(in_a(2)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3))or
 (in_b(1) and not(in_a(1)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3) and 
eq(2))or
 (in_b(0) and not(in_a(0)) and eq(7) and eq(6) and eq(5) and eq(4) and eq(3) and 
eq(2) and eq(1));
 ----------------------------------------------------------------
 result(2) <= lesser;
 result(0) <= greater;
 result(1) <= equal; 
 output <= result;
 ----------------------------------------------------------------
end rtl_comparator;
