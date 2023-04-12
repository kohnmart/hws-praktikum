library IEEE;
use IEEE.std_logic_1164.all;


entity OR2 is
  port (x, y: in std_logic; z: out std_logic);
end OR2;


architecture DATAFLOW of OR2 is
begin
	process is 
		begin
		z <= x or y;
		wait for 3 ns;
		end process;
end architecture;
