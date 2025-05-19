`timescale 1ns / 1ps
module processor_testbench();
	reg clock, resetnot;
	wire addxor, increment;
	wire [7:0] instruction;
	wire [15:0] rout, ren;
	wire [15:0]
		bus,
		R0,
		R1,
		R2,
		R3,
		R4,
		R5,
		R6,
		R7,
		G,
		A,
		EXTERN;
	initial clock = 1'b0;
	always begin #50 clock = ~clock; end
	initial begin
		resetnot = 1'b1;
		#5 resetnot = 1'b0;
		#5 resetnot = 1'b1;
	end

	processor _processor(.clock(clock), .resetnot(resetnot)
		, .addxor(addxor), .increment(increment),
		.instruction(instruction), .rout(rout), .ren(ren)
		,
		.bus(bus),
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
	initial begin
		$dumpfile("processor_testbench.vcd");
		$dumpvars(0, processor_testbench);
		#10000
		$finish;
	end
endmodule