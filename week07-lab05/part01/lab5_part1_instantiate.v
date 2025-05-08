module lab5_part1_instantiate(KEY, SW, HEX0, HEX1, HEX2, HEX3, CLOCK_50);
	input  [1:0] KEY;                    // clock and resetnot.
	input  [0:0] SW;                     // enable.
	input        CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3; // counter.
	/*
	lab5_part1 sixteenbitcounter(.toggle(SW[0]), 
	                             .clock(KEY[0]), 
	                             .resetnot(KEY[1]), 
	                             .HEX0(HEX0),
	                             .HEX1(HEX1),
	                             .HEX2(HEX2),
	                             .HEX3(HEX3));*/
										  
	/*									  
	lab5_part2 sixteenbitcounter_fpga_reg(.clock(KEY[0]), 
														.resetnot(KEY[1]), 
														.HEX0(HEX0),
														.HEX1(HEX1),
														.HEX2(HEX2),
														.HEX3(HEX3));*/
														
	lab5_part3 onesecondcounter_with7seg(.clock(CLOCK_50), .resetnot(KEY[1]), .HEX0(HEX0),
																									  .HEX1(HEX1),
																									  .HEX2(HEX2),
																									  .HEX3(HEX3));
endmodule
