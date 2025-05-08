module question_1 (out1, out2, out3, in1, in2);
	input in1, in2; // 2 1-bit inputs.
	output reg out1, out2, out3; // 3 3-bit output.

	wire [1:0] temp;

	assign temp = { in1, in2 };

	always @(temp) begin
		case (temp)
			2'b00 : begin out1 = 1'b1; out2 = 1'b0; out3 = 1'b0; end
			2'b01 : begin out1 = 1'b0; out2 = 1'b0; out3 = 1'b0; end
			2'b10 : begin out1 = 1'b0; out2 = 1'b1; out3 = 1'b1; end
			default : begin out1 = 1'b1; out2 = 1'b0; out3 = 1'b0; end
		endcase
	end

endmodule
