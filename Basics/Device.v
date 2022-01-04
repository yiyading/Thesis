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


module FullAdder_1bit(
	input wire a, b, cin,
	output wire sum, cout
	);

	assign {cout, sum} = a + b + cin;
endmodule // FullAdder_1bit_behavior




module Counter (
	input wire clk, rst,
	output reg [2:0] cnt
	);

	parameter max = 3'b101;		// parameter常量参数化，增加代码易读性
	always @(posedge rst, posedge clk)	// , 和 or 作用相同
		begin
			if(rst)
				begin
					cnt <= 3'b000;
				end
			else
				begin
					if(cnt == max)
						begin
							cnt <= 3'b000;
						end
					else
						begin
							cnt <= cnt + 3'b001;
						end
				end
		end
endmodule // Counter