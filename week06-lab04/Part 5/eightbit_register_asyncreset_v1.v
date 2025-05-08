module eightbit_register_async_reset_v1(clk, resetnot, D, Q);
	input        clk, resetnot;
	input  [7:0] D;
	output [7:0] Q;

	// FIXME: timing issues?
	fourbit_register_async_reset H(.clk(clk), .resetnot(resetnot), .D(D[7:4]), .Q(Q[7:4]));
	fourbit_register_async_reset L(.clk(clk), .resetnot(resetnot), .D(D[3:0]), .Q(Q[3:0]));
endmodule