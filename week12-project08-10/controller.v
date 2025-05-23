module controller(clock, resetnot, ISR, rout, ren, currstate, nextstate, opcode);
	input clock, resetnot;

	// Received from datapath.
	input [7:0] ISR;

	// Send to datapath.
	output [15:0] rout, ren;

	// Internal wires, made visible for debugging.
	output wire [1:0] opcode;
	output wire [3:0] currstate, nextstate;

	controller_combnext combnext(
		.currstate(currstate), 
		.ISR(ISR),

		.nextstate(nextstate),
		.opcode(opcode)
	);
	controller_combout combout(
		.currstate(currstate), 
		.ISR(ISR), 

		.rout(rout), 
		.ren(ren)
	);
	controller_regstate regstate(
		.d(nextstate), 
		.q(currstate), 

		.clock(clock), 
		.resetnot(resetnot)
	);
endmodule