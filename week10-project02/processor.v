module processor(clock, resetnot
	, addxor, increment, instruction, rout, ren
);
	input clock, resetnot;
	output addxor, increment;
	output reg [7:0] instruction;
	output [2:0] instruction_address;

	output [15:0] rout, ren;

	// datapath _datapath(
	// 	.clock(clock),
	// 	.resetnot(resetnot),

	// 	// Received from instruction memory.
	// 	.instruction(instruction),

	// 	// Receive from controller.
	// 	.rout(rout),
	// 	.ren(ren),
	// 	.addxor(addxor)
	// );

	controller _controller(
		.clock(clock), 
		.resetnot(resetnot), 

		// Received from instruction memory.
		.instruction(instruction),

		// Send to datapath.
		.rout(rout),
		.ren(ren),
		.addxor(addxor),

		// Send to program counter.
		.increment(increment)
	);

	reg [1:0] program_counter;
	initial program_counter = 0;
	always @(program_counter) begin
		case (program_counter)
		2'b00: instruction <= 8'b10110001;
		2'b01: instruction <= 8'b11010111;
		2'b10: instruction <= 8'b00000101;
		2'b11: instruction <= 8'b01010110;
		endcase
	end
	always @(posedge increment)
		program_counter <= program_counter + 1;

	// program_counter _program_counter(
	// 	.clock(clock),
	// 	.resetnot(resetnot),

	// 	// Received from controller.
	// 	.increment(increment),

	// 	// Send to instruction memory.
	// 	.instruction_address(instruction_address)
	// );

	// instruction_memory _instruction_memory(
	// 	// Received from program counter.
	// 	.instruction_address(instruction_address),

	// 	// Send instruction at program counter, to controller and datapath.
	// 	.instruction(instruction)
	// );
endmodule