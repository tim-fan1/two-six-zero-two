`timescale 1ns / 1ps
module processor_testbench();
	reg clock, resetnot;

	// To view internal wires of processor.
	wire addxor, increment;
	wire [15:0] rout, ren;
	wire [15:0]
		bus, R0, R1, R2, R3, R4,
		R5, R6, R7, G, A, EXTERN, ISR, PCR, q_rom;
	wire [3:0] currstate, nextstate;
	wire [1:0] opcode;
	initial clock = 1'b0;
	always begin #50 clock = ~clock; end
	initial begin
		resetnot = 1'b1;
		#5 resetnot = 1'b0;
		#5 resetnot = 1'b1;
	end

	processor _processor(.clock(clock), .resetnot(resetnot)
		, .addxor(addxor), .rout(rout), .ren(ren)
		, .bus(bus), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4)
		, .R5(R5), .R6(R6), .R7(R7), .G(G), .A(A), .EXTERN(EXTERN), .ISR(ISR)
		, .PCR(PCR), .q_rom(q_rom), .currstate(currstate), .nextstate(nextstate), .opcode(opcode)
	);
	initial begin
		$dumpfile("processor_testbench.vcd");
		$dumpvars(0, processor_testbench);
		#100000
		$finish;
	end
endmodule