module processor_hardware(SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	/* Internal wires made visible for debugging.	
	, R0, R1, R2, R3, R4,
	  R5, R6, R7, ISR, currstate. */
);
	input [9:2] SW;
	input [1:0] KEY;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	/* output */ wire [15:0] 
		R0, R1, R2, R3, R4,
		R5, R6, R7, ISR;

	/* output */ wire [3:0] currstate;

	processor _processor(
		.clock(KEY[0]),
		.resetnot(KEY[1]),
		.R0(R0),
		.R1(R1),
		.R2(R2),
		.R3(R3),
		.R4(R4),
		.R5(R5),
		.R6(R6),
		.R7(R7),
		.ISR(ISR),
		.currstate(currstate));

	wire [3:0] currwire;
	reg [15:0] currvalue;
	assign currwire = SW[9:6];
	always @(currwire) begin
		case (currwire)
		4'b0000: currvalue <= R0;
		4'b0001: currvalue <= R1;
		4'b0010: currvalue <= R2;
		4'b0011: currvalue <= R3;
		4'b0100: currvalue <= R4;
		4'b0101: currvalue <= R5;
		4'b0110: currvalue <= R6;
		4'b0111: currvalue <= R7;
		4'b1000: currvalue <= ISR;
		default: currvalue <= ~0;
		endcase
	end

	currstate_to_sevenseg_decoder_left _HEX5(.d(currstate), .q(HEX5));
	currstate_to_sevenseg_decoder_right _HEX4(.d(currstate), .q(HEX4));
	hex_to_sevenseg_decoder _HEX3(.d(currvalue[15:12]), .q(HEX3));
	hex_to_sevenseg_decoder _HEX2(.d(currvalue[11:8]), .q(HEX2));
	hex_to_sevenseg_decoder _HEX1(.d(currvalue[7:4]), .q(HEX1));
	hex_to_sevenseg_decoder _HEX0(.d(currvalue[3:0]), .q(HEX0));

endmodule