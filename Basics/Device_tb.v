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

module FullAdder_tb();
	reg A_1bit, B_1bit, CIN_1bit, CLK;
	wire SUM,COUT;

	initial 
		begin
			$display("Running Gate module testbench");	
			$dumpfile("Device.vcd");	// 打开一个VCD数据库用于记录
			// $dumpvars(level,start_module); 要记录的信号，level=0表示记录所有
			$dumpvars(0, FullAdder_1bit);					
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

