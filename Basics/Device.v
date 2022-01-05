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
 *  	D_flipflop();		// posedge clk flipflop
 *		D_flipflop_rst();
 *
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
/*
    // Synchronized Reset
   	always @(posedge clk)
	    begin
	        if(rst)
	        	q <= 0;
	        else
	        	q <= d;
	    end
*/

	// Asynchronous Reset
    always @(posedge clk, posedge rst)
	    begin
	        if(rst)
	            q <= 0;
	        else
	            q <= d;
	    end    

endmodule
