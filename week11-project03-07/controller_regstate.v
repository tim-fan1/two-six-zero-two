module controller_regstate(d, q, clock, resetnot);
	input clock, resetnot;
	input [3:0] d;
	output reg [3:0] q;

	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0)
			q <= 0;
		else 
			q <= d;
	end
endmodule