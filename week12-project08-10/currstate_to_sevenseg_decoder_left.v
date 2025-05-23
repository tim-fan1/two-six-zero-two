module currstate_to_sevenseg_decoder_left(d, q);
	parameter [3:0] 
		PRE_FETCH = 4'b0000, // Load q_rom.
		FETCH = 4'b0001, // Update ISR.
		DECODE = 4'b0010,
		EXEC_AX1 = 4'b0011, // Add/Xor.
		EXEC_AX2 = 4'b0100,
		EXEC_AX3 = 4'b0101,
		EXEC_L = 4'b0110, // Load.
		EXEC_M = 4'b0111, // Move.
		INCREMENT = 4'b1000, // Increment PCR.
		ERROR = 4'b1111; // UNUSED.
	// 4-to-7-bit decoder.
	input  [3:0] d;
	output [6:0] q;
	reg    [6:0] q;
	always @(d) begin
		case (d)
			4'b0000: q <= 7'b0011000; // p
			4'b0001: q <= 7'b0110000; // q
			4'b0010: q <= 7'b0000011; // d
			4'b0011: q <= 7'b0010000; // A
			4'b0100: q <= 7'b0010000; // A
			4'b0101: q <= 7'b0010000; // A
			4'b0110: q <= 7'b1001110; // L
			4'b0111: q <= 7'b0010111; // n
			4'b1000: q <= 7'b1110011; // I
			default: q <= 7'b0111111; // -
		endcase
	end
endmodule