`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:19 06/02/2021 
// Design Name: 
// Module Name:    MP_main 
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
module MP_main(
	input Reset,
	input Oscillator,
	//For ExtraCredit
	input [1:0]ShowData,
	input [7:0]instruction,
	output [7:0]PC,
	output [6:0]seg1,
	output [6:0]seg2,
	//For ExtraCredit
	output [6:0]seg3,
	output [6:0]seg4
    );
	wire [7:0]instruction;
	wire [7:0]PC;
	 
	wire [7:0]Control;
	wire [1:0]WriteRegister;
	wire [7:0]RegWriteData;
	wire [7:0]ReadData;
	wire [7:0]ReadData1;
	wire [7:0]ReadData2;
	wire [7:0]ExtendedValue;
	wire [7:0]ALUInput;
	wire [7:0]ALUOutput;
	wire [7:0]PCp1;
	wire [7:0]AdderOutput;
	wire [7:0]nextPC;
	wire CLK;
	reg [7:0]pc_;
	//For ExtraCredit
	wire [7:0]EC;
	
	Control_Unit T0(instruction[7:6], Control);
	
	assign WriteRegister = (Control[7] == 0) ? instruction[3:2] : instruction[1:0];
	
	Register_Unit T1(Reset, Oscillator, Control[6], instruction[5:4], instruction[3:2], WriteRegister, RegWriteData, ShowData, ReadData1, ReadData2, EC);
	 
	Sign_Extender T2(instruction[1:0], ExtendedValue);
	
	assign ALUInput = (Control[5] == 0) ? ReadData2 : ExtendedValue;
	
	//ALU_Unit
	adder8 A0(ReadData1, ALUInput, ALUOutput);

	assign RegWriteData = (Control[1] == 0) ? ALUOutput : ReadData;
	
	adder8 A1(8'b00000001, pc_, PCp1);
	adder8 A2(PCp1, ExtendedValue, AdderOutput);
	assign nextPC = (Control[4] == 0) ? PCp1 : AdderOutput;
	
	Data_Memory T3(Reset, Oscillator, ALUOutput, ReadData2, Control[2], Control[3], ReadData);
	
	Frequency_Devider T4(Oscillator, Reset, CLK);
	always@(posedge CLK or posedge Reset) begin
		if(Reset == 1) begin
			pc_ = 8'b00000000;
		end
		else begin
			pc_ = nextPC;
		end
	end
	assign PC = pc_;
	
	hexa_to_7 T5(Control[6], RegWriteData[7:4], seg1);
	hexa_to_7 T6(Control[6], RegWriteData[3:0], seg2);
	
	//Instruction_Memory IM(PC, instruction);
	
	//For ExtraCredit
	hexa_to_7 T7(1, EC[7:4], seg3);
	hexa_to_7 T8(1, EC[3:0], seg4);
	
endmodule
