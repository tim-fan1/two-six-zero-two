module controller_onehotdecoder(d, q);
	parameter [15:0]
		R0 = 1 << 0,
		R1 = 1 << 1,
		R2 = 1 << 2,
		R3 = 1 << 3,
		R4 = 1 << 4,
		R5 = 1 << 5,
		R6 = 1 << 6,
		R7 = 1 << 7,
		G = 1 << 8,
		A = 1 << 9,
		EXTERN = 1 << 10,
		ISR = 1 << 11, // instruction reg.
		PCR = 1 << 12, // program counter reg.
		ROM = 1 << 13, // instruction memory.
		UNUSED = 1 << 15;
	input [3:0] d;
	output reg [15:0] q;
	always @(d) begin
		case (d)
		4'b0000: q <= R0;
		4'b0001: q <= R1;
		4'b0010: q <= R2;
		4'b0011: q <= R3;
		4'b0100: q <= R4;
		4'b0101: q <= R5;
		4'b0110: q <= R6;
		4'b0111: q <= R7;
		4'b1000: q <= G;
		4'b1001: q <= A;
		4'b1010: q <= EXTERN;
		4'b1011: q <= ISR;
		4'b1100: q <= PCR;
		4'b1101: q <= ROM;
		default: q <= UNUSED;
		endcase
	end
endmodule