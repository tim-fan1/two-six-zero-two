module datapath_alu(alu, addxor, A, bus);
	input addxor;
	input [15:0] A, bus;
	output reg [15:0] alu;
	always @(addxor, A, bus) begin
		alu <= (addxor == 1'b0) ? A + bus : A ^ bus;
	end
endmodule