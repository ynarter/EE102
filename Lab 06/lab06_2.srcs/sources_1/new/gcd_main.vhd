library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------
entity gcd_main is
 port(
 clk, reset: in std_logic;
 enable: in std_logic;
 in_a, in_b: in std_logic_vector(7 downto 0);
 ready: out std_logic;
 output: out std_logic_vector(7 downto 0)
 );
end gcd_main ;
----------------------------------------------------------------
architecture rtl_main of gcd_main is
 type state_type is (hold, replace, substract);
 signal register_state, next_state : state_type;
 
 signal reg_a, reg_b, next_a, next_b: unsigned(7 downto 0);
 signal comp_a,comp_b : unsigned(7 downto 0);
 
 signal subs_b, subs_a, subs_out: std_logic_vector(7 downto 0);
 signal comp_out: std_logic_vector(2 downto 0);
 
begin
 ----------------------------------------------------------------
 comparator: entity work.comparator8bit(rtl_comparator)
 port map(in_a => comp_a, in_b=> comp_b, output=> comp_out);
 substractor: entity work.subtractor8bit(rtl_subtractor8bit)
 port map(in_a => subs_a, in_b => subs_b, output => subs_out);
 ---------------------------------------------------------------- 
 process(clk,reset)
 begin
 if reset='1' then
 register_state <= hold;
 reg_a <= (others=>'0');
 reg_b <= (others=>'0');
 elsif (rising_edge(clk)) then
 register_state <= next_state;
 reg_a <= next_a;
 reg_b <= next_b;
 end if;
 end process;
 ----------------------------------------------------------------
 process(register_state,reg_a,reg_b,enable,in_a,in_b)
 begin
 next_a <= reg_a;
 next_b <= reg_b;
 comp_a <= reg_a;
 comp_b <= reg_b;
 subs_a <= std_logic_vector(reg_a);
 subs_b <= std_logic_vector(reg_b);
 
 case register_state is
 ---------------------------------------------------------------- 
 when hold =>
 if enable = '1' then
 next_a <= unsigned(in_a);
 next_b <= unsigned(in_b);
 next_state <= replace;
 else
 next_state <= hold;
 end if;
 ---------------------------------------------------------------- 
 when replace =>
 if (comp_out(1) = '1') then
 next_state <= hold;
 else
 if(comp_out(2) = '1') then
 next_a <= reg_b;
 next_b <= reg_a;
 end if;
 next_state <= substract;
 end if;
 ---------------------------------------------------------------- 
 when substract =>
 next_a <= unsigned(subs_out);
 next_state <= replace;
 end case;
 end process;
 ----------------------------------------------------------------
 ready <= '1' when register_state = hold else '0';
 output <= std_logic_vector(reg_a);
 ----------------------------------------------------------------
end rtl_main;