module gated_DLatch (clk, D, Q, Qnot);
   input  D, clk;
   output Q, Qnot;
	
	wire notD;
	assign notD = !D;
   // You will need to instantiate gated_RS and modify relevant signals
	gated_RS rs(.clk(clk), .R(notD), .S(D), .Q(Q), .Qnot(Qnot));
endmodule