`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:08 06/02/2021 
// Design Name: 
// Module Name:    Freq_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Frequency_Devider(
    input clkin,
    input clr,
    output reg clkout
    );
	
	reg [31:0] cnt;
	always @(posedge clkin) begin
		if(clr) begin
			cnt <= 32'd0;
			clkout <=1'b1;
		end
		if(cnt == 32'd25000000) begin
			cnt <=32'd0;
			clkout <= ~clkout;
		end else begin
			cnt <= cnt + 1;
		end
	end

endmodule