`timescale 1ns / 1ps
 
module lab4_part5_TB;
	reg  [3:0] count;
	reg        clk, resetnot;
	reg  [7:0] D;
	wire [7:0] A, B;
	wire [6:0] HEXA1, HEXA0, HEXB1, HEXB0;
	
	// reg [7:0] SW;
	// reg [1:0] KEY;
	// wire [6:0] HEX3, HEX2, HEX1, HEX0;

	// always @(D) begin
	// 	SW <= D;
	// end

	// always @(clk, resetnot) begin
	// 	KEY <= { clk, resetnot };
	// end

	// lab4_part5_instantiate lab4_part5(.SW(SW), 
	//                                   .KEY(KEY), 
	//                                   .HEX3(HEX3),
	//                                   .HEX2(HEX2),
	//                                   .HEX1(HEX1),
	//                                   .HEX0(HEX0));

	lab4_part5 lab4_part5(.D(D), 
	                      .clk(clk), 
	                      .resetnot(resetnot), 
	                      .A(A), 
	                      .B(B), 
	                      .HEXA1(HEXA1), 
	                      .HEXA0(HEXA0), 
	                      .HEXB1(HEXB1), 
	                      .HEXB0(HEXB0));

	initial begin
		resetnot = 1'b1;
	end

	initial begin 
		count = 4'b0000;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end

	initial begin
		#123
		resetnot = ~resetnot;
		#5
		resetnot = ~resetnot;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin D = 8'b01000100; clk = 1'b0; end
		4'b0001 : begin D = 8'b01000100; clk = 1'b0; end
		4'b0010 : begin D = 8'b01000100; clk = 1'b1; end
		4'b0011 : begin D = 8'b00000001; clk = 1'b0; end
		4'b0100 : begin D = 8'b10001000; clk = 1'b0; end
		4'b0101 : begin D = 8'b10101010; clk = 1'b1; end
		4'b0110 : begin D = 8'b10011001; clk = 1'b0; end
		4'b0111 : begin D = 8'b10001000; clk = 1'b0; end
		4'b1000 : begin D = 8'b10111011; clk = 1'b1; end
		4'b1001 : begin D = 8'b00000000; clk = 1'b1; end
		4'b1010 : begin D = 8'b11001100; clk = 1'b1; end
		4'b1011 : begin D = 8'b00000000; clk = 1'b0; end
		4'b1100 : begin D = 8'b10001000; clk = 1'b0; end
		4'b1101 : begin D = 8'b10101010; clk = 1'b0; end
		4'b1110 : begin D = 8'b00000000; clk = 1'b0; end
		4'b1111 : begin D = 8'b10101010; clk = 1'b1; end
		default : begin D = 8'b01000100; clk = 1'b0; end
	endcase
	end

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, lab4_part5_TB);
		#100000
		$finish;
	end

 
endmodule
