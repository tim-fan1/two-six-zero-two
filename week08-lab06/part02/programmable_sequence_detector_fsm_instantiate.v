module programmable_sequence_detector_fsm_instantiate(SW, KEY, HEX0, HEX2, HEX4, LEDR);
	input  [9:0] SW; // w.
	input  [2:0] KEY; // clock and save and resetnot.
	output [6:0] HEX0; // state.
	output [6:0] HEX2; // count.
	output [6:0] HEX4; // n_out.
	output [9:0] LEDR; // output.

	programmable_sequence_detector_fsm programmable_sequence_detector(.w(SW[0]),
	                                                                  .n_in(SW[9:6]),
	                                                                  .clock(KEY[0]),
	                                                                  .save(KEY[1]),
	                                                                  .resetnot(KEY[2]),
	                                                                  .HEX0(HEX0), // state
	                                                                  .HEX2(HEX2), // count
																							.HEX4(HEX4), // n_out
	                                                                  .LEDR(LEDR));
endmodule