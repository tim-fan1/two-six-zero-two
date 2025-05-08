module dff_pos_async_reset(D, clk, Q, Qnot, resetnot);
	input  D, clk, resetnot;
	output Q, Qnot;
	reg    Q, Qnot;

	// Have to respond on asynchronous change to resetnot, 
	// and ideally only when resetnot is changed to logic 0 
	// (there's no point responding on change to logic 1).
	//
	// So respond on negedge of resetnot, respond on the moment
	// that resetnot is changed to logic 0.
	always @(posedge clk, negedge resetnot) begin
		if (resetnot == 1'b0) begin
			// It was (at least) the negedge resetnot that triggered. 
			// Reset flipflop on logic 0 applied to input pin.
			Q <= 0;
			Qnot <= 1;
		end else begin
			// It must have been posedge clk that triggered.
			// So, default dflipflop behaviour.
			Q <= D;
			Qnot <= ~D;
		end
	end
endmodule