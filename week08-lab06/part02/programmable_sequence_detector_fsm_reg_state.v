module programmable_sequence_detector_fsm_reg_state(d, q, clock, resetnot);
	input            clock, resetnot;
	input      [3:0] d;
	output reg [3:0] q;

	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0)
			q <= 4'b0000; // Asynchronously reset state.
		else
			q <= d; // Set output to state at posedge clock.
	end
endmodule