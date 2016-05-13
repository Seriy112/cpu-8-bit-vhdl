library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity RDC is
port (Number: in std_logic_vector (7 downto 0);
RDCIn: in std_logic;
R1: out std_logic;
R2: out std_logic;
R3: out std_logic;
R4: out std_logic);
end RDC;
architecture RDC of RDC is
begin
process(RDCIn)
begin	
if RDCIn='1' and RDCIn'event then
R1<='0';
R2<='0';
R3<='0';
R4<='0';
if Number= "00000001" then R1<='1'after 2ns; 
end if;
if Number= "00000010" then R2<='1'after 2ns;
end if;
if Number= "00000011" then R3<='1'after 2ns;
end if;
if Number= "00000100" then R4<='1'after 2ns;
end if;
end if;
end process;
end RDC;
