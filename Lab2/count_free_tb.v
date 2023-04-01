`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2023 11:49:29
// Design Name: 
// Module Name: count_free_tb
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


module count_free_tb;
reg clock, reset, start_req_i, start_data_i, ready_i;
wire  result_rsp_o, busy_o;

reg [31:0] waiting_time;

count_free cnt(
    .clk (clock),
    .rst (reset),
    .start_req_i (start_req_i),
    .start_data_i (start_data_i),
    .ready_i (ready_i),
    .result_rsp_o (result_rsp_o),
    .busy_o (busy_o)
);

integer i, digits_number;
initial begin
    waiting_time = 6;
    i = 0;
    digits_number = 0;
    
    start_req_i = 0;
    start_data_i = 0;
    ready_i = 0;
    clock = 1;
    reset = 1;
    
    reset = 0;
    #5 clock = ~clock;
    reset = 1;
    #5 clock = ~clock;
    
    start_req_i = 1;
    
    while(waiting_time >> digits_number) begin
        digits_number = digits_number + 1;  
    end
    digits_number = digits_number - 1;
    
    while(digits_number >= 0) begin
        start_data_i = (waiting_time >> digits_number) & 1;
        $display("waiting_time[%d], %b", digits_number, start_data_i);
        digits_number = digits_number - 1;  
        #5 clock = ~clock;  
        #5 clock = ~clock;
    end
    start_req_i = 0;
    start_data_i = 0;
    
    for(i = 0; i < 12; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
    end
    
    ready_i = 1;
    #5 clock = ~clock;
    ready_i = 0;
    #5 clock = ~clock;
    
    
    // show idle state
    for(i = 14; i < 18; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;    
    end 
    $stop;
end
endmodule