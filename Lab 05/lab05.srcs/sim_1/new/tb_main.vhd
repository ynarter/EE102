----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 23:43:45
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is
signal reset,clk: std_logic;
signal an: std_logic_vector(3 downto 0);
signal cat: std_logic_vector(6 downto 0);
begin
----------------------------------------------------------------------------
 dut: entity work.main(Behavioral)
 port map (clk => clk, reset=>reset,
 an => an,
 cat=> cat
 );
----------------------------------------------------------------------------
 clock :process
 begin
 clk <= '0';
 wait for 10 ns;
 clk <= '1';
 wait for 10 ns;
 end process;

 sim: process
 begin 
 reset <= '1';
 wait for 20 ns; 
 reset <= '0';
 wait;
 end process;





end Behavioral;
