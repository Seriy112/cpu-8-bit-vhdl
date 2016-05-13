-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\pc.vhd
-- Generated   : Fri May 13 01:12:59 2016
-- From        : c:\My_Designs\s\s\src\pc.bde
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
        use ieee.std_logic_signed.all;

entity pc is
  port(
       CLK : in std_logic;
       IncPC : in std_logic;
       PCIn : in std_logic;
       RST : in std_logic;
       AdrIn : in std_logic_vector(7 downto 0);
       AdrOut : out std_logic_vector(7 downto 0)
  );
end pc;

architecture PC of pc is

---- Signal declarations used on the diagram ----

signal reg : std_logic_vector (7 downto 0);

begin

---- Processes ----

process (CLK,RST)
                       begin
                         if CLK = '0' and CLK'event and PCIn = '1' then
                            reg <= AdrIn;
                         end if;
                         if CLK = '0' and CLK'event and IncPC = '1' then
                            reg <= reg + "0000001" after 2ns;
                         end if;
                         if CLK = '1' and CLK'event then
                            AdrOut <= reg after 2ns;
                         end if;
                         if RST = '1' then
                            reg <= "00000000";
                         end if;
                       end process;                      

end PC;
