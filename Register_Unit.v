`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:09 06/11/2021 
// Design Name: 
// Module Name:    Register_Unit 
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
module Register_Unit(
	input Reset,
	input CLK,
	input RegWrite,
	input [1:0] ReadRegister1,
	input [1:0] ReadRegister2,
	input [1:0] WriteRegister,
	input [7:0] RegWriteData,
	//For ExtraCredit
	input [1:0] ShowData,
	output [7:0] ReadData1,
	output [7:0] ReadData2,
	//For ExtraCredit
	output [7:0] EC
    );
	
	reg [7:0] Register[0:3];
	
	initial begin
		Register[0] <= 8'b0;
		Register[1] <= 8'b0;
		Register[2] <= 8'b0;
		Register[3] <= 8'b0;
	end
	
	always@(posedge CLK or posedge Reset) begin
		if(Reset) begin
			Register[0] <= 8'b0;
			Register[1] <= 8'b0;
			Register[2] <= 8'b0;
			Register[3] <= 8'b0;
		end
		else begin 
			if(RegWrite) begin
				Register[WriteRegister] <= RegWriteData;
			end
		end
	end
	
	assign ReadData1 = Register[ReadRegister1];
	
	assign ReadData2 = Register[ReadRegister2];
	
	assign EC = Register[ShowData];
endmodule
