module two_bit_4to1muxV2 (s,u,v,w,x,m);
 
	input[1:0] s;
	input[1:0] u,v,w,x;
	output reg[1:0] m;
	
	reg[1:0] t1, t2;
	
	// t1 = !s[0] ? u : v;
	// t2 = !s[0] ? w : x;
	always @(u,v,w,x,s) begin
		if (s[0] == 1'b0) 
		begin
			t1 = u;
			t2 = w;
		end
		else // if (s[0] == 1'b1)
		begin
			t1 = v;
			t2 = x;
		end
	end

	always @(t1, t2, s) begin
		if (s[1] == 1'b0) 
			m = t1;
		else
		  m = t2;
	end

endmodule
