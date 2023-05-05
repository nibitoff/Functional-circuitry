`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2023 19:49:40
// Design Name: 
// Module Name: freq_divider
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


module freq_div(input clk_in, output reg clk_out);
    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd200000;
    always @(posedge clk_in)
    begin
     counter <= counter + 28'd1;
     if(counter>=(DIVISOR-1))
      counter <= 28'd0;
     clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    end
endmodule