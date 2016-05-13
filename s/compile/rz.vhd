-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\rz.vhd
-- Generated   : Fri May 13 01:13:01 2016
-- From        : c:\My_Designs\s\s\src\rz.bde
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

entity rz is
  port(
       CLK : in std_logic;
       InvZ : in std_logic;
       RST : in std_logic;
       RZIn : in std_logic;
       RZOut : in std_logic;
       DIn : in std_logic_vector(7 downto 0);
       DOut : out std_logic_vector(7 downto 0)
  );
end rz;

architecture RZ of rz is

---- Signal declarations used on the diagram ----

signal regist : std_logic_vector (7 downto 0);

begin

---- Processes ----

process (CLK,RST)
                       begin
                         if CLK = '0' and CLK'event and RZIn = '1' then
                            regist <= DIN;
                         end if;
                         if CLK = '0' and CLK'event and RZOut = '1' then
                            if InvZ = '1' then
                               DOut <= not regist after 3ns;
                            else 
                               DOut <= regist after 3ns;
                            end if;
                         end if;
                         if CLK = '0' and CLK'event and RZOut = '0' then
                            DOut <= "ZZZZZZZZ" after 3ns;
                         end if;
                         if RST = '1' then
                            regist <= "00000000";
                         end if;
                       end process;                      

end RZ;
