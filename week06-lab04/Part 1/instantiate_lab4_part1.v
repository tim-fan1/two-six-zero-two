module instantiate_lab4_part1(SW,LEDR);

	input[9:0] SW ;
	output [9:0] LEDR;

	gated_RS instantiate_gated_RS (
		.clk(SW[0]), // We manually set the clock by literal hand, at whatever 
	                // clock rate our fingers flick the switch at.
		.R(SW[9]), 
		.S(SW[8]), 
		.Q(LEDR[9]), 
		.Qnot(LEDR[8])
	);

endmodule