`include "{heydari}.{hesam}.{99243033}.finalProject.v"
`timescale 1s/1s
module testbench();
	wire [2 : 0] light_A;
	wire [2 : 0] light_B;
	reg clk;
	reg rst;
	finalProject finalproject(clk, rst, light_A, light_B);
	initial clk = 1;
	always begin
		#0.5
		clk = ~clk;
	end
	initial begin
	rst = 0;
	#1
	rst = 1;
	#1
	rst = 0;
	#50
	rst = 1;
	#1
	rst = 0;
	#50
	rst = 1;
	#1
	rst = 0;
	#50
	$stop;
	end
	
endmodule