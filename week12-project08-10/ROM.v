// TODO: figure out how to make ROM a synchronous circuit on posedge clock?
module ROM(d, q);
	input [7:0] d;   // To index through each of the 2^8 words,
	output reg [15:0] q; // Where each word is 16 bits.
	always @(d) begin
		if (d == 4'b0000) q <= 8'b01000001; // load $0 1
		else if (d == 4'b0001) q <= 8'b01001011; // load $1 3
		else if (d == 4'b0010) q <= 8'b01010101; // load $2 5
		else if (d == 4'b0011) q <= 8'b10000001; // add $0 $1
		else if (d == 4'b0100) q <= 8'b10000001; // add $0 $1
		else if (d == 4'b0101) q <= 8'b10000010; // add $0 $2
		else q <= 8'b00000000; // nop
	end
endmodule