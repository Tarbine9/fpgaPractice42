`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 07:32:27 PM
// Design Name: 
// Module Name: SPIS_TEST
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


module SPIS_TEST;
reg inCLK, MOSI, inSelect;
wire MISO;

SPI_Slave testben(inCLK, MOSI, MISO, inSelect);
always #10 inCLK<=!inCLK;
initial begin

inCLK=0;
MOSI=0;
inSelect=0;
//MOSI == b'10111001
#5
inCLK=1;
inSelect=1;
MOSI=1;
#10
MOSI=0;
#20
MOSI=1;
#60
MOSI=0;
#40
MOSI=1;
#20
MOSI=0;
inSelect=0;
#1000

$finish;
end
endmodule
