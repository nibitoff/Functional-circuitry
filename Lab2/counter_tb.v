`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 10:59:46
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;

reg clock, reset, enable;
wire[31:0] cnt_out;

counter cnt(
    .clk (clock),
    .rst (reset),
    .out (cnt_out),
    .en (enable)
);

integer i;
initial begin
    i = 0;
    enable = 1;
    clock = 1;
    reset = 0;
    #5 reset = 1;
    for (i = 0 ; i < 20 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
        
    enable = 0;
    for (i = 20 ; i < 40 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
    
    enable = 1;    
    for (i = 40 ; i < 46 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
        
    reset = 0;
    #5 clock = ~clock;
    reset = 1;
    #5 clock = ~clock;
    for (i = 47 ; i < 56 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
    $stop;
end

endmodule
