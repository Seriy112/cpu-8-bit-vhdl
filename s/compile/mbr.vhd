-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\mbr.vhd
-- Generated   : Fri May 13 01:12:58 2016
-- From        : c:\My_Designs\s\s\src\mbr.bde
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

entity mbr is
  port(
       CLK : in std_logic;
       MbrIn : in std_logic;
       MbrInD : in std_logic;
       MbrOut : in std_logic;
       MbrOutD : in std_logic;
       RST : in std_logic;
       DataIn : inout std_logic_vector(7 downto 0);
       DataOut : inout std_logic_vector(7 downto 0)
  );
end mbr;

architecture MBR of mbr is

---- Signal declarations used on the diagram ----

signal reg : std_logic_vector (7 downto 0);

begin

---- Processes ----

process (CLK,RST)
                       begin
                         if CLK = '0' and CLK'event then
                            if MbrIn = '1' then
                               reg <= DataIn;
                            elsif MbrOut = '1' then
                               DataOut <= reg;
                            elsif MbrInD = '1' then
                               reg <= DataOut;
                            elsif MbrOutD = '1' then
                               DataIn <= reg;
                            end if;
                            if MbrIn = '0' and MbrOutD = '0' then
                               DataIn <= "ZZZZZZZZ";
                            end if;
                            if MbrOut = '0' and MbrInD = '0' then
                               DataOut <= "ZZZZZZZZ";
                            end if;
                         end if;
                         if RST = '1' then
                            reg <= "00000000";
                         end if;
                       end process;                      

end MBR;
