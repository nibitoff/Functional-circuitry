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

count_free cnt(
    .clk (clock),
    .rst (reset),
    .start_req_i (start_req_i),
    .start_data_i (start_data_i),
    .ready_i (ready_i),
    .result_rsp_o (result_rsp_o),
    .busy_o (busy_o)
);

integer i;
initial begin
    //load_value = 69;
    i = 0;
    start_req_i = 0;
    start_data_i = 0;
    ready_i = 0;
    clock = 1;
    reset = 1;        
   
//    reset = 1;
    #5 clock = ~clock;
    #5 clock = ~clock;
    reset = 0;

    //load = 1;
    for (i = 0 ; i < 2 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
    end

    start_req_i = 1;

    for (i = 0 ; i < 2 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
    end
      start_req_i = 0;

    
    for (i = 0 ; i < 7 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
      start_req_i = 1;

 for (i = 0 ; i < 3 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
     end
      start_req_i = 0;

    i = 0; 
    reset = 1;
    #5 clock = ~clock;
    #5 clock = ~clock;
    reset = 0;

    //load_value = 77;
    //load = 1;
    #5 clock = ~clock;
    //load = 0;
    #5 clock = ~clock;
    
    for (i = 0 ; i < 10 ; i = i + 1) begin
        #5 clock = ~clock;
        #5 clock = ~clock;
        end
        
    
    $stop;
end
endmodule