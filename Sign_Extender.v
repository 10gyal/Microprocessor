`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:36 06/11/2021 
// Design Name: 
// Module Name:    Sign_Extender 
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
module Sign_Extender(
	input [1:0]Input,
	output [7:0]Output
    );

	assign Output[1:0] = Input;
	assign Output[7:2] = (Input[1] == 1'b1) ? 6'b111111 : 6'b000000;
	
	

endmodule
