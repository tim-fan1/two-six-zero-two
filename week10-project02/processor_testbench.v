module processor_testbench();
	reg clock, resetnot;
	wire addxor, increment;
	wire [7:0] instruction;
	wire [15:0] rout, ren;
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
	);
	initial begin
		$dumpfile("processor_testbench.vcd");
		$dumpvars(0, processor_testbench);
		#10000
		$finish;
	end
endmodule