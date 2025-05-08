module lab5_part2(clock, resetnot, Q, HEX0, HEX1, HEX2, HEX3);
	// A sixteenbit counter. 
	// posedge clock will increment counter.
	input         clock, resetnot;
	output [15:0] Q;
	reg    [15:0] Q;
	output  [6:0] HEX0, HEX1, HEX2, HEX3;

	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0) Q <= 0;
		else if (clock == 1'b1) Q <= Q + 1;
	end
	hex_to_sevenseg_decoder hex0(.D(Q[3:0]), .Q(HEX0));
	hex_to_sevenseg_decoder hex1(.D(Q[7:4]), .Q(HEX1));
	hex_to_sevenseg_decoder hex2(.D(Q[11:8]), .Q(HEX2));
	hex_to_sevenseg_decoder hex3(.D(Q[15:12]), .Q(HEX3));
endmodule