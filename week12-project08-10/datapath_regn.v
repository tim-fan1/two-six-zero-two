module datapath_regn(clock, resetnot, enable, d, q);
	input clock, resetnot, enable;
	input [15:0] d;
	output reg [15:0] q;
	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0) 
			q <= 0;
		else if (enable == 1'b1)
			q <= d;
	end
endmodule