module ROM(clock, d, q);
	input clock;
	input [7:0] d;   // To index through each of the 2^8 words,
	output [15:0] q; // Where each word is 16 bits.
	assign q = 0;
endmodule