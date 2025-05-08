module sequence_detector_fsm_combinational_circuit(w, currstate, nextstate);
	parameter [3:0] A = 4'b0000, // Reset state.
	                B = 4'b0001, // 0
	                C = 4'b0010, // 00
	                D = 4'b0011, // 000
	                E = 4'b0100, // 0000! Output success!
	                F = 4'b0101, // 1
	                G = 4'b0110, // 11
	                H = 4'b0111, // 111
	                I = 4'b1000; // 1111! Output success!
	input            w;
	input      [3:0] currstate;
	output reg [3:0] nextstate;

	always @(currstate, w) begin
		case (currstate)
			// Reset state.
			A: if (w == 1'b0) nextstate <= B; else nextstate <= F;
			// 0000.
			B: if (w == 1'b0) nextstate <= C; else nextstate <= F;
			C: if (w == 1'b0) nextstate <= D; else nextstate <= F;
			D: if (w == 1'b0) nextstate <= E; else nextstate <= F;
			E: if (w == 1'b0) nextstate <= E; else nextstate <= F;
			// 1111.
			F: if (w == 1'b0) nextstate <= B; else nextstate <= G;
			G: if (w == 1'b0) nextstate <= B; else nextstate <= H;
			H: if (w == 1'b0) nextstate <= B; else nextstate <= I;
			I: if (w == 1'b0) nextstate <= B; else nextstate <= I;
			// Don't cares.
			default: nextstate <= A;
		endcase
	end
endmodule