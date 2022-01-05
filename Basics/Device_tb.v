/*
 *	Author: Yading Yi
 *	E-mail: yiyading@pku.edu.cb
 *
 *	Create Data: 04/01/2022
 *	Function: Device code
 * 
 *	Device: MacBook Air(M1-chip)
 *	Compiler: Icarus Verilog(iverlog)
 *	Waveform: Scansion
 * 
 */

`timescale 1ms/100ns
`include "Device.v"

/* ************************************************************************************************************
 *
 * TestBench: 
 *	 FullAdder_tb();
 *
 * ************************************************************************************************************/

module FullAdder_tb();
	reg A_1bit, B_1bit, CIN_1bit, CLK;
	wire SUM,COUT;

	initial 
		begin
			$display("Running module testbench");	
			$dumpfile("Device.vcd");	// Open file for record SIGNAL
			// $dumpvars(level,start_module); 	// level=0: record all SIGNAL
			$dumpvars(0, FullAdder_tb, Counter_tb, D_latch_tb, D_flipflop_tb);					
			#50
			A_1bit = 1'b1;
			B_1bit = 1'b1;
			CIN_1bit = 1'b1;
			CLK = 0;
		end
	always #100 CLK = ~CLK;
	always @(posedge CLK)
		begin
			A_1bit   = {$random}%2;
			B_1bit   = {$random}%2;
			CIN_1bit = {$random}%2;
		end
	FullAdder_1bit FullAdder_1bit(
		.a(A_1bit),
		.b(B_1bit),
		.cin(CIN_1bit),
		.sum(SUM),
		.cout(COUT)
		);

	initial #1050 $finish;
endmodule


/* ************************************************************************************************************
 *
 * TestBench:
 *	 Counter_tb();
 *
 * ************************************************************************************************************/

module Counter_tb();
    reg RST, CLK;
    wire [3:0] CNT;

    initial
	    begin
	    	CLK = 1'b0;
	    	RST = 1'b1;
	    	#50 RST = 1'b0;
	    end
	always #10 CLK <= ~CLK;

    Counter_4bit Counter_4bit(
    	.clk(CLK),
    	.rst(RST),
    	.cnt(CNT)
    	);

endmodule


/* ************************************************************************************************************
 *
 * TestBench:
 *	 D_latch_tb();
 *	 D_flipflop_tb();
 *
 * ************************************************************************************************************/

module D_latch_tb();
    reg CLK, D;
    wire Q;

    initial
	    begin
	        CLK = 1;
	        D <= 0;
	        forever
		        begin
		        	/* 
		        	 *	When CLK=1, Q=D, 
		        	 *	change of D signal is also reflected in the output Q.
		        	 *		-> generate glitches
		        	 */
		            #60 D <= 1;
		            #22 D <= 0;
		            #2  D <= 1;
		            #2  D <= 0;
		            // Keep low at 16ns and cycle periodically.
		            #16 D <= 0;	
		        end
    	end

	// full period of 40ns
    always #20 CLK <= ~CLK;	

    D_latch D_latch(
    	.clk(CLK),
    	.d(D),
    	.q(Q)
    	);

endmodule

module D_flipflop_tb();
	reg CLK, D;
	wire Q;

	initial
	    begin
	        CLK = 1;
	        D <= 0;
	        forever
		        begin
		        	/* 
		        	 *	When CLK=1, Q=D, 
		        	 *	change of D signal isn't reflected in the output Q.
		        	 *		-> can't generate glitches
		        	 */
		            #60 D <= 1; 
		            #22 D <= 0;
		            #2  D <= 1;
		            #2  D <= 0;
		            #16 D <= 0;
		        end
	    end

	// full period of 40ns
    always #20 CLK <= ~CLK;

    D_flipflop D_flipflop(
    	.clk(CLK),
    	.q(Q),
    	.d(D)
    	);
endmodule











