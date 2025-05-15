module controller_combnext(currstate, nextstate, start, instruction);
	parameter [3:0] 
		ZERO = 4'b0000, // State assignments.
		ONE = 4'b0001,
		A1 = 4'b0010,
		A2 = 4'b0011,
		A3 = 4'b0100,
		L = 4'b0101,
		M = 4'b0110,
		X1 = 4'b0111,
		X2 = 4'b1000,
		X3 = 4'b1001,
		E = 4'b1111;
	parameter [1:0]
		LOAD = 2'b00, // Opcodes.
		MOVE = 2'b01,
		ADD = 2'b10,
		XOR = 2'b11;
	input start;
	input [3:0] currstate;
	input [7:0] instruction;
	output reg [3:0] nextstate;

	wire [1:0] opcode;
	assign opcode = instruction[7:6];

	always @(currstate, start) begin
		case (currstate)
			ZERO: nextstate <= (start == 1'b0) ? ZERO : ONE; // Only transition to ONE when next instruction is ready!
			ONE: nextstate <= (opcode == LOAD) ? L : (opcode == MOVE) ? M : (opcode == ADD) ? A1 : X1; // Which operation is instruction?
			A1: nextstate <= A2;
			A2: nextstate <= A3;
			A3: nextstate <= ZERO;
			L: nextstate <= ZERO;
			M: nextstate <= ZERO;
			X1: nextstate <= X2;
			X2: nextstate <= X3;
			X3: nextstate <= ZERO;
			default: nextstate <= E;
		endcase
	end
endmodule