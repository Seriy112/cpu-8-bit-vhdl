-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\car.vhd
-- Generated   : Fri May 13 01:12:55 2016
-- From        : c:\My_Designs\s\s\src\car.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
        use ieee.std_logic_1164.all;

entity car is
  port(
       CarIn : in std_logic;
       D : in std_logic_vector(5 downto 0);
       CarOut : out std_logic;
       Q : out std_logic_vector(5 downto 0)
  );
end car;

architecture CAR of car is

begin

---- Processes ----

process (CarIn)
                       begin
                         if CarIn = '0' and CarIn'event then
                            Q <= D;
                            CarOut <= '1';
                         end if;
                         if CarIn = '1' and CarIn'event then
                            CarOut <= '0';
                         end if;
                       end process;                      

end CAR;
