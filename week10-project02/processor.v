module processor(clock, resetnot
	, addxor, increment, instruction, rout, ren
);
	input clock, resetnot;
	output addxor, increment;
	output [7:0] instruction;

	output [15:0] rout, ren;

	datapath _datapath(
		.clock(clock),
		.resetnot(resetnot),

		// Receive from controller.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),
		.increment(increment),

		// Send to controller.
		.instruction(instruction)
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