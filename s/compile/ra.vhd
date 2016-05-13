-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\ra.vhd
-- Generated   : Fri May 13 01:13:00 2016
-- From        : c:\My_Designs\s\s\src\ra.bde
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

entity ra is
  port(
       CLK : in std_logic;
       RAIn : in std_logic;
       DIn : in std_logic_vector(7 downto 0);
       DOut : out std_logic_vector(7 downto 0)
  );
end ra;

architecture RA of ra is

---- Signal declarations used on the diagram ----

signal reg : std_logic_vector (7 downto 0) := "00000000";

begin

---- Processes ----

process (CLK,RAIn)
                       begin
                         DOut <= reg after 3ns;
                         if CLK = '0' and CLK'event and RAIn = '1' then
                            reg <= DIn;
                         end if;
                       end process;                      

end RA;
