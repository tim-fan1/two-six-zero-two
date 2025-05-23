module ROM(clock, enable, d, q);
	input clock, enable;
	input [7:0] d;   // To index through each of the 2^8 words,
	output reg [15:0] q; // Where each word is 16 bits.

	always @(posedge clock) begin
		if (enable == 1'b1) begin
			case (d)
			4'b0000: q <= 8'b01000001; // load $0 1
			4'b0001: q <= 8'b01001011; // load $1 3
			4'b0010: q <= 8'b01010101; // load $2 5
			4'b0011: q <= 8'b10000001; // add $0 $1
			4'b0100: q <= 8'b10000001; // add $0 $1
			4'b0101: q <= 8'b10000010; // add $0 $2
			default: q <= 8'b00000000; // nop
			endcase
		end
	end
endmodule