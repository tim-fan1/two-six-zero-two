module toggle_flipflop(toggle, clock, resetnot, Q, Qnot);
	input  toggle, clock, resetnot;
	output Q, Qnot;
	reg    Q, Qnot;
	always @(posedge clock, negedge resetnot) begin
		if (resetnot == 1'b0) begin
			// It was (at least) the negedge resetnot
			// that triggered. So, reset Q.
			Q <= 0;
			Qnot <= 1;
		end else if (toggle == 1'b1) begin
			// It was the posedge clock that triggered.
			// Check if toggle is on. If toggle is on,
			// flip Q. Otherwise, leave Q as it is.
			Q <= ~Q;
			Qnot <= ~Qnot;
		end
	end
endmodule