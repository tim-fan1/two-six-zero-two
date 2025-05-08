module master_slave (clk, D, Q, Qnot);
   input  D, clk;
   output Q, Qnot;
   
   wire Qm;
   
   wire clk_not;
   assign clk_not = ~clk;
	
   // You will need to instantiate a few instances of gated_DLatch, 
   // and perhaps assign some intermediate signals
   gated_DLatch m_latch(.clk(clk_not), .D(D), .Q(Qm));
   gated_DLatch s_latch(.clk(clk), .D(Qm), .Q(Q), .Qnot(Qnot));
	
endmodule