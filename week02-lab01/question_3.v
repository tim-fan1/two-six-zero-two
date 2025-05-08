// Count number of 1's in inputs.
module question_3 (out, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15);
	input in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15; // 15 1-bit outputs.
	output [3:0] out; // 1 4-bit output, enough to fit max value.

	wire [2:0] temp1, temp2, temp3;

	question_1 q1_1(.out(temp1), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5));
	question_1 q1_2(.out(temp2), .in1(in6), .in2(in7), .in3(in8), .in4(in9), .in5(in10));
	question_1 q1_3(.out(temp3), .in1(in11), .in2(in12), .in3(in13), .in4(in14), .in5(in15));

	question_2 q2_1(.out(out), .in1(temp1), .in2(temp2), .in3(temp3));
endmodule
