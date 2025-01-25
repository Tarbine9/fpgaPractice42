`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 07:32:27 PM
// Design Name: 
// Module Name: SPIM_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPIM_Test;
reg inCLK, MISO,dataReady;
reg [2:0] inSelect;
reg [7:0] inMessage;
wire outCLK, MOSI;
wire outSelect1, outSelect2, outSelect3;
SPI_master test(inCLK, inMessage, MISO, inSelect, dataReady, outCLK, MOSI,outSelect1, outSelect2, outSelect3);

always #10 inCLK<=!inCLK;
initial begin
inCLK =0;
inMessage=0;
MISO=0;
inSelect=0;
dataReady=0;



#5
inMessage='b11011001;
dataReady=1;
inSelect =1;
MISO=1;
#10
dataReady =0;
MISO=0;
#35
MISO=1;
#35
MISO=0;
#1000
$finish;

end
endmodule


