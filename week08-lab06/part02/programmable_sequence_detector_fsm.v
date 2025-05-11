module programmable_sequence_detector_fsm(n, w, z, clock, resetnot, HEX0, LEDR
	, counter_resetnot, counter_enable, currstate, nextstate, count
	);
	input  [3:0] n; // User-programmable number of consecutive 1's or 0's.
	input        w, clock, resetnot;
	output       z;

	output [6:0] HEX0;
	output [9:0] LEDR;

	// Internal wires. Make these visible (output wires) for debugging.
	output [3:0] currstate, nextstate, count;
	output       counter_enable, counter_resetnot;

	// Unclocked combinational modules.
	programmable_sequence_detector_fsm_comb_next comb_next(
		.w(w), .count(count), .n(n), .currstate(currstate), .nextstate(nextstate),
		.counter_resetnot(counter_resetnot), .counter_enable(counter_enable)
	);
	programmable_sequence_detector_fsm_comb_output comb_output(
		.currstate(currstate), .z(z)
	);

	// Clocked flipflops.
	programmable_sequence_detector_fsm_reg_state reg_state(
		.clock(clock), .d(nextstate), .q(currstate), .resetnot(resetnot)
	);
	programmable_sequence_detector_fsm_reg_counter reg_counter(
		.clock(clock), .counter_enable(counter_enable), .q(count), 
		.resetnot(resetnot), .counter_resetnot_sync(counter_resetnot)
	);

	assign LEDR = (z == 1'b0) ? 0 : ~0; // Turn on all LEDS on z = 1.
	hex_to_sevenseg_decoder hex(.D(currstate), .Q(HEX0));
endmodule