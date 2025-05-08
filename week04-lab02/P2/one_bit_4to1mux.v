module one_bit_4to1mux (s,u,v,w,x,m);
 
	input[1:0] s;
	input u,v,w,x;
	output m;
	
	wire t1, t2;
	
	one_bit_2to1mux mux1(.s(s[0]),.x(u),.y(v),.m(t1)); // t1 = s[0] ? u : v;
	one_bit_2to1mux mux2(.s(s[0]),.x(w),.y(x),.m(t2)); // t2 = s[0] ? w : x;
	one_bit_2to1mux mux3(.s(s[1]),.x(t1),.y(t2),.m(m)); // m = s[1] ? t1 : t2;
 
endmodule
