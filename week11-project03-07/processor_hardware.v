module processor_hardware(SW, KEY, HEX0, HEX1, HEX2, HEX3, LEDR);
	input [9:0] SW;
	input [3:0] KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	output [9:0] LEDR;
endmodule