module part1_instantiate(SW,LEDR);

	input[9:0] SW; 
	output [9:0] LEDR;
	four_bit_2to1mux instantiate_p1 (.sel(SW[8]),.a(SW[7:4]),.b(SW[3:0]),.chosen(LEDR[3:0]));
	
endmodule