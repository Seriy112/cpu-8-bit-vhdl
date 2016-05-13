library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity R0 is
port (RST: in std_logic;
CLK: in std_logic;
C: in std_logic;
RIn: in std_logic;
ROut: in std_logic;
DataIn: in std_logic_vector (7 downto 0);
DataOut: out std_logic_vector (7 downto 0));
end R0;
architecture R0 of R0 is
signal regist: std_logic_vector (7 downto 0);
begin
process (CLK, RST)
begin
if CLK='0' and CLK'event and RIn='1'and C='1' then regist<=DataIN;
end if;
if CLK='0' and CLK'event and ROut='1'and C='1' then	DataOut<=regist after 3 ns;
end if;
if CLK='0' and CLK'event and ROut='0' then DataOut<= "ZZZZZZZZ" after 3 ns;
end if;
if RST='1' then 	regist<= "00000000";
end if;
end process;
end R0;
