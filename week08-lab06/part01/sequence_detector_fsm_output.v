module sequence_detector_fsm_output(currstate, w, clock, resetnot, z);
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
	input       w, clock, resetnot;
	output reg  z;
	always @(posedge clock or negedge resetnot) begin
		if (resetnot == 1'b0) z <= 1'b0;
		else
		// posedge clock is at the same moment that currstate 
		// is about to be changed to nextstate. In other words, 
		// current currstate is still currstate.
		case (currstate)
			// Reset state.
			A: z <= 1'b0;
			// 0000.
			B: z <= 1'b0;
			C: z <= 1'b0;
			D: if (w == 1'b0) z <= 1'b1; else z <= 1'b0; // Will be transition to success!
			E: if (w == 1'b0) z <= 1'b1; else z <= 1'b0;
			// 1111.
			F: z <= 1'b0;
			G: z <= 1'b0;
			H: if (w == 1'b0) z <= 1'b0; else z <= 1'b1; // Will be transition to success!
			I: if (w == 1'b0) z <= 1'b0; else z <= 1'b1; 
			// Don't cares.
			default: z <= 1'b0;
		endcase
	end
endmodule