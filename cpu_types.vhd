library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package cpu_types is 
	
	constant halfword_size : positive := 16; -- declares size of halfword
	constant instruction_size : positive := 16;	-- declares size of instruction size
	constant address_size : positive := 8; -- declares size of the address
	constant nibble_size : positive := 4; 
	constant byte_size : positive := 8;	
	constant s_prod_size : positive := 32;
	
	subtype halfword is STD_LOGIC_VECTOR(halfword_size - 1 downto 0);
	subtype s_halfword is signed(halfword_size - 1 downto 0);
	subtype s_prod is signed(s_prod_size - 1 downto 0);
	subtype address is STD_LOGIC_VECTOR(address_size -1 downto 0);
	subtype instruction is STD_LOGIC_VECTOR(instruction_size -1 downto 0);
	subtype nibble is STD_LOGIC_VECTOR(nibble_size - 1 downto 0);
	subtype byte is STD_LOGIC_VECTOR(byte_size - 1 downto 0);
	subtype op_code is STD_LOGIC_VECTOR(2 downto 0); 
	subtype data_sig is STD_LOGIC_VECTOR(1 downto 0); 
	subtype sig is STD_LOGIC;
	
	type ram_memory is array (0 to 255) of s_halfword;
	type register_file is array (0 to 7) of s_halfword;
	
	function decode_opcode (instr : halfword ) return op_code; -- decodes the opcode to Assembly identifiers  
	procedure instruction_fetch (signal clock : in STD_LOGIC; signal instr_data : inout halfword);  -- outputs the next memory instruction every clock cycle	  
	function send_data_signal(alu_op : op_code) return data_sig;
	
	constant add : op_code := "000";
	constant mult : op_code := "001";
	constant passA : op_code := "010";
	constant passB : op_code := "011";
	constant sub : op_code := "100";
	constant ldi : op_code := "101";
	constant sh : op_code := "110";
	constant lh : op_code := "111";
	
end cpu_types;
	
package body cpu_types is 
	
function decode_opcode( instr : halfword ) return op_code is
	variable ALUop : op_code;
begin
		
	ALUop :=  instr(14 downto 12);
	return ALUop;  
		
end decode_opcode;

procedure instruction_fetch (signal clock : in STD_LOGIC;  
							 signal instr_data : inout halfword) is
	type iArray is array (0 to 14) of halfword;
	variable instruction_memory : iArray := (x"500A", x"5105", x"5200", x"5300", x"5400", x"5500", x"5600", 
											 x"5700", x"0201", x"1301", x"4401", x"630B", x"640A", x"760A", x"770B");
	variable counter : integer range 0 to 15 := 0;
begin 
		if clock = '1' and clock'event then
			instr_data <= instruction_memory(counter);
			counter := counter + 1;
		end if;
	
end instruction_fetch;

function send_data_signal(alu_op : op_code) return data_sig is
	variable data_s : data_sig;
begin 
	
	if alu_op = add then 
		data_s := "00";
	elsif alu_op = mult then
		data_s := "00";
	elsif alu_op = sub then
		data_s := "00";
	elsif alu_op = passA then
		data_s := "00";
	elsif alu_op = passB then
		data_s := "00";
	elsif alu_op = ldi then 
		data_s := "01";
	elsif alu_op = lh then
		data_s := "10";
	elsif alu_op = sh then
		data_s := "11";
	end if;
	
	return data_s;

end send_data_signal;


end cpu_types;