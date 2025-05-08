module instantiate_lab4_part4(SW,LEDR);
 
	input[9:0] SW;
	output [9:0] LEDR;

	// instantiate and connect all 3 flip flops
	// Use same inputs (same switches for D, clk to all instances)
	// Use 3 separate LED outputs
	
	dff_pos instantiate_dff_pos(.D(SW[9]), .clk(SW[0]), .Q(LEDR[9]), .Qnot(LEDR[2]));

	dff_neg instantiate_dff_neg(.D(SW[9]), .clk(SW[0]), .Q(LEDR[8]), .Qnot(LEDR[1]));
	
	d_latch instantiate_d_latch(.D(SW[9]), .clk(SW[0]), .Q(LEDR[7]), .Qnot(LEDR[0]));
	
endmodule