module fourbit_counter(toggle, clock, resetnot, Q, carryout);
	// A fourbit counter. Toggle logic 1 on 
	// posedge clock will increment counter.
	input        toggle, clock, resetnot;
	output [3:0] Q;
	output       carryout;

	wire   [3:0] t;

	assign Q = t;

	// TODO: why does this work?
	assign carryout = (Q == 4'b1111) ? 1'b1 : 1'b0;

	toggle_flipflop Q0(.toggle(toggle), .clock(clock), .resetnot(resetnot), .Q(t[0]));
	toggle_flipflop Q1(.toggle(t[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[1]));
	toggle_flipflop Q2(.toggle(t[1] & t[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[2]));
	toggle_flipflop Q3(.toggle(t[2] & t[1] & t[0] & toggle), .clock(clock), .resetnot(resetnot), .Q(t[3]));

endmodule