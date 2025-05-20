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
		#1500 instruction = 8'b01000001;
		#1010 instruction = 8'b01001010;
		#1010 instruction = 8'b01000011;
		#1010 instruction = 8'b10000001;
		#1010 instruction = 8'b10000001;
		#1010 instruction = 8'b10000001;
		#1010 instruction = 8'b01001100;
		#1010 instruction = 8'b01010101;
		#1010 instruction = 8'b10000001;
		#1010 instruction = 8'b10010000;
		#1010 instruction = 8'b10010000;
	end

	processor _processor(.clock(clock), .resetnot(resetnot), .instruction(instruction)
		, .addxor(addxor), .rout(rout), .ren(ren)
		, .bus(bus), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4)
		, .R5(R5), .R6(R6), .R7(R7), .G(G), .A(A), .EXTERN(EXTERN), .ISR(ISR)
		, .currstate(currstate), .nextstate(nextstate), .opcode(opcode)
	);
	initial begin
		$dumpfile("processor_testbench.vcd");
		$dumpvars(0, processor_testbench);
		#100000
		$finish;
	end
endmodule