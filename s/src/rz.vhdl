library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity RZ is
port (DIn: in std_logic_vector (7 downto 0);
CLK: in std_logic;
RST: in std_logic;
RZOut: in std_logic;
RZIn: in std_logic;
InvZ: in std_logic;
DOut: out std_logic_vector (7 downto 0));
end RZ;
architecture RZ of RZ is
signal regist: std_logic_vector (7 downto 0);
begin
process (CLK, RST)
begin
if CLK='0' and CLK'event and RZIn='1' then regist<=DIN;
end if;
if CLK='0' and CLK'event and RZOut='1' then
if InvZ='1'then	DOut<=not regist after 3 ns;
else DOut<=regist after 3 ns;
end if;
end if;
if CLK='0' and CLK'event and RZOut='0' then	DOut<= "ZZZZZZZZ" after 3 ns;
end if;
if RST='1' then	regist<= "00000000";
end if;
end process;	
end RZ;
