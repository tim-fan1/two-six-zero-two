module programmable_sequence_detector_fsm_reg_n(save, resetnot, d, q);
	input            save, resetnot;
	input      [3:0] d;
	output reg [3:0] q;
	always @(posedge save, negedge resetnot) begin
		if (resetnot == 1'b0) q <= 4'b0001;
		else if (d == 4'b0000) q <= 4'b0001; // Prevent zero from loaded as n.
		else q <= d;
	end
endmodule