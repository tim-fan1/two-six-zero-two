module controller(clock, resetnot, start, instruction, currstate, nextstate);
	input clock, resetnot, start;
	input [7:0] instruction;

	output [3:0] currstate, nextstate;

	controller_combnext combnext(.currstate(currstate), .nextstate(nextstate), .start(start), .instruction(instruction));
	controller_regstate regstate(.d(nextstate), .q(currstate), .clock(clock), .resetnot(resetnot));
endmodule