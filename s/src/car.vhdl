library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity CAR is
port (D: in std_logic_vector (5 downto 0);
CarIn: in std_logic;
CarOut: out std_logic;
Q: out std_logic_vector (5 downto 0));
end CAR;
architecture CAR of CAR is
begin
process(CarIn)
begin	
if CarIn='0' and CarIn'event then
Q<=D;
CarOut<='1';
end if;
if CarIn='1' and CarIn'event then CarOut<='0';
end if;
end process; 
end CAR;
