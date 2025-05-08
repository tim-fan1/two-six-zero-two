module circuitB (z, s1);
    input z;
	output reg[3:0] s1; 
	
	always @(z)
	begin
	  if (z == 1'b0)
		s1 = 7'b0000;
	  else
		s1 = 7'b0001;
	end
endmodule