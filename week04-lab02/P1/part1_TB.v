`timescale 1ns / 1ps
 
module part1_TB;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module mux2, naming it instantiate_mux2.
	// select, input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg [3:0] count;
	reg select;
	reg [3:0] input1, input2;
	wire [3:0] output1, output2;
	
	four_bit_2to1mux instantiate_mux4(.sel(select),.a(input1),.b(input2),.chosen(output1));
	four_bit_2to1muxV2 instantiate_mux4v2(.sel(select),.a(input1),.b(input2),.chosen(output2));
 	
	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
			4'b0000 : begin input1 = 4'b0000; input2 = 4'b0001; select = 1'b0; end // 0000
			4'b0001 : begin input1 = 4'b0010; input2 = 4'b0011; select = 1'b1; end // 0011
			4'b0010 : begin input1 = 4'b0100; input2 = 4'b0111; select = 1'b0; end // 0100
			4'b0011 : begin input1 = 4'b1000; input2 = 4'b1111; select = 1'b1; end // 1111

			// My test vectors:
			4'b0100 : begin input1 = 4'b1001; input2 = 4'b0110; select = 1'b0; end // 1001
			4'b0101 : begin input1 = 4'b1001; input2 = 4'b0110; select = 1'b1; end // 0110
			4'b0110 : begin input1 = 4'b0001; input2 = 4'b1110; select = 1'b0; end // 0001
			4'b0111 : begin input1 = 4'b0001; input2 = 4'b1110; select = 1'b1; end // 1110

			default : begin input1 = 4'b0000; input2 = 4'b0000; select = 1'b0; end // 0000
		endcase
	end

 	initial begin
 		$dumpfile("testbench.vcd");
 		$dumpvars(0, part1_TB);
 		#100000
 		$finish;
 	end
endmodule
