module instantiate_lab4_part3(SW,LEDR);
 
	input[9:0] SW ;
	output [9:0] LEDR;

	// instantiate and connect master_slave
	master_slave dflipflop(.clk(SW[0]), .D(SW[9]), .Q(LEDR[9]), .Qnot(LEDR[0]));
endmodule