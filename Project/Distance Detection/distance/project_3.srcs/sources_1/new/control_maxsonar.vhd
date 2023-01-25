----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2022 14:46:15
-- Design Name: 
-- Module Name: control_maxsonar - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_maxsonar is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           echo : in  STD_LOGIC;
           trigger : out  STD_LOGIC;
           data_valid : out  STD_LOGIC;
           distance : out  STD_LOGIC_VECTOR (10 downto 0));
end control_maxsonar;

architecture Behavioral of control_maxsonar is

   type state_type is (s0,s1,s2);
   signal state: state_type;
   signal count: unsigned(10 downto 0);
   signal clk_2: std_logic;
   signal echo_2: unsigned(10 downto 0);

begin

   p_clk:process(clk, reset)
   begin
      if (reset = '1') then
         count <= (others => '0');
      elsif rising_edge(clk) then
         if count < 1450 then
            count <= count + 1;
         else
            count <= (others => '0');
         end if;
      end if;
   end process;
   clk_2 <= count(10);
   
   principal:process(clk_2, reset)
   begin
      if (reset = '1') then
         state <= s0;
         echo_2 <= (others => '0');
         data_valid <= '0';
         distance <= (others => '0');
         trigger <= '0';
      elsif rising_edge(clk_2) then
         case state is
            when s0 =>           -- waits for start to activate trigger
               data_valid <= '0';
               echo_2 <= (others => '0'); -- restarts the count echo
               if start = '1' then
                  trigger <= '1';
                  state <= s1;             
               end if;
               
            when s1 =>           -- trigger goes down after 14,5 microseconds
               trigger <= '0';
               if echo = '1' then
                  state <= s2;
               end if;
 
            when s2 =>
               if echo = '0' then
                  distance <= std_logic_vector(echo_2/4);
                  data_valid <= '1';
                  state <= s0;
               else
                  if echo_2 < 1600 then
                     echo_2 <= echo_2 + 1;
                  end if;
               end if;          
         end case;
      end if;
   end process;

end Behavioral;
