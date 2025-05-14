`timescale 1ns / 1ps
module controller_testbench();
	reg clock, resetnot, start;
	reg [7:0] instruction;

	wire [3:0] currstate; 
	wire [3:0] nextstate;

	initial begin
		clock <= 1'b0;
		resetnot <= 1'b1;
		start <= 1'b0;
		instruction <= 0;
	end

	always begin 
		#100 clock <= ~clock;
	end

	initial begin
		// Reset registers.
		#5 resetnot = 1'b0;
		#5 resetnot = 1'b1;

		// Load instruction with ADD instruction.
		#5 instruction <= 8'b10111111; // Only care about opcode for now.
		#5 start <= 1'b1; // And send signal that instruction is ready!

		// Now watch the magic happen in currstate wires?
	end

	controller controller(.start(start), 
		                    .clock(clock), 
		                    .resetnot(resetnot), 
		                    .instruction(instruction), 
		                    .currstate(currstate), 
		                    .nextstate(nextstate));

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, controller_testbench);
		#10000
		$finish;
	end
endmodule