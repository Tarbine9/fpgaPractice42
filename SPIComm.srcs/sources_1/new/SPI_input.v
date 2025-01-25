`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2023 04:26:58 PM
// Design Name: 
// Module Name: SPI_input
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


module SPI_input(
    input [12:0] sw,
//    input [12:10]sw,
    input btnC,
    output [7:0] inMessage,
    output [2:0] inSelect, 
    output dataReady
    );
 
assign inMessage[7:0] = sw[7:0];
assign inSelect [2:0] = sw[12:10];
assign dataReady = btnC;
    
endmodule
