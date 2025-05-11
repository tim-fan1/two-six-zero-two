`timescale 1ns / 1ps
module programmable_sequence_detector_fsm_testbench();
	reg w, clock, resetnot, save;
	reg [3:0] n_in;
	wire z;
	wire [3:0] currstate, nextstate, count, n_out;
	wire counter_enable, counter_resetnot_sync;

	initial begin
		w <= 1'b0;
		clock <= 1'b0;
		resetnot <= 1'b1;
		save <= 1'b0;
		n_in <= 4'b1110;
	end

	initial begin 
		// Clear flipflops before first 
		// posedge of clock.
		#5 resetnot <= 1'b0;
		#5 resetnot <= 1'b1;
		#5 save <= 1'b1;
		#5 save <= 1'b0;
		#160 n_in <= 4'b0110;
		#300 save <= 1'b1;
		#5 save <= 1'b0;
	end

	always begin 
		#25 clock = ~clock;
	end

	initial begin
		#1250 w <= 1'b1;
		#1250 w <= 1'b0;
	end

	initial begin
		#1350 n_in <= 4'b1111;
		#5 save <= 1'b1; 
		#5 save <= 1'b0;
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
		.w(w), .save(save), .n_in(n_in), .n_out(n_out), .z(z), .clock(clock), .resetnot(resetnot), 
		.currstate(currstate), .nextstate(nextstate), .count(count),
		.counter_enable(counter_enable), .counter_resetnot_sync(counter_resetnot_sync)
	);

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, programmable_sequence_detector_fsm_testbench);
		#100000
		$finish;
	end
endmodule