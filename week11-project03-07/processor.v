module processor(clock, resetnot, instruction
	, addxor, rout, ren, bus, R0, R1, R2, R3, R4
	, R5, R6, R7, G, A, EXTERN, ISR, currstate, nextstate, opcode
);
	input clock, resetnot;

	// FIXME: Received from testbench. Should be retrieved from program memory instead.
	input [7:0] instruction;

	// Internal wires, made visible for debugging.
	output wire [15:0] rout, ren;
	output wire addxor;
	output wire [15:0]
		bus, R0, R1, R2, R3, R4,
		R5, R6, R7, G, A, EXTERN, ISR;
	output wire [3:0] currstate, nextstate;
	output wire [1:0] opcode;

	datapath _datapath(
		.clock(clock),
		.resetnot(resetnot),

		// FIXME: Received from testbench. Should be retrieved from program memory instead.
		.instruction(instruction),

		// Received from controller.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),

		// Send to controller the next instruction.
		.ISR(ISR),

		// Internal wires, made visible for debugging.
		.bus(bus),
		.R0(R0),
		.R1(R1),
		.R2(R2),
		.R3(R3),
		.R4(R4),
		.R5(R5),
		.R6(R6),
		.R7(R7),
		.G(G),
		.A(A),
		.EXTERN(EXTERN)
	);

	controller _controller(
		.clock(clock),
		.resetnot(resetnot),

		// Received from datapath.
		.ISR(ISR),

		// Send to datapath.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),

		// Internal wires, made visible for debugging.
		.currstate(currstate),
		.nextstate(nextstate),
		.opcode(opcode)
	);
endmodule