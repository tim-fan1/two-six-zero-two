module part3_instantiate(SW,LEDR);

	input[9:0] SW;
	output [9:0] LEDR;
	two_bit_4to1mux instantiate_p3 (.s(SW[9:8]),.u(SW[7:6]),.v(SW[5:4]),.w(SW[3:2]),.x(SW[1:0]),.m(LEDR[1:0]));
	
endmodule