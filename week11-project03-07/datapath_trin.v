module datapath_trin(enable, d, q);
	input enable;
	input [15:0] d;
	output [15:0] q;
	assign q = (enable == 1'b1) ? d : 16'bz;
endmodule