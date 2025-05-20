module controller(clock, resetnot, ISR, rout, ren, addxor, currstate, nextstate, opcode);
	input clock, resetnot;
	input [7:0] ISR;

	// Send to datapath.
	output [15:0] rout, ren;
	output addxor;
	output [1:0] opcode;

	output [3:0] currstate, nextstate;
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
		.ren(ren),
		.addxor(addxor)
	);
	controller_regstate regstate(
		.d(nextstate), 
		.q(currstate), 

		.clock(clock), 
		.resetnot(resetnot)
	);
endmodule