`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 16:20:10
// Design Name: 
// Module Name: button_controller
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


module button_controller(
    input rst_btn,
    input wr_en_btn,
    inout clock,
    output wire rst,
    output wire wr_en
    );
    
    btn_debouncer reset_btn(
        .clk(clock),
        .btn_i(rst_btn),
        .activated(rst)
    );
    
    btn_debouncer write_en_btn(
        .clk(clock),
        .btn_i(wr_en_btn),
        .activated(wr_en)
    );
    
endmodule
