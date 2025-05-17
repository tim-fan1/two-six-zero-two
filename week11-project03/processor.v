module processor(clock, resetnot
	, addxor, increment, instruction, rout, ren
	, bus,
		R0,
		R1,
		R2,
		R3,
		R4,
		R5,
		R6,
		R7,
		G,
		A,
		EXTERN
);
	input clock, resetnot;
	output addxor, increment;
	output [7:0] instruction;

	output [15:0] rout, ren;

	// Internal wires to datapath.
	output [15:0]
		bus,
		R0,
		R1,
		R2,
		R3,
		R4,
		R5,
		R6,
		R7,
		G,
		A,
		EXTERN;

	datapath _datapath(
		.clock(clock),
		.resetnot(resetnot),

		// Receive from controller.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),
		.increment(increment),

		// Send to controller.
		.instruction(instruction),

		// Internal wires.
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
		.instruction(instruction),

		// Send to datapath.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),
		.increment(increment)
	);
endmodule