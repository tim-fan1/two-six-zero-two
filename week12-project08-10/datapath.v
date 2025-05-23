module datapath(clock, resetnot, rout, ren, addxor, ISR
	, bus, R0, R1, R2, R3, R4, R5, R6, R7, G, A, EXTERN, alu, PCR, q_rom
);
	input clock, resetnot;

	// Received from controller.
	input [15:0] rout, ren;

	// Send to controller.
	output [7:0] ISR;

	// Internal wires, made visible for debugging.
	output wire addxor;
	output tri [15:0] bus;
	output wire [15:0] R0, R1, R2, R3, R4, R5, R6, R7, G, A, PCR; // Register outputs.
	output wire [15:0] EXTERN, alu, PCRincrement; // Combinational outputs.
	output wire [15:0] q_rom; // Synchronous outputs.

	// Load data onto EXTERN wire. 
	// FIXME: how to support loading from read-write data memory.
	// maybe, assign EXTERN = q_ram, where q_ram is word at read_address_ram in data memory.
	assign EXTERN = ISR[2:0];
	assign PCRincrement = PCR + 1;
	assign addxor = ISR[6];

	// Combinational circuit that sums A and bus together, continuously.
	datapath_alu _datapath_alu(.alu(alu), .addxor(addxor), .A(A), .bus(bus));

	// Sequential circuit that updates output on posedge clock, 
	// with instruction in ROM at program counter, if enabled.
	// TODO: replace PCR with (PCR || BRANCH_ADDR).
	ROM _instruction_rom(.clock(clock), .enable(ren[13]), .d(PCR), .q(q_rom));

	// Loading onto shared bus. Only one at a time please!
	// (rout is given as a vector where only one bit is on).
	datapath_trin _triR0(.enable(rout[0]), .d(R0), .q(bus));
	datapath_trin _triR1(.enable(rout[1]), .d(R1), .q(bus));
	datapath_trin _triR2(.enable(rout[2]), .d(R2), .q(bus));
	datapath_trin _triR3(.enable(rout[3]), .d(R3), .q(bus));
	datapath_trin _triR4(.enable(rout[4]), .d(R4), .q(bus));
	datapath_trin _triR5(.enable(rout[5]), .d(R5), .q(bus));
	datapath_trin _triR6(.enable(rout[6]), .d(R6), .q(bus));
	datapath_trin _triR7(.enable(rout[7]), .d(R7), .q(bus));
	datapath_trin _triG(.enable(rout[8]), .d(G), .q(bus));
	datapath_trin _triA(.enable(rout[9]), .d(A), .q(bus));
	datapath_trin _triEXTERN(.enable(rout[10]), .d(EXTERN), .q(bus));

	// Taking from shared bus, and other memories.
	datapath_regn _R0(.clock(clock), .resetnot(resetnot), .enable(ren[0]), .d(bus), .q(R0));
	datapath_regn _R1(.clock(clock), .resetnot(resetnot), .enable(ren[1]), .d(bus), .q(R1));
	datapath_regn _R2(.clock(clock), .resetnot(resetnot), .enable(ren[2]), .d(bus), .q(R2));
	datapath_regn _R3(.clock(clock), .resetnot(resetnot), .enable(ren[3]), .d(bus), .q(R3));
	datapath_regn _R4(.clock(clock), .resetnot(resetnot), .enable(ren[4]), .d(bus), .q(R4));
	datapath_regn _R5(.clock(clock), .resetnot(resetnot), .enable(ren[5]), .d(bus), .q(R5));
	datapath_regn _R6(.clock(clock), .resetnot(resetnot), .enable(ren[6]), .d(bus), .q(R6));
	datapath_regn _R7(.clock(clock), .resetnot(resetnot), .enable(ren[7]), .d(bus), .q(R7));
	datapath_regn _G(.clock(clock), .resetnot(resetnot), .enable(ren[8]), .d(alu), .q(G));
	datapath_regn _A(.clock(clock), .resetnot(resetnot), .enable(ren[9]), .d(bus), .q(A));
	datapath_regn _ISR(.clock(clock), .resetnot(resetnot), .enable(ren[11]), .d(q_rom), .q(ISR));
	datapath_regn _PCR(.clock(clock), .resetnot(resetnot), .enable(ren[12]), .d(PCRincrement), .q(PCR));
endmodule