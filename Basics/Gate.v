/*
 *	Author: Yading Yi
 *	E-mail: yiyading@pku.edu.cb
 *
 *	Create Data: 03/01/2022
 *	Function: Gate code
 * 
 *	Device: MacBook Air(M1-chip)
 *	Compiler: Icarus Verilog(iverlog)
 *	Waveform: Scansion
 */

 // AND-Gate
module AND_gate_4bit(
	input wire [3:0] and_a, and_b,
	output wire [3:0] and_y
	);

	assign and_y = and_a & and_b;
endmodule


// OR-Gate
module OR_gate_1bit (
	input wire or_a, or_b,   
	output wire or_y	
	);

	assign or_y = or_a | or_b;

endmodule

// NAND-Gate
module NAND_gate_1bit(
	input wire nand_a, nand_b,
	output wire nand_y
	);

	assign nand_y = ~(nand_a & nand_b);

endmodule

module NAND_gate_4bit(
	input wire [3:0] nand_a, nand_b,
	output wire [3:0] nand_y
	);

	assign nand_y = ~(nand_a & nand_b);	// & 按位与

endmodule

// NOR-Gate
module NOR_gate(
	input wire nor_a, nor_b,
	output wire nor_y
	);

	assign nor_y = ~(nor_a | nor_b);
endmodule

// 异或门 exclusive_OR_gate  -- 输入相异，输出为1
module XOR_gate (
	input wire xor_a, xor_b,
	output wire xor_y
	);

	// assign xor_y = A5 ^ B5;
	assign xor_y = (xor_a & ~xor_b) | (~xor_a & xor_b);
endmodule

// 同或门 equivalence gate  -- 输入相异，输出为0
module XNOR_gate(
	input wire [0:0] xnor_a, xnor_b,
	output wire [0:0] xnor_y
	);

	// assign xnor_y = ~(xnor_a ^ xnor_b);
	assign xnor_y = ~(xnor_b & ~xnor_a) | ~(~xnor_a & xnor_b);
endmodule

