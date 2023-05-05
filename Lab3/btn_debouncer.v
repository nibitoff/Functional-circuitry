`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 16:26:18
// Design Name: 
// Module Name: btn_debouncer
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


module btn_debouncer
#(parameter WAIT_CLOCKS = 10_000_000)
    (
        input clk,
        input btn_i,
        output reg activated 
    );
    
    initial activated = 0;
    reg [$clog2(WAIT_CLOCKS+1)-1:0] cnt;
    
    always @(posedge clk) begin
        if (cnt == WAIT_CLOCKS) begin
            if (btn_i) begin
                if (!activated) begin
                    activated <= 1;
                end
            end else begin
                activated <= 0;
            end
            cnt <= 0;
        end else begin
            cnt <= cnt + 1;
        end
    end
endmodule
