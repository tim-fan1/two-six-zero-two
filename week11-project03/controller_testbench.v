`timescale 1ns / 1ps
module controller_testbench();
	reg clock, resetnot;
	reg [7:0] instruction;

	wire [3:0] currstate; 
	wire [3:0] nextstate;
	wire [15:0] rout, ren;

	initial begin
		clock <= 1'b0;
		resetnot <= 1'b1;
		instruction <= 0;
	end

	always begin 
		#50 clock <= ~clock;
	end

	initial begin
		// Reset registers.
		#5 resetnot = 1'b0;
		#5 resetnot = 1'b1;

		// Load instruction with ADD instruction.
		#5 instruction <= 8'b10110001;

		#500 instruction <= 8'b11010111;

		// Now watch the magic happen in currstate wires?
	end

	controller controller(.clock(clock), 
		                    .resetnot(resetnot), 
		                    .instruction(instruction), 
		                    // .currstate(currstate), 
		                    // .nextstate(nextstate),
		                    .rout(rout),
		                    .ren(ren));

	// initial begin
	// 	$dumpfile("controller_testbench.vcd");
	// 	$dumpvars(0, controller_testbench);
	// 	#10000
	// 	$finish;
	// end
endmodule