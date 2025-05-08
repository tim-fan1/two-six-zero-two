module part2_instantiate(SW,LEDR);

	input[9:0] SW;
	output [9:0] LEDR;
	// THIS WORKED!! But my understanding of what SW[3:0] meant, differed from what is in here.
	// The only issue was with this instantiation file!! Change the order of u,v,w,x to match
	// what I understand what SW[3:0] means.
	//
	// one_bit_4to1mux instantiate_p2 (.s(SW[5:4]),.u(SW[3]),.v(SW[2]),.w(SW[1]),.x(SW[0]),.m(LEDR[0]));
	one_bit_4to1mux instantiate_p2 (.s(SW[5:4]),.u(SW[0]),.v(SW[1]),.w(SW[2]),.x(SW[3]),.m(LEDR[0]));
	
endmodule
