module controller(clock, resetnot, instruction, rout, ren, addxor, increment);
	input clock, resetnot;

	// Received from datapath.
	input [7:0] instruction;

	// Send to datapath.
	output [15:0] rout, ren;
	output addxor;

	// Send to program counter.
	output increment;

	wire [3:0] currstate, nextstate;
	controller_combnext combnext(
		.currstate(currstate), 
		.instruction(instruction),

		.nextstate(nextstate)
	);
	controller_combout combout(
		.currstate(currstate), 
		.instruction(instruction), 

		.rout(rout), 
		.ren(ren),
		.addxor(addxor),
		.increment(increment)
	);
	controller_regstate regstate(
		.d(nextstate), 
		.q(currstate), 

		.clock(clock), 
		.resetnot(resetnot)
	);
endmodule