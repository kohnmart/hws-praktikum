library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


-- HALF ADDER hat zwei Eingangs- und Ausgangssignale
entity HALF_ADDER is
  port (a, b: in std_logic; sum, carry: out std_logic);
end HALF_ADDER;


-- BEHAVIOR
-- Die Eingänge a, b werden in 2-bit-unsigned-variables erweitert
-- -> Durchführung arithmetischer Operationen, Behandlung als Binärzahlen
-- a2 und a2 werden in result addiert
-- Result stellt sum und carry-bit dar.
architecture BEHAVIOR of HALF_ADDER is
begin
  process (a, b)
    variable a2, b2, result: unsigned (1 downto 0); -- Given range
  begin
    a2 := '0' & a;      -- extend 'a' to 2 bit
    b2 := '0' & b;      -- extend 'b' to 2 bit
    result := a2 + b2;  -- add them
    sum <= result(0);   -- output 'sum' = lower bit
    carry <= result(1); -- output 'carry' = upper bit
  end process;

end BEHAVIOR;


-- DATAFLOW
-- Logische Datenflussbeschreibung
-- Berechnung mit den logischen Funktionen (XOR, AND)
architecture DATAFLOW of HALF_ADDER is
begin
  sum <= a xor b; -- output 'sum' from xor op
  carry <= a and b; -- output 'carry' from and op
end DATAFLOW;


-- STRUCTURE
-- Beschreibung von inneren Strukturen der Schaltung
-- Sub-Entitäten wie AND2 und XOR2 (Komponenteninstanzen)
-- Generierung von SUM und CARRY Signal
architecture STRUCTURE of HALF_ADDER is

  component XOR2
    port (x, y: in std_logic; z: out std_logic);
  end component;

  component AND2
    port (x, y: in std_logic; z: out std_logic);
  end component;

  for I0: XOR2 use entity WORK.XOR2(DATAFLOW); -- ENTITÄT = Implementierung
  for I1: AND2 use entity WORK.AND2(DATAFLOW); -- ENTITÄT = Implementierung

begin
  I0: XOR2 port map(x => a, y => b, z => sum); -- Verbindung HALF_ADDER = XOR2
  I1: AND2 port map(x => a, y => b, z => carry); -- Verbindung HALF_ADDER = AND2
end STRUCTURE;
