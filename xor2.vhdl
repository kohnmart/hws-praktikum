library IEEE;
use IEEE.std_logic_1164.all;

-- Entity-Deklaration für ein 2-Exklusiv-OR-Gatter (XOR2)
entity XOR2 is
  port (x, y: in std_logic; z: out std_logic);
end XOR2;

-- IM DATAFLOW wird das Verhalten über logische Zuweisungen definiert. 
architecture DATAFLOW of XOR2 is
begin
process is 
	begin
	  z <= x xor y;
	  wait for 2 ns;
	end process;  
end architecture;

