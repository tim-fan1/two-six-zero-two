module controller_combout(currstate, ISR, rout, ren);
	parameter [3:0] 
		PRE_FETCH = 4'b0000, // Load q_rom.
		FETCH = 4'b0001, // Update ISR.
		DECODE = 4'b0010,
		EXEC_AX1 = 4'b0011, // Add/Xor.
		EXEC_AX2 = 4'b0100,
		EXEC_AX3 = 4'b0101,
		EXEC_L = 4'b0110, // Load.
		EXEC_M = 4'b0111, // Move.
		INCREMENT = 4'b1000, // Increment PCR.
		ERROR = 4'b1111; // UNUSED.
	parameter [1:0]
		MOVE = 2'b00, // Opcodes.
		LOAD = 2'b01,
		ADD = 2'b10,
		XOR = 2'b11;
	input [3:0] currstate;
	input [7:0] ISR;
	output [15:0] rout, ren;

	reg [3:0] _rout, _ren;

	wire [1:0] opcode;
	assign opcode = ISR[7:6];

	// Send signals to onehot decoder.
	always @(currstate) begin
		case (currstate)
		EXEC_AX1: _rout <= { 1'b0, ISR[5:3] }; // RXout.
		EXEC_AX2: _rout <= { 1'b0, ISR[2:0] }; // RYout.
		EXEC_AX3: _rout <= 4'b1000; // Gout.
		EXEC_L: _rout <= 4'b1010; // EXTERNout.
		EXEC_M: _rout <= { 1'b0, ISR[2:0] }; // RYout
		default: _rout <= 4'b1111;
		endcase
	end
	always @(currstate) begin
		case (currstate)
		PRE_FETCH: _ren <= 4'b1101; // qROMen.
		FETCH: _ren <= 4'b1011; // ISRen.
		EXEC_AX1: _ren <= 4'b1001; // Aen.
		EXEC_AX2: _ren <= 4'b1000; // Gen.
		EXEC_AX3: _ren <= { 1'b0, ISR[5:3] }; // RXin.
		EXEC_L: _ren <= { 1'b0, ISR[5:3] }; // RXin.
		EXEC_M: _ren <= { 1'b0, ISR[5:3] }; // RXin.
		INCREMENT: _ren <= 4'b1100; // PCRen.
		default: _ren <= 4'b1111;
		endcase
	end

	// Receive signals and output onehot encoding.
	controller_onehotdecoder _rout_onehot(.d(_rout), .q(rout));
	controller_onehotdecoder _ren_onehot(.d(_ren), .q(ren));
endmodule