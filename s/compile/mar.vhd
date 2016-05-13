-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\mar.vhd
-- Generated   : Fri May 13 01:12:57 2016
-- From        : c:\My_Designs\s\s\src\mar.bde
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

entity mar is
  port(
       CLK : in std_logic;
       MarIn : in std_logic;
       RST : in std_logic;
       AdrIn : in std_logic_vector(7 downto 0);
       AdrOut : out std_logic_vector(7 downto 0)
  );
end mar;

architecture MAR of mar is

---- Signal declarations used on the diagram ----

signal reg : std_logic_vector (7 downto 0) := "00000000";

begin

---- Processes ----

process (CLK,RST)
                       begin
                         if CLK = '0' and CLK'event and MarIn = '1' then
                            reg <= AdrIn;
                         end if;
                         if CLK = '1' and CLK'event then
                            AdrOut <= reg;
                         end if;
                         if RST = '1' then
                            reg <= "00000000";
                         end if;
                       end process;                      

end MAR;
