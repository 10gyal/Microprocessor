`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:57 06/11/2021 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input [1:0]I,
	output [7:0]out
    );
	
	assign out = (I == 2'b00) ? 8'b11000001:
					 (I == 2'b01) ? 8'b01101010:
					 (I == 2'b10) ? 8'b10100100:
					 (I == 2'b11) ? 8'b00010010:
					 8'b00000000;

endmodule
