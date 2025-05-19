module processor_hardware(SW, KEY, HEX0, HEX1, HEX2, HEX3, LEDR);
	input [9:0] SW;
	input [3:0] KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3;
	output [9:0] LEDR;

	reg [15:0] currvalue;
	wire [15:0]
		R0, // 0
		R1,
		R2,
		R3,
		R4,
		R5,
		R6,
		R7,
		G, // 8
		A, // 9
		EXTERN, // 10
		rout, // 11
		ren, // 12
		bus; // 13
	processor _processor(
		.clock(KEY[0]), 
		.resetnot(KEY[1]), 
		.addxor(LEDR[0]), 
		.increment(LEDR[1]), 
		.instruction(LEDR[9:2]),
		.rout(rout),
		.ren(ren),
		.R0(R0),
		.R1(R1),
		.R2(R2),
		.R3(R3),
		.R4(R4),
		.R5(R5),
		.R6(R6),
		.R7(R7),
		.G(G),
		.A(A),
		.EXTERN(EXTERN)
	);

	hex_to_sevenseg_decoder _HEX0(.D(currvalue[3:0]), .Q(HEX0));
	hex_to_sevenseg_decoder _HEX1(.D(currvalue[7:4]), .Q(HEX1));
	hex_to_sevenseg_decoder _HEX2(.D(currvalue[11:8]), .Q(HEX2));
	hex_to_sevenseg_decoder _HEX3(.D(currvalue[15:12]), .Q(HEX3));

	wire [3:0] currreg;
	assign currreg = SW[9:6];
	always @(currreg) begin
		case (currreg)
		4'b0000: currvalue <= R0; // 0
		4'b0001: currvalue <= R1;
		4'b0010: currvalue <= R2;
		4'b0011: currvalue <= R3;
		4'b0100: currvalue <= R4;
		4'b0101: currvalue <= R5;
		4'b0110: currvalue <= R6;
		4'b0111: currvalue <= R7;
		4'b1000: currvalue <= G; // 8
		4'b1001: currvalue <= A; // 9
		4'b1010: currvalue <= EXTERN; // 10
		4'b1011: currvalue <= rout; // 11
		4'b1100: currvalue <= ren; // 12
		4'b1101: currvalue <= bus; // 13
		endcase
	end
endmodule