`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 06:52:11 PM
// Design Name: 
// Module Name: SPI_Top
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


module SPI_Top(
    input [8:0] sw,// need to implement switches on board to act as input
    input btnC, clk, // clock input will be done with clock wizard
    output [6:0] seg, // 7seg display output
    output [3:0] an // ???
    );

 wire [7:0] inMessage, dataSend;
 // inMessage is input to SPI_master module. 
 // dataSend is SPI output Data sent to 7 seg display
 wire [1:0] inSelect;
 // inSelect is to select which 7 segment display that needs to be changed
 wire dataReady, MISO, MOSI, outCLK, inCLK, outSelect1, outSelect2, outSelect3;
 // dataReady is input from switches to SPI master to take current selected switchest as data
 // MISO Master input Slave Output. Communication to Master
 // MOSI Master Output Slave Input. Communication to Slave
 // inCLK is the clock Input from the system
 // outCLK is the clock output to the Slave device from the Master device
 // outSelect1 is the select for 100ths place digit
 // outSelect2 is the select for 10th place digit
 // outSelect3 is the select for 1st place digit

assign inCLK = clk; 
 
 SPI_input inputM(sw,btnC,inMessage,inSelect, dataReady);
 
 SPI_master master(inCLK, inMessage, MISO, inSelect, dataReady, outCLK, MOSI,outSelect1, outSelect2, outSelect3);
 
 SPI_Slave slave1(outCLK, MOSI, MISO, outSelect1, dataSend);
 SPI_Slave slave2(outCLK, MOSI, MISO, outSelect2, dataSend);
 SPI_Slave slave3(outCLK, MOSI, MISO, outSelect3, dataSend);
 
 //Will intergate at a different time.
 timedivisionmultiplexing disp(inCLK, dataSend, an, selcounter, seg);
 
 
    
endmodule
