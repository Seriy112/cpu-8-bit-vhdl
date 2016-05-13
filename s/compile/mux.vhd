-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : s
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\s\s\compile\mux.vhd
-- Generated   : Fri May 13 01:12:59 2016
-- From        : c:\My_Designs\s\s\src\mux.bde
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

entity mux is
  port(
       Adr0 : in std_logic;
       Adr1 : in std_logic;
       CLK : in std_logic;
       IN1 : in std_logic_vector(5 downto 0);
       IN2 : in std_logic_vector(5 downto 0);
       IN3 : in std_logic_vector(5 downto 0);
       MuxOut : out std_logic;
       OUT1 : out std_logic_vector(5 downto 0)
  );
end mux;

architecture MUX of mux is

begin

---- Processes ----

process (CLK)
                       begin
                         if CLK = '1' and CLK'event then
                            if Adr1 = '0' and Adr0 = '0' then
                               OUT1 <= IN1;
                            elsif Adr1 = '1' then
                               OUT1 <= IN2;
                            elsif Adr1 = '0' and Adr0 = '1' then
                               OUT1 <= IN3;
                            else 
                               OUT1 <= "000000";
                            end if;
                            MuxOut <= '1';
                         end if;
                         if CLK = '0' and CLK'event then
                            MuxOut <= '0';
                         end if;
                       end process;                      

end MUX;
