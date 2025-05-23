module controller_combnext(currstate, nextstate, ISR, opcode);
	parameter [3:0] 
		PRE_FETCH = 4'b0000, // Enable ROM output, instruction at PCR.
		FETCH = 4'b0001, // Update ISR with ROM output.
		DECODE = 4'b0010, // Decode instruction in ISR.
		EXEC_AX1 = 4'b0011, // Is it Add/Xor?
		EXEC_AX2 = 4'b0100,
		EXEC_AX3 = 4'b0101,
		EXEC_L = 4'b0110, // Is it Load?
		EXEC_M = 4'b0111, // Is it Move?
		INCREMENT = 4'b1000, // Increment PCR.
		ERROR = 4'b1111; // UNUSED.
	parameter [1:0]
		MOVE = 2'b00, // Opcodes.
		LOAD = 2'b01,
		ADD = 2'b10,
		XOR = 2'b11;
	input [3:0] currstate;
	input [7:0] ISR;
	output reg [3:0] nextstate;

	output [1:0] opcode;
	assign opcode = ISR[7:6];

	always @(currstate, ISR) begin
		case (currstate)
		PRE_FETCH: nextstate <= FETCH;
		FETCH: nextstate <= DECODE;
		DECODE: nextstate <= (opcode == MOVE) ? EXEC_M : // What operation to execute?
		                     (opcode == LOAD) ? EXEC_L : 
		                     (opcode == ADD) ? EXEC_AX1 :
		                     (opcode == XOR) ? EXEC_AX1 : 
		                     ERROR;
		EXEC_AX1: nextstate <= EXEC_AX2;
		EXEC_AX2: nextstate <= EXEC_AX3;
		EXEC_AX3: nextstate <= INCREMENT;
		EXEC_L: nextstate <= INCREMENT;
		EXEC_M: nextstate <= INCREMENT;
		INCREMENT: nextstate <= PRE_FETCH;
		default: nextstate <= ERROR;
		endcase
	end
endmodule