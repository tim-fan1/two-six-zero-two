`timescale 1ns / 1ps
module processor_testbench();
	reg clock, resetnot;
	reg [7:0] instruction;

	// To view internal wires of processor.
	wire addxor, increment;
	wire [15:0] rout, ren;
	wire [15:0]
		bus, R0, R1, R2, R3, R4,
		R5, R6, R7, G, A, EXTERN, ISR;
	wire [3:0] currstate, nextstate;
	wire [1:0] opcode;
	initial clock = 1'b0;
	always begin #50 clock = ~clock; end
	initial begin
		instruction = 8'b00000000;
		resetnot = 1'b1;
		#5 resetnot = 1'b0;
		#5 resetnot = 1'b1;
		#1500 instruction = 8'b01000001; // ldi $0 1
		#1010 instruction = 8'b01001010; // ldi $1 2
		#1010 instruction = 8'b01000011; // ldi $0 3
		#1010 instruction = 8'b10000001; // add $0 $1
		#1010 instruction = 8'b10000001; // ...
		#1010 instruction = 8'b10000001;
		#1010 instruction = 8'b01001100;
		#1010 instruction = 8'b01010101; // ...
		#1010 instruction = 8'b11000001; // xor $0 $1
		#1010 instruction = 8'b10010000; // add $2 $0
		#1010 instruction = 8'b10010000; // add $2 $0
		#1010 instruction = 8'b00011000; // mov $3 $0 // swap($0,$1)
		#1010 instruction = 8'b00000001; // mov $0 $1 // ...
		#1010 instruction = 8'b00001011; // mov $1 $3 // ...
	end

	processor _processor(.clock(clock), .resetnot(resetnot), .instruction(instruction)
		, .addxor(addxor), .rout(rout), .ren(ren)
		, .bus(bus), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4)
		, .R5(R5), .R6(R6), .R7(R7), .G(G), .A(A), .EXTERN(EXTERN), .ISR(ISR)
		, .currstate(currstate), .nextstate(nextstate), .opcode(opcode)
	);
	/*
	reg [9:2] SW;
	reg [1:0] KEY;
	wire [15:0]
		R0, R1, R2, R3, R4,
		R5, R6, R7, ISR;

	wire [3:0] currstate;

	always begin
		#50 KEY[0] = ~KEY[0];
	end
	initial begin
		KEY[0] <= 1'b0;
		KEY[1] <= 1'b1;
		SW[9:2] <= 8'b00000000;
		#5 KEY[1] <= 1'b0;
		#5 KEY[1] <= 1'b1;
		#1500 SW[9:2] <= 8'b01000001;
		#1010 SW[9:2] <= 8'b01001010;
		#1010 SW[9:2] <= 8'b01000011;
		#1010 SW[9:2] <= 8'b10000001;
		#1010 SW[9:2] <= 8'b10000001;
		#1010 SW[9:2] <= 8'b10000001;
		#1010 SW[9:2] <= 8'b01001100;
		#1010 SW[9:2] <= 8'b01010101;
		#1010 SW[9:2] <= 8'b10000001;
		#1010 SW[9:2] <= 8'b10010000;
		#1010 SW[9:2] <= 8'b10010000;
	end
	processor_hardware _processor_hardware(
		.SW(SW), .KEY(KEY),
		.R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4),
		.R5(R5), .R6(R6), .R7(R7), .ISR(ISR), .currstate(currstate)
	);
	*/
	initial begin
		$dumpfile("processor_testbench.vcd");
		$dumpvars(0, processor_testbench);
		#100000
		$finish;
	end
endmodule