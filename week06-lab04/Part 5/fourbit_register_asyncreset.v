module fourbit_register_async_reset(clk, resetnot, D, Q);
	input        clk, resetnot;
	input  [3:0] D;
	output [3:0] Q;

	dff_pos_async_reset D0(.clk(clk), .D(D[0]), .Q(Q[0]), .resetnot(resetnot));
	dff_pos_async_reset D1(.clk(clk), .D(D[1]), .Q(Q[1]), .resetnot(resetnot));
	dff_pos_async_reset D2(.clk(clk), .D(D[2]), .Q(Q[2]), .resetnot(resetnot));
	dff_pos_async_reset D3(.clk(clk), .D(D[3]), .Q(Q[3]), .resetnot(resetnot));
endmodule