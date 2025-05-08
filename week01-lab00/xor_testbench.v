`timescale 1ns / 1ps
 
module xor_testbench;
 
	// ------------------ Instantiate module ------------------
	// We are instantiating the module xor_gate_behav, naming it my_test.
	// input1, input2 are controlled by the testbench, output is 
	// checked  within the testbench
 
	reg input1, input2;
	wire output1;
	xor_gate_behav my_test(.a(input1),.b(input2),.out(output1));
 
	// ------------------ Setup inputs ------------------
	// Provide initial values for inputs. The ‘initial’ command
	// is only valid within the testbench
	initial begin 
		input1 = 0;
		input2 = 0;
	end
 
// Toggle inputs at different rates to cover all input 
// combinations
 
	always begin
		#50
		input1 = ~input1;
	end
	always begin
		#100
		input2 = ~input2;
	end
	
	integer count;
	initial begin 
		count = 0;
	end
	
	always begin
		#50
		count=count+1;
	end

	initial begin
		$dumpfile("xor_testbench.vcd");
		$dumpvars(0, xor_testbench);
		#100000
		$finish;
	end

endmodule
