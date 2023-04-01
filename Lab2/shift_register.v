`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 21:45:19
// Design Name: 
// Module Name: shift_register
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


module shift_register(
    input clk,
    input reset,
    input enable,
    input load,
    input [31:0] load_value,
    output s_out
);
reg [31:0] shiftreg_value;
wire [31:0] shifted_val_next;
assign shifted_val_next = (load) ? load_value : shiftreg_value >> 1;
always @(posedge clk, posedge reset) begin
    if (reset) 
        shiftreg_value <= 31'b0;
    else if (enable) begin
        shiftreg_value <= shifted_val_next;
    end
end
assign s_out = shiftreg_value[0];
endmodule
