// Count how many of inx are 1's.
module question_1 (out, in1, in2, in3, in4, in5);
	input in1, in2, in3, in4, in5; // 5 1-bit inputs.
	output [2:0] out; // 1 3-bit output, enough to fit max value.

	assign out = in1 + in2 + in3 + in4 + in5;
endmodule
