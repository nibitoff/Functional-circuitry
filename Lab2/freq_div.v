`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 13:25:25
// Design Name: 
// Module Name: freq_div
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


module freq_div(
    input clk,
    output reg clk_out
    // output reg [3:0] deb
);

reg [2:0] counter = 3'b111;
reg signal = 0;

always @(posedge clk) begin
    counter = counter + 1;
    if (counter == 3'b101) begin // если прошло 10 периодов
        counter = 0; // сбросить счетчик
        signal = ~signal; // инвертировать выходной сигнал
    end
    clk_out = signal;
    // deb = counter;
end
endmodule
