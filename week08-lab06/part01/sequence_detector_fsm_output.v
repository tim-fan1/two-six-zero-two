module sequence_detector_fsm_output(currstate, w, z);
	parameter [3:0] A = 4'b0000, // Reset state.
	                B = 4'b0001, // 0
	                C = 4'b0010, // 00
	                D = 4'b0011, // 000
	                E = 4'b0100, // 0000! Output success!
	                F = 4'b0101, // 1
	                G = 4'b0110, // 11
	                H = 4'b0111, // 111
	                I = 4'b1000; // 1111! Output success!
	input [3:0] currstate;
	input       w;
	output reg  z;
	always @(currstate, w) begin
		case (currstate)
			// Reset state.
			A: z <= 1'b0;
			// 0000.
			B: z <= 1'b0;
			C: z <= 1'b0;
			D: z <= 1'b0;
			E: if (w == 1'b0) z <= 1'b1; else z <= 1'b0;
			// 1111.
			F: z <= 1'b0;
			G: z <= 1'b0;
			H: z <= 1'b0;
			I: if (w == 1'b0) z <= 1'b0; else z <= 1'b1; 
			// Don't cares.
			default: z <= 1'b0;
		endcase
	end
endmodule