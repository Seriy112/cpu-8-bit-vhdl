library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
use IEEE.STD_LOGIC_arith.all;
entity Add is
port (SIn: in std_logic_vector (5 downto 0);
Inc: in std_logic;
Reset: in std_logic;
SOut: out std_logic_vector (5 downto 0));
end Add;
architecture Add of Add is
begin	
process (Inc, reset)
begin	
if Inc='1' and Inc'event then
SOut<=CONV_STD_LOGIC_VECTOR(((CONV_INTEGER ('0'& SIn))+1), 6);
end if;
if Reset='1' then
SOut<= "000000"; 
end if;	
end process;
end Add;
