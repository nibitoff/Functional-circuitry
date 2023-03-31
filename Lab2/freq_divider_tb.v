`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 23:00:54
// Design Name: 
// Module Name: freq_divider_tb
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


module freq_divider_tb;

reg clock;
wire clock_out;

freq_divider fdiv(
    .clk (clock),
    .clk_out (clock_out)
);

integer i;
initial begin
    i = 0;
    clock = 1;
    for (i = 0 ; i < 100; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
    end
    $stop;
end
endmodule
