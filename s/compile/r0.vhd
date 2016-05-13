-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\r0.vhd
-- Generated   : Fri May 13 01:13:00 2016
-- From        : c:\My_Designs\s\s\src\r0.bde
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

entity r0 is
  port(
       C : in std_logic;
       CLK : in std_logic;
       RIn : in std_logic;
       ROut : in std_logic;
       RST : in std_logic;
       DataIn : in std_logic_vector(7 downto 0);
       DataOut : out std_logic_vector(7 downto 0)
  );
end r0;

architecture R0 of r0 is

---- Signal declarations used on the diagram ----

signal regist : std_logic_vector (7 downto 0);

begin

---- Processes ----

process (CLK,RST)
                       begin
                         if CLK = '0' and CLK'event and RIn = '1' and C = '1' then
                            regist <= DataIN;
                         end if;
                         if CLK = '0' and CLK'event and ROut = '1' and C = '1' then
                            DataOut <= regist after 3ns;
                         end if;
                         if CLK = '0' and CLK'event and ROut = '0' then
                            DataOut <= "ZZZZZZZZ" after 3ns;
                         end if;
                         if RST = '1' then
                            regist <= "00000000";
                         end if;
                       end process;                      

end R0;
