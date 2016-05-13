library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity DC1 is
port (Ale:in std_logic;
Com: in std_logic_vector (7 downto 0);
ComAdr: out std_logic_vector (5 downto 0));
end DC1;
architecture DC1 of DC1 is
begin	
process(Ale)
begin
if Ale='1' and Ale'event then
if Com= "00000000" then	ComAdr <= "000111";
elsif Com= "00000001" then ComAdr <= 	"001110";
elsif Com= "00000010" then	ComAdr <= 	"011011";
elsif Com= "00000011" then	ComAdr <= 	"100111";
elsif Com= "00000100" then ComAdr <= 	"110011";
else ComAdr <= "000000";
end if;
end if;
end process;
end DC1;
