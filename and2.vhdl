library IEEE;
use IEEE.std_logic_1164.all;

-- Entität AND2
entity AND2 is
  port (x, y: in std_logic; z: out std_logic);
end AND2;

-- DATAFLOW
architecture DATAFLOW of AND2 is
begin
process is 
	begin
	  z <= x and y; -- AND OPERATION
	  wait for 2 ns;
	end process;
end architecture;

