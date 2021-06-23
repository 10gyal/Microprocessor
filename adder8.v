`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:09 06/02/2021 
// Design Name: 
// Module Name:    adder8 
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
module adder8(
	input [7:0]a,
	input [7:0]b,
	output [7:0]out
    );
	
	assign out = a + b;
	

	
endmodule
