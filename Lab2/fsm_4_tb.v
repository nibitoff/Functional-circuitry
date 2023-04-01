`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 21:26:20
// Design Name: 
// Module Name: fsm_4_tb
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

`define LAST_STATE 9 

module fsm_4_tb;

reg clock, reset, valid_data;
reg [31:0] A_in, B_in;
wire [35:0] result;

reg [31:0] expected_result;

fsm_4 fsm(
    .clk(clock),
    .reset(reset),
    .valid_data(valid_data),
    .A(A_in),
    .B(B_in),
    .result(result)
);

integer i;
initial begin
    i = 0;
    clock = 1;
    valid_data = 0;
    reset = 1;
    A_in = 3;
    B_in = 8;
    
    reset = 0;
    #5 clock = ~clock;
    reset = 1;
    #5 clock = ~clock;
    
    valid_data = 1;
    #5 clock = ~clock;
    valid_data = 0;
    #5 clock = ~clock;

    expected_result = ((A_in + B_in)*4 + B_in)/2 + (B_in/2 + A_in*4);
    
    for (i = 0 ; i < 15; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        if(i == `LAST_STATE)
            $display ("result on finish state: %d; expected: %d", result, expected_result);            
        end
    
    // show idle state
    for (i = 0; i < 10; i = i+1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
    end
    
    
    A_in = 32;
    B_in = 128;
    valid_data = 1;
    #5 clock = ~clock;
    valid_data = 0;
    #5 clock = ~clock;
    
    expected_result = ((A_in + B_in)*4 + B_in)/2 + (B_in/2 + A_in*4);
    
    for (i = 0 ; i < 15; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        if(i == `LAST_STATE)
            $display ("result on finish state: %d; expected: %d", result, expected_result);            
        end
    $stop;
end
endmodule
