`timescale 1ns / 1ps;
module testbench();
	reg a,b,c,d;
	wire [1:0] x, u, v;
	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end
	
	always #50 d = ~d;
	always #100 c = ~c;
	always #200 b = ~b;
	always #400 a = ~a;

	assign u = { a, b };
	assign v = { c, d };

	twoscomplement TWOS_COMPLEMENT(.x(x), .a(u), .b(v));

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, testbench);
		#100000
		$finish;
	end
endmodule