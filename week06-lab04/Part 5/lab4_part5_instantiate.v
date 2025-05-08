module lab4_part5_instantiate(SW, HEX3, HEX2, HEX1, HEX0, KEY);
	input  [7:0] SW;
	input  [1:0] KEY;
	output [6:0] HEX3;
	output [6:0] HEX2;
	output [6:0] HEX1;
	output [6:0] HEX0;

	lab4_part5 lab4_part5(.D(SW), 
	                      .HEXA1(HEX3), 
	                      .HEXA0(HEX2), 
	                      .HEXB1(HEX1), 
	                      .HEXB0(HEX0),
	                      .clk(KEY[1]), // Note that unpressed key writes logic 
	                                    // 1, and pressed key writes logic 0. So, 
	                                    // posedge clk triggers on key up release, 
	                                    // not key down press. 
	                                    // 
	                                    // Replacing with ~KEY[1] should work too.
	                      .resetnot(KEY[0]));
endmodule