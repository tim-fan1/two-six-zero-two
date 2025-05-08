module decoder_7seg(code, decoded_output);

	input[1:0] code;

	output reg[6:0]  decoded_output;
	always @(code) begin
		case (code)
		2'b00 : begin decoded_output = 7'b0000111; end
		2'b01 : begin decoded_output = 7'b1110000; end
		2'b10 : begin decoded_output = 7'b0011100; end
		2'b11 : begin decoded_output = 7'b1100011; end
	endcase
	end

endmodule
