`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 21:48:58
// Design Name: 
// Module Name: shift_register_tb
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


module shift_register_tb;
reg clock, reset, enable, load;
reg [31:0] load_value;
wire cnt_out;

shift_register cnt(
    .clk (clock),
    .reset (reset),
    .s_out (cnt_out),
    .enable (enable),
    .load (load),
    .load_value (load_value)
);

integer i;
initial begin
    load_value = 32'hF0F0CCCC;
    i = 0;
    enable = 1;
    clock = 1;
    reset = 0;
    load = 0;
        
   
    reset = 1;
    #5 clock = ~clock;
    reset = 0;
    #5 clock = ~clock;

    load = 1;
    #5 clock = ~clock;
    load = 0;
    #5 clock = ~clock;
    
    for (i = 0 ; i < 32; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
    
    i = 0; 
    reset = 1;
    #5 clock = ~clock;
    reset = 0;
    #5 clock = ~clock;

    load_value = 32'hAAAAAAAA;
    load = 1;
    #5 clock = ~clock;
    load = 0;
    #5 clock = ~clock;
    
    for (i = 0 ; i < 32; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
        
    
    $stop;
end

endmodule
