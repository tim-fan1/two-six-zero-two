`timescale 1ns / 1ps
module lab3_p3_TB;

	reg [3:0] count;
	//Add inputs/outputs
	reg [3:0] a, b;
	reg cin;
	wire [3:0] s;
	wire cout;

	//instantiate and connect fourBit_FA
	fourBit_FA sum(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));
 	
	initial begin 
		count = 4'b0000;
		cin = 1'b0;
	end
	
	always begin
		#50
		count=count+4'b0001;
	end
	
	always @(count) begin
		case (count)
		4'b0000 : begin a = 4'b0001; b = 4'b0001; end
		4'b0001 : begin a = 4'b0101; b = 4'b0010; end
		4'b0010 : begin a = 4'b1001; b = 4'b0011; end
		4'b0011 : begin a = 4'b0110; b = 4'b0100; end
		4'b0100 : begin a = 4'b1100; b = 4'b0101; end
		4'b0101 : begin a = 4'b1101; b = 4'b0110; end
		4'b0110 : begin a = 4'b0000; b = 4'b0111; end
		4'b0111 : begin a = 4'b0001; b = 4'b1000; end
		4'b1000 : begin a = 4'b0001; b = 4'b1001; end
		4'b1001 : begin a = 4'b0010; b = 4'b1010; end
		4'b1010 : begin a = 4'b1100; b = 4'b1011; end
		4'b1011 : begin a = 4'b0100; b = 4'b1100; end
		4'b1100 : begin a = 4'b0111; b = 4'b1101; end
		4'b1101 : begin a = 4'b1001; b = 4'b1110; end
		4'b1110 : begin a = 4'b1101; b = 4'b1111; end
		4'b1111 : begin a = 4'b1111; b = 4'b0010; end
	endcase
	end

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, lab3_p3_TB);
		#1000000
		$finish;
	end
	
endmodule