module binary_to_7Seg2(b, sevenSeg);

	input[3:0] b;
	
	// b = 0011
	output[6:0]  sevenSeg;
	// I minimise/synthesise the logic circuits myself.
	assign sevenSeg[0] = (b[2] & !b[1] & !b[0]) | (!b[3] & !b[2] & !b[1] & b[0]);
	assign sevenSeg[1] = b[2] & (b[0] ^ b[1]);
	assign sevenSeg[2] = !b[0] & b[1] & !b[2];
	assign sevenSeg[3] = (b[0] & !b[1] & !b[2] & !b[3]) | b[2] & (b[0] & b[1] | !b[0] & !b[1]);
	assign sevenSeg[4] = (!b[0] & !b[1] & b[2]) | b[0];
	assign sevenSeg[5] = (b[0] & !b[3] & !b[2]) | (b[0] & b[1]) | (b[1] & !b[2] & !b[0]);
	assign sevenSeg[6] = (!b[1] & !b[2] & !b[3]) | (b[0] & b[1] & b[2]);
 
endmodule
