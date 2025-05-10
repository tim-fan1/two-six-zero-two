`timescale 1ns / 1ps
module sequence_detector_fsm_testbench();
	reg w, clock, resetnot;
	wire z;
	wire [3:0] currstate, nextstate;

	initial begin
		w <= 1'b0;
		clock <= 1'b0;
		resetnot <= 1'b1;
	end

	initial begin 
		// Clear flipflops before first 
		// posedge of clock.
		#5 resetnot <= 1'b0;
		#5 resetnot <= 1'b1;
	end

	always begin 
		#25 clock = ~clock;
	end

	initial begin
		// w <= 1'b0;
		#130 w <= 1'b1;
		#50 w <= 1'b0;
		#200 w <= 1'b1;
		#250 w <= 1'b0;
	end

	// wire [1:0] SW;
	// wire [0:0] KEY;
	// wire [6:0] HEX0;
	// wire [9:0] LEDR;

	// assign SW[1] = w;
	// assign SW[0] = resetnot;
	// assign KEY[0] = clock;

	// sequence_detector_fsm_instantiate sequence_detector_instantiate(.SW(SW), .KEY(KEY), .HEX0(HEX0), .LEDR(LEDR));

	sequence_detector_fsm sequence_detector(.w(w), .z(z), .clock(clock), .resetnot(resetnot), .currstate(currstate), .nextstate(nextstate));

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, sequence_detector_fsm_testbench);
		#100000
		$finish;
	end
endmodule