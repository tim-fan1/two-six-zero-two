module onesecondclock_using50megahertzclock(clock, Q);
	input clock; // this better be a 50 megahertz clock!!!
	output reg Q;
	reg [25:0] twentysixbit_register; // note that 2^26 is 67,108,864; 
	                                  // and we want to store up to 50,000,000.
	initial begin 
		twentysixbit_register = 0;
		Q <= 0;
	end
	always @(posedge clock) begin
		twentysixbit_register <= twentysixbit_register + 1;
		// TODO: reset back to zero.
		if (twentysixbit_register == 26'b10111110101111000010000000) Q <= 1;
		else Q <= 0;
	end
endmodule