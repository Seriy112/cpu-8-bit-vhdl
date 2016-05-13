library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MAR is
port (RST: in std_logic;
CLK: in std_logic;
MarIn: in std_logic;
AdrIn: in std_logic_vector (7 downto 0);
AdrOut: out std_logic_vector (7 downto 0));
end MAR;
architecture MAR of MAR is
signal reg: std_logic_vector (7 downto 0):= "00000000";
begin
process (CLK, RST)
begin
if CLK='0' and CLK'event and MarIn='1' then reg<=AdrIn;
end if;
if CLK='1' and CLK'event then AdrOut<=reg;
end if;
if RST='1' then	reg<= "00000000";
end if;
end process;
end MAR;
