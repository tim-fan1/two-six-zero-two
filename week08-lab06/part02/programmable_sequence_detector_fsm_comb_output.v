module programmable_sequence_detector_fsm_comb_output(currstate, z);
	parameter [3:0] A = 4'b0000, // Reset state.
	                B = 4'b0001, // 0
	                C = 4'b0010, // 00
	                D = 4'b0011, // 000
	                E = 4'b0100; // 0000! Output success!
	input [3:0] currstate;
	output reg  z;
	always @(currstate) begin
		case (currstate)
			A: z <= 1'b0;
			B: z <= 1'b0;
			C: z <= 1'b0;
			D: z <= 1'b1;
			E: z <= 1'b1;
			// Don't cares.
			default: z <= 1'b0;
		endcase
	end
endmodule