module eightbit_register_async_reset_v2(clk, resetnot, D, Q);
	input        clk, resetnot;
	input  [7:0] D;
	output [7:0] Q;

	dff_pos_async_reset D0(.clk(clk), .D(D[0]), .Q(Q[0]), .resetnot(resetnot));
	dff_pos_async_reset D1(.clk(clk), .D(D[1]), .Q(Q[1]), .resetnot(resetnot));
	dff_pos_async_reset D2(.clk(clk), .D(D[2]), .Q(Q[2]), .resetnot(resetnot));
	dff_pos_async_reset D3(.clk(clk), .D(D[3]), .Q(Q[3]), .resetnot(resetnot));
	dff_pos_async_reset D4(.clk(clk), .D(D[4]), .Q(Q[4]), .resetnot(resetnot));
	dff_pos_async_reset D5(.clk(clk), .D(D[5]), .Q(Q[5]), .resetnot(resetnot));
	dff_pos_async_reset D6(.clk(clk), .D(D[6]), .Q(Q[6]), .resetnot(resetnot));
	dff_pos_async_reset D7(.clk(clk), .D(D[7]), .Q(Q[7]), .resetnot(resetnot));
endmodule