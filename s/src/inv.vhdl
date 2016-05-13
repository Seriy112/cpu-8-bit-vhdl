library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity INV is
port (DIn: in std_logic_vector (7 downto 0);
Inv: in std_logic;
DOut: out std_logic_vector (7 downto 0));
end INV;
architecture INV of INV is
begin
DOut<=not DIn when Inv='1'else DIn;
end INV;
