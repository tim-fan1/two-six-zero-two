module BCD_adder(a, b, cin, d1, d0, s1, s0, error, cout);

	input [3:0] a, b;
	input cin;
	output [6:0] d1, d0; // d1 is the ten's digit, d0 is the one's digit.
	output [3:0] s1, s0; // d1 is the ten's digit, d0 is the one's digit.
	output error; // 1 indicates error (for this lab, where A or B are greater than 7).
	output cout; // overflow

	wire [3:0] t1;

	assign error = (a > 4'b0111 || b > 4'b0111) ? 1'b1 : 1'b0;

	fourBit_FA sum(.a(a), .b(b), .cin(cin), .cout(cout), .s(t1)); // The sum ranges [0 to 15].
	lab3_p2_v1 part2(.v(t1), .d1(d1), .d2(d0), .s1(s1), .s0(s0)); // Wow isn't that confusing. TODO: change .d2() to .d0().
endmodule