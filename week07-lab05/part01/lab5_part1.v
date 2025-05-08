module lab5_part1(toggle, clock, resetnot, Q, HEX0, HEX1, HEX2, HEX3);
	// A sixteenbit counter. Toggle logic 1 on 
	// posedge clock will increment counter.
	input         toggle, clock, resetnot;
	output [15:0] Q;
	output  [6:0] HEX0, HEX1, HEX2, HEX3;
	wire   [15:0] t;
	assign Q = t;

	wire   [2:0] c;

	fourbit_counter Q0(.toggle(toggle), .clock(clock), .resetnot(resetnot), .Q(t[3:0]), .carryout(c[0]));
	fourbit_counter Q1(.toggle(c[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[7:4]), .carryout(c[1]));
	fourbit_counter Q2(.toggle(c[1] & c[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[11:8]), .carryout(c[2]));
	fourbit_counter Q3(.toggle(c[2] & c[1] & c[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[15:12]));

	hex_to_sevenseg_decoder hex0(.D(t[3:0]), .Q(HEX0));
	hex_to_sevenseg_decoder hex1(.D(t[7:4]), .Q(HEX1));
	hex_to_sevenseg_decoder hex2(.D(t[11:8]), .Q(HEX2));
	hex_to_sevenseg_decoder hex3(.D(t[15:12]), .Q(HEX3));
endmodule