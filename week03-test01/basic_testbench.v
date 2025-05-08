`timescale 1ns / 1ps

module basic_testbench;

	// Question 1.
	reg a, b, c, d, e, f, g, h, i, j, k, l;
	reg [3:0] a_word, b_word, c_word;
	wire q1x, q1y, q1z;
	wire [3:0] q2_out;
	reg clock;

	question_1 q1(.out1(q1x), .out2(q1y), .out3(q1z), .in1(b), .in2(a));
	question_2 q2(.out(q2_out), .in1(a_word), .in2(b_word), .in3(clock), .in4(c_word));

	initial begin
		clock = 0;
		a = 0; b = 0; c = 0; d = 0; e = 0;
		f = 0; g = 0; h = 0; i = 0; j = 0;
		k = 0; l = 0;
		a_word = 0;
		b_word = 0;
		c_word = 0;
	end

	always begin
		#25
		clock = ~clock;
	end

	always begin 
		#50
		a = ~a; 
		a_word = { d, c, b, a }; // concat msb first, lsb last. that's why c, then b, then a.
		b_word = { h, g, f, e }; 
		c_word = { l, k, j, i };
 	end
	always begin #100 b = ~b; end
	always begin #200 c = ~c; end
	always begin #400 d = ~d; end
	always begin #800 e = ~e; end
	always begin #1600 f = ~f; end
	always begin #3200 g = ~g; end
	always begin #6400 h = ~h; end
	always begin #12800 i = ~i; end
	always begin #25600 j = ~j; end
	always begin #51200 k = ~k; end
	always begin #102400 l = ~l; end

	// This code is for icarus Verilog
	initial begin
		$dumpfile("xor_tb.vcd");
		$dumpvars(0, basic_testbench);
		#1000000
		$finish;
	end 
endmodule
