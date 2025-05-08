module lab3_p4_instantiate(SW, HEX0, HEX1, LEDR);
	input [9:0] SW;
	output [6:0] HEX0, HEX1; // 7seg requires 7 bits, HEX0 requires 7 bits, HEX1 requires 7 bits.
	output [9:0] LEDR;

	// d1 is the ten's digit, d0 is the one's digit.
	// HEX1 is the ten's digit, HEX0 is the one's digit.
	BCD_adder bcd_adder(.a(SW[9:6]), .b(SW[5:2]), .cin(SW[1]), .d1(HEX1), .d0(HEX0), .cout(LEDR[9]), .error(LEDR[8]), .s1(LEDR[7:4]), .s0(LEDR[3:0]));
endmodule