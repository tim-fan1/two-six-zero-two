module circuitA (v, A);
	input [3:0] v;
	output reg [3:0] A;
  
	always @(v) begin
		case (v)
		4'b0000 : begin A = 4'b0000; end
		4'b0001 : begin A = 4'b0001; end
		4'b0010 : begin A = 4'b0010; end
		4'b0011 : begin A = 4'b0011; end
		4'b0100 : begin A = 4'b0100; end
		4'b0101 : begin A = 4'b0101; end
		4'b0110 : begin A = 4'b0110; end
		4'b0111 : begin A = 4'b0111; end
		4'b1000 : begin A = 4'b1000; end
		4'b1001 : begin A = 4'b1001; end
		// is two-digits onward from here...
		4'b1010 : begin A = 4'b0000; end
		4'b1011 : begin A = 4'b0001; end
		4'b1100 : begin A = 4'b0010; end
		4'b1101 : begin A = 4'b0011; end
		4'b1110 : begin A = 4'b0100; end
		4'b1111 : begin A = 4'b0101; end
	endcase
	end
endmodule