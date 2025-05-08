module fourBit_FA(a,b,cin,cout,s);
	//some inputs and outputs are 1-bit, some are 4-bit
	input [3:0] a, b;
	input cin;
	output [3:0] s;
	output cout;

	wire [3:0] c;

	FA fa0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c[1]));
	FA fa1(.a(a[1]), .b(b[1]), .cin(c[1]), .s(s[1]), .cout(c[2]));
	FA fa2(.a(a[2]), .b(b[2]), .cin(c[2]), .s(s[2]), .cout(c[3]));
	FA fa3(.a(a[3]), .b(b[3]), .cin(c[3]), .s(s[3]), .cout(cout));

endmodule