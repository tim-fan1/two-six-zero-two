`timescale 1ns / 1ps
module lab5_part1_TB();
	reg   [3:0] count;
	reg         toggle, clock, resetnot;
	wire [15:0] Q;
	wire  [6:0] HEX0, HEX1, HEX2, HEX3;

	reg   [1:0] KEY;
	reg   [0:0] SW;

	initial begin
		toggle   <= 1'b1;
		SW[0]    <= 1'b1; 
		clock    <= 1'b0;
		KEY[0]   <= 1'b0;
		count    <= 4'b0000;
		resetnot <= 1'b1; #5 resetnot <= 1'b0; #5 resetnot <= 1'b1;
		KEY[1] <= 1'b1; #5 KEY[1] <= 1'b0; #5 KEY[1] <= 1'b1;
	end

	always begin
		#20 count <= count + 4'b0001;
	end

	always begin
		#10 clock <= ~clock;
	end

	always begin
		#10 KEY[0] <= ~KEY[0];
	end

	// lab5_part1 sixteenbitcounter(.toggle(toggle), 
	//                              .clock(clock), 
	//                              .resetnot(resetnot), 
	//                              .Q(Q), 
	//                              .HEX0(HEX0), 
	//                              .HEX1(HEX1), 
	//                              .HEX2(HEX2), 
	//                              .HEX3(HEX3));

	lab5_part1_instantiate sixteenbitcounter(.KEY(KEY), .SW(SW), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3));

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, lab5_part1_TB);
		#10000000 
		$finish;
	end
endmodule