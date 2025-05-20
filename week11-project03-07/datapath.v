module datapath(clock, resetnot, rout, ren, addxor, instruction, ISR
	, bus, R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN, alu
);
	input clock, resetnot, addxor;
	input [15:0] rout, ren;
	input [7:0] instruction;

	// The rest are internal wires, made viewable for debugging.
	output tri [15:0] bus; 
	output wire [15:0] R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN;
	output wire [15:0] alu;
	output wire [7:0] ISR;

	// Load data onto EXTERN wire.
	assign EXTERN = ISR[2:0];

	datapath_alu _datapath_alu(.alu(alu), .addxor(addxor), .A(A), .bus(bus));

	// Loading onto shared bus. Only one at a time please! (So, one-hot encoding is required.)
	datapath_trin _triR0(.enable(rout[0]), .d(R0), .q(bus));
	datapath_trin _triR1(.enable(rout[1]), .d(R1), .q(bus));
	datapath_trin _triR2(.enable(rout[2]), .d(R2), .q(bus));
	datapath_trin _triR3(.enable(rout[3]), .d(R3), .q(bus));
	datapath_trin _triR4(.enable(rout[4]), .d(R4), .q(bus));
	datapath_trin _triR5(.enable(rout[5]), .d(R5), .q(bus));
	datapath_trin _triR6(.enable(rout[6]), .d(R6), .q(bus));
	datapath_trin _triR7(.enable(rout[7]), .d(R7), .q(bus));
	// Bus takes from G, bus takes from A, bus takes from EXTERN, registers.
	datapath_trin _triG(.enable(rout[8]), .d(G), .q(bus));
	datapath_trin _triA(.enable(rout[9]), .d(A), .q(bus));
	datapath_trin _triEXTERN(.enable(rout[10]), .d(EXTERN), .q(bus));

	// Taking from bus. Userland registers take from bus. (For this, one-hot encoding isn't...)
	datapath_regn _R0(.clock(clock), .enable(ren[0]), .d(bus), .q(R0));
	datapath_regn _R1(.clock(clock), .enable(ren[1]), .d(bus), .q(R1));
	datapath_regn _R2(.clock(clock), .enable(ren[2]), .d(bus), .q(R2));
	datapath_regn _R3(.clock(clock), .enable(ren[3]), .d(bus), .q(R3));
	datapath_regn _R4(.clock(clock), .enable(ren[4]), .d(bus), .q(R4));
	datapath_regn _R5(.clock(clock), .enable(ren[5]), .d(bus), .q(R5));
	datapath_regn _R6(.clock(clock), .enable(ren[6]), .d(bus), .q(R6));
	datapath_regn _R7(.clock(clock), .enable(ren[7]), .d(bus), .q(R7));
	// G register takes from alu, A register takes from bus, EXTERN register takes from bus.
	datapath_regn _G(.clock(clock), .enable(ren[8]), .d(alu), .q(G));
	datapath_regn _A(.clock(clock), .enable(ren[9]), .d(bus), .q(A));
	// datapath_regn _EXTERN(.clock(clock), .enable(ren[10]), .d(bus), .q(EXTERN));
	datapath_regn _ISR(.clock(clock), .enable(ren[11]), .d(instruction), .q(ISR));
endmodule
