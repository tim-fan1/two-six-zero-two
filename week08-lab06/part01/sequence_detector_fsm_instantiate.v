module sequence_detector_fsm_instantiate(SW, KEY, HEX0, LEDR);
	input  [1:0] SW;
	input  [0:0] KEY;
	output [6:0] HEX0;
	output [9:0] LEDR;

	sequence_detector_fsm sequence_detector(.w(SW[1]),
	                                        .resetnot(SW[0]),
	                                        .clock(KEY[0]),
	                                        .HEX0(HEX0),
	                                        .LEDR(LEDR));
endmodule