module programmable_sequence_detector_fsm_comb_next(w, count, n, currstate, nextstate, counter_resetnot_sync, counter_enable);
	parameter  [3:0] A = 4'b0000,
	                 B = 4'b0001,
	                 C = 4'b0010,
	                 D = 4'b0011,
	                 E = 4'b0100;
	input            w;
	input      [3:0] currstate, count, n;
	output reg [3:0] nextstate;
	output reg       counter_resetnot_sync, counter_enable;

	always @(currstate, w, n, count) begin
		case (currstate)
			A: nextstate <= (w == 1'b0) ? B : C; 
			B: nextstate <= (w == 1'b0) ? ((count < n - 1) ? B : D) : C;
			C: nextstate <= (w == 1'b0) ? B : ((count < n - 1) ? C : E);
			D: nextstate <= (w == 1'b0) ? ((count < n - 1) ? B : D) : C; 
			E: nextstate <= (w == 1'b0) ? B : ((count < n - 1) ? C : E); 
			default: nextstate <= A;
		endcase
	end

	always @(currstate, w, n, count) begin
		case (currstate)
			A: begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b1; end
			B:
			// Enable counter for next posedge.
			if (w == 1'b0 && count < n - 1) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b1; end
			// Disable counter for next posedge.
			else if (w == 1'b0) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b0; end
			// Reset counter on next posedge, but make sure it still increments by one.
			else begin counter_resetnot_sync <= 1'b0; counter_enable <= 1'b1; end
			C: 
			// Enable counter for next posedge.
			if (w == 1'b1 && count < n - 1) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b1; end
			// Disable counter for next posedge.
			else if (w == 1'b1) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b0; end
			// Reset counter on next posedge, but make sure it still increments by one.
			else begin counter_resetnot_sync <= 1'b0; counter_enable <= 1'b1; end
			D:
			if (w == 1'b0) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b0; end
			else begin counter_resetnot_sync <= 1'b0; counter_enable <= 1'b1; end
			E:
			if (w == 1'b1) begin counter_resetnot_sync <= 1'b1; counter_enable <= 1'b0; end
			else begin counter_resetnot_sync <= 1'b0; counter_enable <= 1'b1; end
			default: begin counter_resetnot_sync <= 1'b0; counter_enable <= 1'b0; end
		endcase
	end
endmodule