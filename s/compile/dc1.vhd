-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\dc1.vhd
-- Generated   : Fri May 13 01:12:56 2016
-- From        : c:\My_Designs\s\s\src\dc1.bde
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

entity dc1 is
  port(
       Ale : in std_logic;
       Com : in std_logic_vector(7 downto 0);
       ComAdr : out std_logic_vector(5 downto 0)
  );
end dc1;

architecture DC1 of dc1 is

begin

---- Processes ----

process (Ale)
                       begin
                         if Ale = '1' and Ale'event then
                            if Com = "00000000" then
                               ComAdr <= "000111";
                            elsif Com = "00000001" then
                               ComAdr <= "001110";
                            elsif Com = "00000010" then
                               ComAdr <= "011011";
                            elsif Com = "00000011" then
                               ComAdr <= "100111";
                            elsif Com = "00000100" then
                               ComAdr <= "110011";
                            else 
                               ComAdr <= "000000";
                            end if;
                         end if;
                       end process;                      

end DC1;
