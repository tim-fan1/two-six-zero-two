module datapath_regn(clock, enable, d, q);
	input clock, enable;
	input [15:0] d;
	output reg [15:0] q;
	always @(posedge clock) begin
		if (enable == 1'b1)
			q <= d;
	end
endmodule