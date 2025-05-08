module question_2 (out, in1, in2, in3, in4);
	input [3:0] in1, in2, in4; // 3 4-bit inputs.
	input in3; // 1 1-bit input.

	output [3:0] out;

	wire [1:0] cax;
	wire [3:0] cay, cbx;

	reg [3:0] special_temp;

	circuitA ca(.x(cax), .y(cay), .a(in1), .b(in2), .c(in3));
	circuitB cb(.x(cbx), .a(in4), .b(in1));

	always @(cax, cay, in2, cbx, in4) begin
		if (cax == 4'b00)
			assign special_temp = cay;
		else if (cax == 4'b01)
			assign special_temp = in2;
		else if (cax == 4'b10)
			assign special_temp = cbx;
		else
			assign special_temp = in4;
	end

	circuitC cc(.x(out), .a(special_temp), .b(in4));
endmodule
