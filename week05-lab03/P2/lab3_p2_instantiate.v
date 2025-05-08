module lab3_p2_instantiate(SW,HEX0,HEX1);

	input[9:0] SW;
	output [6:0] HEX0, HEX1;
	// Should it be HEX0, HEX1, or
	//              HEX1, HEX0 ???
	//
	// In my lab3_p2 implementation:
	//   d1 is the ten's digit... and
	//   d2 is the one's digit...
	// 
  // On the FPGA: 
	//   HEX0 is the rightmost 7seg display (so should display the one's unit).
	//   HEX1 is the next one to its left (so should display the ten's unit).
	//
	// It would be a quick change to swap d1 with d2 in the code for lab3_pt2, 
	// so will just do this for now.
	lab3_p2_v1 lab3_pt2(.v(SW[3:0]),.d1(HEX1),.d2(HEX0));
	
endmodule