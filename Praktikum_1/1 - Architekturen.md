
Die Beschreibung einer Entität erfolgt durch dei Schlüsselwörter "entity",  "architecture" und "process".	

	Entity:
	-> Modellierungseinheit (Schnittstellenbeschreibung)
	-> Angabe von Datentyp, Größe und Parameter
	-> Vergleichbar mit einer Klasse in der objektorientierten Programmierung. 
	-> Hierarchisch strukturiert

	Architecture:
	-> Beschreibung der Implementierung (interne Verarbeitung Signale/Logik)
	-> Definition welche Signale und Komponenten die Entität verwendet
	-> Implementierung einer Schnittstelle

	Process:
	-> Verarbeitung von Daten in einer Architektur
	-> Sequentielle Anweisungen
	-> Reaktion auf Ereignisse / Bedingungen auswerten 
	-> Algorithmus, der Logik in einer Architektur 

<br>
### *a.) Machen Sie sich mit dem Inhalt der Dateien vertraut. Welche Entity und welche Architektur ist wo definiert?

**half_adder_testbench.vhdl:** 
Die Testbench ist eine spezielle Architektur, die dazu dient die Entität half_adder zu testen. Die Entität wird instanzziert und verschiedene Eingangssignale werden generiert um deren Ausgang zu überprüfen. Sicherstellung der Funktionalität.

	- Vergleich von mehreren Ausgangsverhalten
	- Testen von Timing- und Latenzanforderungen

Eine Testbench ist wichtiger Bestandteil des Entwurfsprozesses von digitalen Schaltungen. 
Fehler und Probleme sollen frühzeitig erkannt werden.

## Instanzierung

Definition einer Schnittstelle zu einer Entität wie beispielsweise HALF_ADDER
Es besteht aus zwei Eingangsvariablen (a ,b) und den Ausgangsvariablen (sum, carry).
Diese Komponente kann in verschiedenen Entitäten wie auch beispielsweise dem FULL_ADDER
zum Einsatz kommen.

````md
```vhdl
  component HALF_ADDER is
    port (a, b: in std_logic; sum, carry: out std_logic);
  end component;
```
````


## Konfigierung

Definierungen der Implementierungen für DATAFLOW und STRUCTURE von Half_Adder. Konfiguration bieten die Möglichkeit ein oder mehrere Implementierungen einer Entität zu definieren.

````md
```vhdl
  for SPEC: HALF_ADDER use entity WORK.HALF_ADDER(DATAFLOW);
  for IMPL: HALF_ADDER use entity WORK.HALF_ADDER(STRUCTURE);
```
````


**half_adder.vhdl:**	Enthält die Entity half_adder welche als a und b als Eingangssignale und sum und carry als Ausgangssignale deklariert. Alle vier Parameter werden als Typ STD_Logic definiert. Zusätzlich enthält das Skript die Architekturen bzw. Definition wie Signale und Komponenten verwendet werden. Dazu gehört BEHAVIOR, DATAFLOW und STRUCTURE.

**and2.vhdl**: Enthält die Entity AND2 mit den Eingangssignalen (a,b) und dem Ausgangssignal z bzw. der Carry_out. In der Architektur wird der DATAFLOW
mit der Zuweisung "z <= x and y " implementiert. Das Ergebnis dieser AND-Operation wird dem Ausgang "z" zugewiesen. 

**xor2.vhdl**:  Enthält die Entity XOR2 mit den Eingangssignalen (x,y) und dem Ausgangssignal z bzw. der Summe. In der Architektur wird der DATAFLOW beschrieben welcher die Zuweisung "z <= x xor y" implementiert. Das Ergebnis dieser XOR-Operation wird dem Ausgang "z" zugeweisen.


### ***b. Was sind die wesentlichen Unterschiede zwischen einer Struktur-, einer  Verhaltens- und einer  Datenfluss-Beschreibung? 

***BEHAVIOR (Abstraktion)
	- Beschreibung der Schaltung auf höherer Abstraktionsebene
	- Verhalten bei bestimmten Eingaben (if-else oder case-Bedingungen)
	- Ineffizient wenn Hardware-nah

***DATAFLOW (Fluss)
	- Beschreibt wie Daten durch die Schaltung fließen
	- Verwendung von Signalzuweisungen
	- Verknüpfung von Eingang- und Ausgangssignalen
	- Für parallele Schaltungen geeignet

***STRUCTURE (Physisch)
	- Beschreibt interne Struktur der Schaltung
	- Setzt sich aus anderen Sub-Entitäten bzw. Schaltungen zusammen
	- Verknüpft Systemmodule
	- Gatter, Flip-Flop oder andere Komponenten


***c. Analysieren alle Dateien für den Halbaddierer. Stellen Sie anschließend mit GHDL (Aufruf:  ees-ghdl ) fest, welche Elemente in der Bibliothek WORK enthalten sind.

