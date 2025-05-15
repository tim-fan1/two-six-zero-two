module controller(clock, resetnot, start, instruction, currstate, nextstate, rout, ren);
	input clock, resetnot, start;
	input [7:0] instruction;

	output [3:0] currstate, nextstate;
	output [15:0] rout, ren;
	controller_combnext combnext(.currstate(currstate), .nextstate(nextstate), .start(start), .instruction(instruction));
	controller_combout combout(.currstate(currstate), .instruction(instruction), .rout(rout), .ren(ren));
	controller_regstate regstate(.d(nextstate), .q(currstate), .clock(clock), .resetnot(resetnot));
endmodule