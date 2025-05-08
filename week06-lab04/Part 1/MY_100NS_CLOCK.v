`timescale 1ns / 1ps
module MY_100NS_CLOCK(clk);
	output reg clk;
	initial begin
		clk = 1'b1;
	end

	always begin
		#100 clk = ~clk;
	end
endmodule