module lab5_part3(clock, resetnot, HEX0, HEX1, HEX2, HEX3);
	input         clock /* this better be a 50Mhz clock!!! */, resetnot;
	output  [6:0] HEX0, HEX1, HEX2, HEX3;

	wire   [15:0] Q;
	wire          enable;
	wire          tautology;
	assign tautology = 1'b1;
	
	onesecondclock_using50megahertzclock onesecondclock(
		.clock(clock), 
		.Q(enable)
	);
	lab5_part1 sixteenbitcounter(
		.toggle(tautology), 
		.clock(enable), 
		.resetnot(resetnot), 
								 
		.Q(Q), 
		.HEX0(HEX0), 
		.HEX1(HEX1), 
		.HEX2(HEX2), 
		.HEX3(HEX3)
	);
endmodule