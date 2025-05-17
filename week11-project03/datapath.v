module datapath(clock, resetnot, rout, ren, addxor, increment, instruction
	, bus, R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN, alu
);
	parameter [15:0]
		_R0 = 1 << 0,
		_R1 = 1 << 1,
		_R2 = 1 << 2,
		_R3 = 1 << 3,
		_R4 = 1 << 4,
		_R5 = 1 << 5,
		_R6 = 1 << 6,
		_R7 = 1 << 7,
		_G = 1 << 8,
		_A = 1 << 9,
		_EXTERN = 1 << 10,
		_UNUSED = 1 << 15;
	input clock, resetnot, addxor, increment;
	input [15:0] rout, ren;

	// The only signal to send to controller.
	output reg [7:0] instruction;

	// The rest are internal wires, made viewable for debugging.
	output reg [15:0] bus; 
	output reg [15:0] R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN;
	output [15:0] alu;

	// Load data onto EXTERN wire.
	always @(instruction, addxor) begin
		if (addxor == 1'b1) EXTERN <= instruction[2:0];
	end

	datapath_alu _datapath_alu(.alu(alu), .addxor(addxor), .A(A), .bus(bus));

	// Storing on bus.
	always @(rout, R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN) begin
		case (rout)
		_R0: bus <= R0;
		_R1: bus <= R1;
		_R2: bus <= R2;
		_R3: bus <= R3;
		_R4: bus <= R4;
		_R5: bus <= R5; 
		_R6: bus <= R6;
		_R7: bus <= R7;
		_G: bus <= G;
		_A: bus <= A;
		_EXTERN: bus <= EXTERN;
		_UNUSED: bus <= 0;
		endcase
	end

	// Loading from bus.
	always @(ren, bus, alu) begin
		case (ren)
		_R0: R0 <= bus;
		_R1: R1 <= bus;
		_R2: R2 <= bus;
		_R3: R3 <= bus;
		_R4: R4 <= bus;
		_R5: R5 <= bus; 
		_R6: R6 <= bus;
		_R7: R7 <= bus;
		_G: G <= alu;
		_A: A <= bus;
		_EXTERN: EXTERN <= bus;
		_UNUSED: bus <= bus;
		endcase
	end

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
		4'b0000: instruction <= 8'b01000001; // load $0 01
		4'b0001: instruction <= 8'b01001010; // load $1 10
		4'b0010: instruction <= 8'b10000001; // add $0 $1
		4'b0011: instruction <= 8'b10000001; // add $0 $1
		4'b0100: instruction <= 8'b10000001; // ...
		4'b0101: instruction <= 8'b10000001;
		4'b0110: instruction <= 8'b10000001;
		4'b0111: instruction <= 8'b10000001;
		4'b1000: instruction <= 8'b10000001;
		4'b1001: instruction <= 8'b10000001;
		4'b1010: instruction <= 8'b10000001;
		4'b1011: instruction <= 8'b10000001;
		4'b1100: instruction <= 8'b10000001;
		4'b1101: instruction <= 8'b10000001;
		4'b1110: instruction <= 8'b10000001;
		default: instruction <= 8'b00000000; // essentially nop, 
		                                     // move r0 to r0.
		endcase
	end
endmodule