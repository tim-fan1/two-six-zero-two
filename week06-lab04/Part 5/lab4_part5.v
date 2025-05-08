module lab4_part5(D, clk, resetnot, A, B, HEXA1, HEXA0, HEXB1, HEXB0);
	input        clk, resetnot;
	input  [7:0] D; // SW[7:0]
	output [7:0] A; // HEXA
	output [7:0] B; // HEXB

	output [6:0] HEXA1;
	output [6:0] HEXA0;
	output [6:0] HEXB1;
	output [6:0] HEXB0;

	wire   [7:0] Q; // Register.

	// Register is updated to match SW[7:0] on posedge clk, always.
	eightbit_register_async_reset_v2 register(.clk(clk), 
	                                          .resetnot(resetnot), 
	                                          .D(D), 
	                                          .Q(Q));

	// HEXA reads from Register, HEXB reads from SW[7:0].
	// On posedge clk, HEXA will be updated to most recent SW[7:0], most recent HEXB. 
	// HEXB will continue to show SW[7:0].
	assign A = Q;
	assign B = D;

	hex_to_sevenseg_decoder hexa1(.D(A[7:4]), .Q(HEXA1));
	hex_to_sevenseg_decoder hexa0(.D(A[3:0]), .Q(HEXA0));

	hex_to_sevenseg_decoder hexb1(.D(B[7:4]), .Q(HEXB1));
	hex_to_sevenseg_decoder hexb0(.D(B[3:0]), .Q(HEXB0));
endmodule