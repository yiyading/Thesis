`timescale 1ms/100ns
`include "Gate.v"

/*
 *	Author: Yading Yi
 *	E-mail: yiyading@pku.edu.cb
 *
 *	Create Data: 03/01/2022
 *	Function: Gate Testbench code
 * 
 */
module Gate_tb();
	reg [0:0] A_1bit, B_1bit;		// 1bit input signal
	wire [0:0] Y_1bit;				// 1bit output signal

	reg [3:0] A_4bit, B_4bit;		// 4bit input signal
	wire [3:0] Y_4bit;				// 4bit output signal
	
	initial
		begin
			$display("Running Gate module testbench");	
			$dumpfile("synthesize1.vcd");	// 打开一个VCD数据库用于记录
			// $dumpvars(level,start_module); 要记录的信号，level=0表示记录所有
			$dumpvars(0, Gate_tb);			
			A_1bit <= 1'b1;		// <= 非阻塞赋值
			B_1bit <= 1'b1;
			A_4bit <= 4'b1010;
			B_4bit <= 4'b0101;
			#100;
			A_1bit <= 1'b1;
			B_1bit <= 1'b0;
			A_4bit <= 4'b0101;
			B_4bit <= 4'b1010;
			#100;
			A_1bit <= 1'b1;
			B_1bit <= 1'b1;
			A_4bit <= 4'b1010;
			B_4bit <= 4'b0101;
			#100;
			A_1bit <= 1'b0;
			B_1bit <= 1'b0;
			A_4bit <= 4'b0101;
			B_4bit <= 4'b1010;
			#100 $finish;
		end

		AND_gate_4bit AND_gate_4bit(
			.and_a(A_4bit),
			.and_b(B_4bit),
			.and_y(Y_4bit)
			);

		OR_gate_1bit OR_gate_1bit(
			.or_a(A_1bit),
			.or_b(B_1bit),
			.or_y(Y_1bit)
			);

		NAND_gate_1bit NAND_gata_1bit(
			.nand_a(A_1bit),
			.nand_b(B_1bit),
			.nand_y(Y_1bit)
			);
endmodule