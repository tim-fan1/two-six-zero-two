module gated_RS (clk, R, S, Q, Qnot);
	input  R, S, clk;
	output Q, Qnot;
	
	wire   R_g, S_g, Qa, Qb /* synthesis keep */;

	assign R_g = !(R & clk); // R NAND clk.
	assign S_g = !(S & clk); // S NAND clk.
	assign Qa = !(S_g & Qb); // S_g NAND Qb.
	assign Qb = !(R_g & Qa); // R_g NAND Qa.

	assign Q = Qa;
	assign Qnot = Qb;
	
endmodule