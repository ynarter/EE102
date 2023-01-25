----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 23:50:02
-- Design Name: 
-- Module Name: tb_clk - Behavioral
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

entity tb_clk is
--  Port ( );
end tb_clk;

architecture Behavioral of tb_clk is
signal clk,reset: std_logic;
signal clock_count: std_logic_vector(27 downto 0);
signal phase_count: std_logic_vector(1 downto 0);
signal sec: std_logic_vector(15 downto 0);
signal sec_en: std_logic;
begin
----------------------------------------------------------------------------
dut: entity work.clock
 port map ( clk => clk, reset => reset, clock_count => clock_count,
 phase_count => phase_count, sec => sec, sec_en => sec_en 
 );

 clock: process begin
 clk <= '0';
 wait for 10ns;
 clk <= '1';
 wait for 10ns;
 end process;

 sim: process
 begin 
 reset <= '1';
 wait for 20 ns; 
 reset <= '0';
 wait;
 end process;

end Behavioral;
