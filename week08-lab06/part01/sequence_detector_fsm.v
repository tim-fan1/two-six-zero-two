module sequence_detector_fsm(w, z, clock, resetnot, currstate, nextstate, HEX0, LEDR);
	input w, clock, resetnot;
	output z;

	output [6:0] HEX0;
	output [9:0] LEDR;

	output [3:0] currstate, nextstate;

	// This combinational circuit module is UNCLOCKED.
	// It continuously calculates what nextstate should 
	// be given the current value of currstate, and the 
	// current value of w --- without caring for clock!
	sequence_detector_fsm_combinational_circuit sequence_detector_comb(
		.w(w), .currstate(currstate), .nextstate(nextstate)
	);

	// But currstate is updated only on posedge clock.
	sequence_detector_fsm_flipflops sequence_detector_flipflops(
		.d(nextstate), .q(currstate), .clock(clock), .resetnot(resetnot)
	);

	// Seperate out the computation of what z should be on posedge clock.
	sequence_detector_fsm_output sequence_detector_output(
		.currstate(currstate), .w(w), .clock(clock), .resetnot(resetnot), .z(z)
	);

	assign LEDR = (z == 1'b0) ? 0 : ~0; // Turn on all LEDS on z = 1.
	hex_to_sevenseg_decoder hex(.D(currstate), .Q(HEX0));
endmodule