module lab3_p2_v1 (v, d1, d2, s1, s0);
    input [3:0] v; 
	output [6:0] d1, d2; // d1 is the ten's digit, d2 is the one's digit.
	output [3:0] s1, s0; // s1 is the ten's digit, s0 is the one's digit.
	
	//Add any required intermediate wires here
	wire [3:0] wire1, wire2;
	wire wire3;
	
	comparator inst_comp(.v(v),.z(wire3));
	circuitA inst_circA(.v(v),.A(wire1));
	circuitB inst_circB(.z(wire3),.s1(s1));
	four_bit_2to1mux inst_mux(.sel(wire3),.a(v),.b(wire1),.chosen(s0));
	binary_to_7Seg instantiate_bto7seg(.binary(s0),.sevenSeg(d2));
	binary_to_7Seg instantiate_bto7seg2(.binary(s1),.sevenSeg(d1));
	
endmodule;