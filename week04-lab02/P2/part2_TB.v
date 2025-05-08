`timescale 1ns / 1ps

module part2_TB;

	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [3:0] count;
	reg [1:0] select;
	reg  input1, input2, input3, input4;
	wire output1, output2;
	
	one_bit_4to1mux instantiate_mux4(.s(select),.u(input1),.v(input2),.w(input3),.x(input4),.m(output1));
	one_bit_4to1muxV2 instantiate_mux4V2(.s(select),.u(input1),.v(input2),.w(input3),.x(input4),.m(output2));
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
	
		case (count)
			4'b0000 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // 1
			4'b0001 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b01; end // 0
			4'b0010 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b10; end // 0
			4'b0011 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b11; end // 0
			4'b0100 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // 0
			4'b0101 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b01; end // 1
			4'b0110 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b10; end // 0
			4'b0111 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b11; end // 0

			4'b1000 : begin input1 = 1'b1; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b00; end // 1
			4'b1001 : begin input1 = 1'b1; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b01; end // 1
			4'b1010 : begin input1 = 1'b1; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b10; end // 0
			4'b1011 : begin input1 = 1'b1; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b11; end // 1

			4'b1100 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b00; end // 0
			4'b1101 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b01; end // 1
			4'b1110 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b10; end // 0
			4'b1111 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b1; select = 2'b11; end // 1

			// control does not reach here...
			default : begin input1 = 1'b0; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // 0
		endcase
	end

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, part2_TB);
		#1000000
		$finish;
	end

endmodule
