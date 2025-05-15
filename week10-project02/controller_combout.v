module controller_combout(currstate, instruction, rout, ren);
	parameter [3:0] 
		ZERO = 4'b0000, // State assignments.
		ONE = 4'b0001,
		A1 = 4'b0010,
		A2 = 4'b0011,
		A3 = 4'b0100,
		L = 4'b0101,
		M = 4'b0110,
		X1 = 4'b0111,
		X2 = 4'b1000,
		X3 = 4'b1001,
		E = 4'b1111;
	input [3:0] currstate;
	input [7:0] instruction;
	output reg [15:0] rout, ren;
	reg [3:0] rout_, ren_;

	// Send signal to onehot decoder.
	always @(currstate) begin
		case (currstate)
		A1: rout_ <= { 1'b0, instruction[5:3] }; // RXout. Zero fill to pad to four bits.
		A2: rout_ <= { 1'b0, instruction[2:0] }; // RYout.
		A3: rout_ <= 4'b1000;                    // Gout.
		endcase
	end
	always @(currstate) begin
		case (currstate)
		A1: ren_ <= 4'b1001; // Aen
		A2: ren_ <= 4'b1000; // Gen
		A3: ren_ <= { 1'b0, instruction[5:3] }; // Rxin.
		endcase
	end

	// Receive signal and output onehot encoding.
	always @(rout_) begin
		case (rout_) 
		4'b0000: rout <= 16'b0000000000000001; // R0out.
		4'b0001: rout <= 16'b0000000000000010; // R1out.
		4'b0010: rout <= 16'b0000000000000100; // R2out.
		4'b0011: rout <= 16'b0000000000001000; // R3out.
		4'b0100: rout <= 16'b0000000000010000; // R4out.
		4'b0101: rout <= 16'b0000000000100000; // R5out.
		4'b0110: rout <= 16'b0000000001000000; // R6out.
		4'b0111: rout <= 16'b0000000010000000; // R7out.
		4'b1000: rout <= 16'b0000000100000000; // Gout.
		4'b1001: rout <= 16'b0000001000000000; // AddXor.
		default: rout <= 16'b1000000000000000; // UNUSED.
		endcase
	end
	always @(ren_) begin
		case (ren_) 
		4'b0000: ren <= 16'b0000000000000001; // R0en.
		4'b0001: ren <= 16'b0000000000000010; // R1en.
		4'b0010: ren <= 16'b0000000000000100; // R2en.
		4'b0011: ren <= 16'b0000000000001000; // R3en.
		4'b0100: ren <= 16'b0000000000010000; // R4en.
		4'b0101: ren <= 16'b0000000000100000; // R5en.
		4'b0110: ren <= 16'b0000000001000000; // R6en.
		4'b0111: ren <= 16'b0000000010000000; // R7en.
		4'b1000: ren <= 16'b0000000100000000; // Gen.
		4'b1001: ren <= 16'b0000001000000000; // Aen.
		default: ren <= 16'b1000000000000000; // UNUSED.
		endcase
	end
endmodule