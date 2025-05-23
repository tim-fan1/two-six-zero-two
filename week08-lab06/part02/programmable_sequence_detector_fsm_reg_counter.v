module programmable_sequence_detector_fsm_reg_counter(counter_enable, q, clock, resetnot, counter_resetnot_sync);
	input            counter_enable, clock, counter_resetnot_sync, resetnot;
	output reg [3:0] q;

	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0) 
		begin
			q <= 4'b0000;
		end 
		else 
		begin
			// Only apply reset on same posedge clock.
			// In other words, synchronously reset.
			if (counter_resetnot_sync == 1'b0) begin
				// Reset counter and increment on same posedge.
				if (counter_enable == 1'b1) q <= 4'b0001;
				// Just reset counter.
				else q <= 4'b0000;
			end
			else if (counter_enable == 1'b1) begin
				q <= q + 4'b0001;
			end
			else begin 
				q <= q;
			end
		end
	end
endmodule