library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity RA is
port (
CLK: in std_logic;
RAIn: in std_logic;
DIn: in std_logic_vector (7 downto 0);
DOut: out std_logic_vector (7 downto 0)
);
end RA;
architecture RA of RA is	
signal reg: std_logic_vector (7 downto 0):= "00000000";
begin
process (CLK, RAIn)
begin
DOut<=reg after 3 ns;
if CLK='0' and CLK'event and RAIn='1' then
reg<=DIn;
end if;
end process;
end RA;
