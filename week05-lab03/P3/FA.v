module FA(a,b,cin,cout,s);
	//all inputs and outputs are 1-bit
	input cin, a, b;
	output cout, s;

	wire t1;

	assign t1 = a ^ b;
	assign s = cin ^ t1;
	assign cout = (t1 == 1'b0) ? b : cin;
endmodule