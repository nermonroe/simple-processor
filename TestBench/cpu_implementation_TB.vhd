library CPU;
use CPU.alu_operation.all;
use CPU.cpu_types.all;
use CPU.ram_memory.all;
use CPU.register_file.all;	

library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
																													   
	-- Add your library and packages declaration here ...

entity cpu_implementation_tb is
end cpu_implementation_tb;

architecture TB_ARCHITECTURE of cpu_implementation_tb is
	-- Component declaration of the tested unit
	component cpu_implementation
	port(
		clock : in sig;
		instruction_cycle : inout halfword;
		R0 : out s_halfword;
		R1 : out s_halfword;
		R2 : out s_halfword;
		R3 : out s_halfword;
		R4 : out s_halfword;
		R5 : out s_halfword;
		R6 : out s_halfword;
		R7 : out s_halfword );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clock : sig;
	signal instruction_cycle : halfword;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal R0 : s_halfword;
	signal R1 : s_halfword;
	signal R2 : s_halfword;
	signal R3 : s_halfword;
	signal R4 : s_halfword;
	signal R5 : s_halfword;
	signal R6 : s_halfword;
	signal R7 : s_halfword;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : cpu_implementation
		port map (
			clock => clock,
			instruction_cycle => instruction_cycle,
			R0 => R0,
			R1 => R1,
			R2 => R2,
			R3 => R3,
			R4 => R4,
			R5 => R5,
			R6 => R6,
			R7 => R7
		);

	clock_period : process
	begin
		clock <= '0';
		wait for 50 ns;
		clock <= '1';
		wait for 50 ns;
	end process clock_period;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cpu_implementation of cpu_implementation_tb is
	for TB_ARCHITECTURE
		for UUT : cpu_implementation
			use entity work.cpu_implementation(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_cpu_implementation;

