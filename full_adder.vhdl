library IEEE;
use IEEE.std_logic_1164.all;

entity FULL_ADDER is
	port(a, b, c_in: in std_logic; sum, c_out: out std_logic);
end FULL_ADDER;

architecture BEHAVIOR of FULL_ADDER is 
begin 
  -- Logik der Volladdierer-Schaltung
  sum <= a xor b xor c_in;
  c_out <= (a and b) or (c_in and (a xor b));
end BEHAVIOR;

architecture STRUCTURE of FULL_ADDER is

	component HALF_ADDER 
		port (a, b: in std_logic; sum, carry: out std_logic);
	end component;
	
	component OR2
		port (x, y: in std_logic; z: out std_logic);
	end component;
	
	signal ha0_sum, ha0_carry, ha1_carry: std_logic;
	
begin 
	I_HA0: HALF_ADDER port map(a => a, b => b, sum => ha0_sum, carry => ha0_carry);
	I_HA1: HALF_ADDER port map(a => ha0_sum, b => c_in, sum => sum, carry => ha1_carry);
	I_OR: OR2 port map(x => ha0_carry, y => ha1_carry, z => c_out);
end STRUCTURE;
