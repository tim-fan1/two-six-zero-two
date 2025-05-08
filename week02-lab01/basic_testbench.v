`timescale 1ns / 1ps

module basic_testbench;

	// Question 1.
	reg a, b, c, d, e, f, g, h, i, j, k, l, m, n, o;
	wire [2:0] q1_out;

	// Question 2.
	reg [2:0] a_word, b_word, c_word;
	wire [3:0] q2_out;

	// Question 3 and 4.
	wire [3:0] q3_out;
	wire [3:0] q4_out;

	question_1 q1(.out(q1_out), .in1(e), .in2(d), .in3(c), .in4(b), .in5(a));
	question_2 q2(.out(q2_out), .in1(a_word), .in2(b_word), .in3(c_word));
	question_3 q3(.out(q3_out), 
		.in1(a), .in2(b), .in3(c), .in4(d), .in5(e), 
		.in6(f), .in7(g), .in8(h), .in9(i), .in10(j), 
		.in11(k), .in12(l), .in13(m), .in14(n), .in15(o));
	question_4 q4(.out(q4_out), 
		.in1(a), .in2(b), .in3(c), .in4(d), .in5(e), 
		.in6(f), .in7(g), .in8(h), .in9(i), .in10(j), 
		.in11(k), .in12(l), .in13(m), .in14(n), .in15(o));

	initial begin
		a = 0; b = 0; c = 0; d = 0; e = 0;
		f = 0; g = 0; h = 0; i = 0; j = 0;
		k = 0; l = 0; m = 0; n = 0; o = 0;
		a_word = 0;
		b_word = 0;
		c_word = 0;
	end

	always begin 
		#50 
		a = ~a; 
		a_word = { c, b, a }; // concat msb first, lsb last. that's why c, then b, then a.
		b_word = { f, e, d }; 
		c_word = { i, h, g }; 
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
	always begin #204800 m = ~m; end
	always begin #409600 n = ~n; end
	always begin #819200 o = ~o; end

	// This code is for icarus Verilog
	initial begin
		$dumpfile("xor_tb.vcd");
		$dumpvars(0, basic_testbench);
		#100000000
		$finish;
	end 
endmodule
