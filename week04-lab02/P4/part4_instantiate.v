module part4_instantiate(SW,HEX0);

	input[9:0] SW;
	output [6:0] HEX0;
	decoder_7seg instantiate_decoder(.code(SW[1:0]),.decoded_output(HEX0));
	
endmodule