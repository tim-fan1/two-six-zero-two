`timescale 1ns / 1ps

module lab3_p4_TB;
	reg [3:0] a, b;
	reg cin;
	wire [6:0] d1, d0;
	wire [3:0] s1, s0;
	wire error;
	wire cout;

	reg [3:0] count;

	initial begin
		count = 4'b0000;
	end

	// TODO: why does adding @count not run this again?
	always begin
		#50
		count = count + 4'b0001;
	end

	always @(count) begin
		case (count) 
			4'b0000: begin a = 4'b0001; b = 4'b0001; cin = 1'b0; end
			4'b0001: begin a = 4'b0110; b = 4'b0010; cin = 1'b0; end
			4'b0010: begin a = 4'b1110; b = 4'b0010; cin = 1'b1; end
			4'b0011: begin a = 4'b1001; b = 4'b0010; cin = 1'b0; end
			4'b0100: begin a = 4'b0011; b = 4'b1110; cin = 1'b0; end
			4'b0101: begin a = 4'b0100; b = 4'b0110; cin = 1'b1; end
			4'b0110: begin a = 4'b1010; b = 4'b0011; cin = 1'b0; end
			4'b0111: begin a = 4'b0111; b = 4'b0010; cin = 1'b0; end
			4'b1000: begin a = 4'b0011; b = 4'b1111; cin = 1'b1; end
			4'b1001: begin a = 4'b1010; b = 4'b1000; cin = 1'b0; end
			4'b1010: begin a = 4'b0110; b = 4'b0110; cin = 1'b1; end
			4'b1011: begin a = 4'b1010; b = 4'b0010; cin = 1'b1; end
			4'b1100: begin a = 4'b1010; b = 4'b0010; cin = 1'b0; end
			4'b1101: begin a = 4'b0011; b = 4'b0010; cin = 1'b0; end
			4'b1110: begin a = 4'b0111; b = 4'b0010; cin = 1'b1; end
			4'b1111: begin a = 4'b0011; b = 4'b0010; cin = 1'b0; end
			default: begin a = 4'b0110; b = 4'b0010; cin = 1'b0; end
		endcase
	end

	BCD_adder bcd_adder_7seg(.a(a), .b(b), .cin(cin), .d1(d1), .d0(d0), .s1(s1), .s0(s0), .error(error), .cout(cout));

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, lab3_p4_TB);
		#100000
		$finish;
	end

// Leaving endmodule out produces some funny bugs.
endmodule