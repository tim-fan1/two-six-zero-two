module programmable_sequence_detector_fsm_reg_n(save, d, q);
	input            save;
	input      [3:0] d;
	output reg [3:0] q;
	always @(posedge save) begin
		if (d == 4'b0000) q <= 4'b0001; // Prevent zero from loaded as n.
		else q <= d;
	end
endmodule