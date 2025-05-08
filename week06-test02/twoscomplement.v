module twoscomplement(x, a, b);
	output signed [1:0] x; // Return a - b, or a + (-b).
	input signed [1:0] a,b; // Where a, b, are signed integers.
	assign x = a - b;
endmodule
