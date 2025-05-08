module instantiate_lab4_part2(SW,LEDR);
 
	input[9:0] SW ;
	output [9:0] LEDR;

	gated_DLatch instantiate_gated_DLatch (
	.clk(SW[0]), 
	.D(SW[9]), 
	.Q(LEDR[9]), 
	.Qnot(LEDR[8]));
	
endmodule