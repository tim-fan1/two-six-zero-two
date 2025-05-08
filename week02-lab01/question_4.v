module question_4 (out, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15);
	input in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15; // 15 1-bit outputs.
	output reg [3:0] out; // 1 4-bit output, enough to fit max value.

	wire [3:0] temp;

	// Get sum of digits.
	question_3 q3(.out(temp),
		.in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), 
		.in6(in6), .in7(in7), .in8(in8), .in9(in9), .in10(in10), 
		.in11(in11), .in12(in12), .in13(in13), .in14(in14), .in15(in15));

	// TODO: What's going on here with the always? 
	// What's the thing with assign and always, and reg and wire.
	always @(temp, out) begin
		// Return sum of digits if is 6 or less; Otherwise return 3'b111.
		if (temp <= 4'b0110) 
			assign out = temp;
		else 
			assign out = 4'b0111;
	end
endmodule
