`timescale 1ns / 1ps
 
module lab4_part1_TB;
 
	reg [3:0] count;
	reg Rin,Sin,Clkin;
	wire Qout,Qnotout;
	
	gated_RS instantiate_gated_RS (
		.clk(Clkin), 
		.R(Rin), 
		.S(Sin), 
		.Q(Qout), 
		.Qnot(Qnotout)
	);
	
	initial begin 
		count = 4'b0000;
		Clkin =1'b0;
	end
	
	always 
		#50 count = count + 4'b0001;
	
	always begin
		// 100 ns per clock cycle.
		#100
		Clkin = 1'b0;
		#100
		Clkin = 1'b1;
	end	

	
	always @(count) begin
		case (count)
		4'b0000 : begin Sin = 1'b0; Rin = 1'b0; end // Initially Qout and Qnotout should be Z, undefined.
		4'b0001 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b0010 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b0011 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b0100 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b0101 : begin Sin = 1'b0; Rin = 1'b1; end // This resets Qout to 0 (and Qnotout to 1),
		4'b0110 : begin Sin = 1'b0; Rin = 1'b0; end // and now Qout and Qnotout are defined (to 0 and 1 respectively),
		4'b0111 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b1000 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b1001 : begin Sin = 1'b1; Rin = 1'b0; end // until this sets Qout to 1 (and Qnotout to 0).
		4'b1010 : begin Sin = 1'b0; Rin = 1'b0; end // and so now Qout and Qnotout - still defined - are 1 and 0.
		4'b1011 : begin Sin = 1'b0; Rin = 1'b0; end // ...
		4'b1100 : begin Sin = 1'b1; Rin = 1'b1; end // until this ... this is a bad inputs into SR latch,
		4'b1101 : begin Sin = 1'b0; Rin = 1'b0; end // consider Qout and Qnotout to both be undefined.
		4'b1110 : begin Sin = 1'b0; Rin = 1'b0; end // The simulation should still give values for Qout/Qnotout,
		4'b1111 : begin Sin = 1'b0; Rin = 1'b0; end // but they might be Qout = 1, and Qnotout = 1;
		default : begin Sin = 1'b0; Rin = 1'b0; end // or Qout = 0, and Qnotout = 0.
	endcase
	end

	/*
	reg [9:0] SW;
	wire [9:0] LEDR;
	wire clk;

	instantiate_lab4_part1 LAB4PART1_FPGA(SW, LEDR, clk);
	reg [3:0] count;
	initial 
		count = 4'b0000;
	always 
		#50 count = count + 4'b0001;

	always @(count) begin
		case (count)
		4'b0000 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // Initially Qout and Qnotout should be Z, undefined.
		4'b0001 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b0010 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b0011 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b0100 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b0101 : begin SW[8] = 1'b0; SW[9] = 1'b1; end // This resets Qout to 0 (and Qnotout to 1),
		4'b0110 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // and now Qout and Qnotout are defined (to 0 and 1 respectively),
		4'b0111 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b1000 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b1001 : begin SW[8] = 1'b1; SW[9] = 1'b0; end // until this sets Qout to 1 (and Qnotout to 0).
		4'b1010 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // and so now Qout and Qnotout - still defined - are 1 and 0.
		4'b1011 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // ...
		4'b1100 : begin SW[8] = 1'b1; SW[9] = 1'b1; end // until this ... this is a bad inputs into SR latch,
		4'b1101 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // consider Qout and Qnotout to both be undefined.
		4'b1110 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // The simulation should still give values for Qout/Qnotout,
		4'b1111 : begin SW[8] = 1'b0; SW[9] = 1'b0; end // but they might be Qout = 1, and Qnotout = 1;
		default : begin SW[8] = 1'b0; SW[9] = 1'b0; end // or Qout = 0, and Qnotout = 0.
	endcase
	end
	*/
	/*
	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, lab4_part1_TB);
		#100000 $finish;
	end
	*/
 
endmodule
