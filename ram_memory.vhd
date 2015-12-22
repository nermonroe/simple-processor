library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

use work.cpu_types.all;

package ram_memory is
	
	procedure writeToMemory(signal clock : in sig; mem_address : in byte; mem_inData : in s_halfword; signal ram : inout ram_memory; mem_read : in sig; mem_write : in sig); 
	function readMemory(signal clock : in sig; mem_address : in byte; signal ram : in ram_memory; mem_write : in sig; mem_read : in sig) return s_halfword;

end ram_memory;

package body ram_memory is
	
procedure writeToMemory(signal clock : in sig; 
						mem_address : in byte; 
						mem_inData : in s_halfword; 
						signal ram : inout ram_memory;
						mem_read : in sig;
						mem_write : in sig) is 

begin
					   
	if clock = '0' and clock'event then
		if mem_write = '1' and mem_read = '0' then
			ram(to_integer(unsigned(mem_address))) <= mem_inData;
		end if;
	end if;
	
end writeToMemory;

function readMemory(signal clock : in sig; 
					 mem_address : in byte;
					 signal ram : in ram_memory;
					 mem_write : in sig;
					 mem_read : in sig) return s_halfword is 
					 
 variable mem_outData : s_halfword;					 
begin 
	
	if clock = '1' and clock'event then
		if mem_read = '1' and mem_write = '0' then 
			mem_outData := ram(to_integer(unsigned(mem_address)));
		end if;
	end if;
	
	return mem_outData;
	
end readMemory;
			
end ram_memory;
	
	