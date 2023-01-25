library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity bin2bcd is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           b_in : in  STD_LOGIC_VECTOR (12 downto 0);
           dec_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           dec_10 : out  STD_LOGIC_VECTOR (3 downto 0);
           dec_100 : out  STD_LOGIC_VECTOR (3 downto 0);
           dec_1000 : out  STD_LOGIC_VECTOR (3 downto 0));
end bin2bcd;

architecture Behavioral of bin2bcd is

  signal dec_1_i, dec_10_i, dec_100_i, dec_1000_i: unsigned(3 downto 0);
  signal b_in_reg: std_logic_vector(12 downto 0);
  signal bcd4: unsigned(15 downto 0);
  type state_type is (load, replace, compr, ready);
  signal comp_u, comp_d, comp_c, comp_m: std_logic;
  signal sum: std_logic;

begin

  P1:process(clk, reset)
  
     variable i: integer range 0 to b_in'high;
     variable state: state_type;
     
  begin
     if reset = '1' then
        bcd4 <= (others => '0');
        state := load;
     elsif rising_edge(clk) then
        case state is
           when load =>
              b_in_reg <= b_in;
              bcd4 <= (others => '0');
              i := b_in'high;
              state := replace;
            when replace =>
              bcd4(15 downto 1) <= bcd4(14 downto 0);
              bcd4(0) <= std_logic(b_in_reg(12));
              b_in_reg <= b_in_reg(11 downto 0) & '0';
              if i > 0 then
                 i := i - 1;
                 state := compr;
              else
                 state := ready;
              end if;
            when compr =>
              if (sum = '1') then
                if (comp_u = '1') then
                   bcd4( 3 downto  0) <= bcd4( 3 downto  0) + 3;
                end if;
                if (comp_d = '1') then
                   bcd4( 7 downto  4) <= bcd4( 7 downto  4) + 3;
                end if;
                if (comp_c = '1') then
                   bcd4(11 downto  8) <= bcd4(11 downto  8) + 3;
                end if;
                if (comp_m = '1') then
                   bcd4 (15 downto 12) <= bcd4 (15 downto 12) + 3;
                end if;
                state := replace;
              else
                bcd4(15 downto 1) <= bcd4(14 downto 0);
                bcd4(0) <= std_logic(b_in_reg(12));
                b_in_reg <= b_in_reg(11 downto 0) & '0';
                if i > 0 then
                   i := i - 1;
                   state := compr;
                else
                   state := ready;
                end if;
              end if;
            when ready =>
              dec_1  <= std_logic_vector(bcd4( 3 downto  0));
              dec_10 <= std_logic_vector(bcd4( 7 downto  4));
              dec_100 <= std_logic_vector(bcd4(11 downto  8));
              dec_1000 <= std_logic_vector(bcd4(15 downto 12));
              state := load;
        end case;
     end if;
  end process;           

   comp_u <= '1' when bcd4( 3 downto  0) > 4 else '0';
   comp_d <= '1' when bcd4( 7 downto  4) > 4 else '0';
   comp_c <= '1' when bcd4(11 downto  8) > 4 else '0';
   comp_m <= '1' when bcd4(15 downto 12) > 4 else '0';
   
   sum <= comp_u OR comp_d OR comp_c OR comp_m;

end Behavioral;