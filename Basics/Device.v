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

// FullAdder
module FullAdder_1bit(
	input wire a, b, cin,
	output wire sum, cout
	);

	assign {cout, sum} = a + b + cin;
endmodule // FullAdder_1bit_behavior



// Counter
module Counter_4bit (
	input wire clk, rst,
	output reg [3:0] cnt
	);

	parameter max = 4'b1010;					// parameter: improve code legibility
	always @(posedge rst, posedge clk)		// , and or have the same effect
		begin
			if(rst)
				begin
					cnt <= 4'b0000;
				end
			else
				begin
					if(cnt == max)
						begin
							cnt <= 4'b0000;
						end
					else
						begin
							cnt <= cnt + 4'b0001;
						end
				end
		end
endmodule // Counter




/*
 *	Module:
 *		D_latch();
 *  	D_flipflop();		// posedge
 */
module D_latch(
	input wire d, clk,
	output reg q
	);

	always @(d, clk)
		if(clk == 1)
			q <= d;		// if clk=1 q capture d
endmodule

module D_flipflop(
	input wire d, clk,
	output reg q
	);
	
	always @(posedge clk) 
		begin
			q <= d; 
		end
endmodule


module D_flipflop_rst(
	input wire d, clk, rst,
	output reg q
	);

    reg q;//上电以后，在时钟没有工作之前，这个寄存器应该是个什么信号呢，就是初始化的信号
          //通常上电初始化我们用复位信号来做，用复位信号来指定复位以后的状态
//    always @ (posedge clk)//我们用正的时钟沿做它的敏感信号
//    begin
//        if(rst)//同步复位信号
//            q <=0;
//        else
//            q <= d;//上升沿有效的时候，把d捕获到q
//    end

    always @ (posedge clk,posedge rst)//我们用正的时钟沿做它的敏感信号
    begin
        if(rst)//异步复位信号，跟时钟沿无关，只要复位是高电平就会复位
            q <=0;
        else
            q <= d;//上升沿有效的时候，把d捕获到q
    end    

endmodule
