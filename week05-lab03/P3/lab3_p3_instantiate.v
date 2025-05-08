module lab3_p3_instantiate(SW,LEDR);

	input[9:0] SW;
	output [9:0] LEDR;
	
	//instantiate and connect fourBit_FA
	fourBit_FA sum(.a(SW[9:6]), .b(SW[5:2]), .cin(SW[1]), .cout(LEDR[9]), .s(LEDR[8:5]));
	
endmodule