`timescale 1ns / 1ps
module programmable_sequence_detector_fsm_testbench();
	reg w, clock, resetnot;
	reg [3:0] n;
	wire z;
	wire [3:0] currstate, nextstate, count;
	wire counter_enable, counter_resetnot;

	initial begin
		w <= 1'b0;
		clock <= 1'b0;
		resetnot <= 1'b1;
		n <= 4'b0110;
	end

	initial begin 
		// Clear flipflops before first 
		// posedge of clock.
		#5 resetnot <= 1'b0;
		#5 resetnot <= 1'b1;
		#160 n <= 4'b1110;
	end

	always begin 
		#25 clock = ~clock;
	end

	initial begin
		// w <= 1'b0;
		#1250 w <= 1'b1;
		#1250 w <= 1'b0;
		// #50 w <= 1'b0;
		// #200 w <= 1'b1;
		// #250 w <= 1'b0;
	end

	// wire [1:0] SW;
	// wire [0:0] KEY;
	// wire [6:0] HEX0;
	// wire [9:0] LEDR;

	// assign SW[1] = w;
	// assign SW[0] = resetnot;
	// assign KEY[0] = clock;

	// sequence_detector_fsm_instantiate sequence_detector_instantiate(.SW(SW), .KEY(KEY), .HEX0(HEX0), .LEDR(LEDR));

	programmable_sequence_detector_fsm programmable_sequence_detector(
		.w(w), .n(n), .z(z), .clock(clock), .resetnot(resetnot), 
		.currstate(currstate), .nextstate(nextstate), .count(count),
		.counter_enable(counter_enable), .counter_resetnot(counter_resetnot)
	);

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, programmable_sequence_detector_fsm_testbench);
		#100000
		$finish;
	end
endmodule