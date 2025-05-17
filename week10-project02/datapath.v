module datapath(clock, resetnot, rout, ren, addxor, increment, instruction);
	input clock, resetnot, addxor, increment;
	input [15:0] rout, ren;

	output reg [7:0] instruction;

	// TEMP. Hard-coding hard-coding program.
	//
	// Program counter.
	reg [3:0] program_counter;
	initial program_counter = ~0; // Start at end, so that on first
	                              // posedge, loops back to start.
	always @(posedge increment)
		program_counter <= program_counter + 1;

	// Instruction memory.
	always @(program_counter) begin
		case (program_counter)
		4'b0000: instruction <= 8'b10110001;
		4'b0001: instruction <= 8'b11010111;
		4'b0010: instruction <= 8'b00000101;
		4'b0011: instruction <= 8'b01010110;
		4'b0100: instruction <= 8'b01011111;
		4'b0101: instruction <= 8'b11001111;
		4'b0110: instruction <= 8'b10001101;
		4'b0111: instruction <= 8'b11001101;
		4'b1000: instruction <= 8'b00001101;
		4'b1001: instruction <= 8'b00000101;
		4'b1010: instruction <= 8'b00000001;
		4'b1011: instruction <= 8'b11001100;
		default: instruction <= 8'b00000000; // essentially nop, 
		                                     // move r0 to r0.
		endcase
	end
endmodule