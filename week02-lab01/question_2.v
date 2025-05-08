// Add together inputs.
module question_2 (out, in1, in2, in3);
	input [2:0] in1, in2, in3; // 3 3-bit inputs.
	output [3:0] out; // 1 4-bit output, enough to fit max value.

	assign out = in1 + in2 + in3;
endmodule
