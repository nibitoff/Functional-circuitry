`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 11:43:05
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    input en,
    output reg[31:0] out);
    
    reg[31:0] cnt = 32'd0;
    wire[31:0] cnt_val_next;
    
    assign cnt_val_next = cnt + 1;
    
    always @ (posedge clk or negedge rst) begin
        if (! rst)
            cnt <= 0;
        else if (en)
            cnt <= cnt_val_next;
            
        if (en)
            out <= cnt;
        else
            out <= 0;
        end
endmodule
