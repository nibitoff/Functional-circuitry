`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 12:50:57
// Design Name: 
// Module Name: lru_switch_buffer_tb
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


module lru_switch_buffer_tb;

reg clock, reset, valid_data_in;
reg [1:0] sw_in;
reg [7:0] data_in;
wire[7:0] out;

lru_switch_buffer lru(
    .clk (clock),
    .rst (reset),
    .valid_data(valid_data_in),
    .data(data_in),
    .sw(sw_in),
    .out(out)
);

integer i, j, out0, out1, out2, out3;
integer test_sequence[0:20];
initial begin
    test_sequence[0] = 4;
    test_sequence[1] = 5;
    test_sequence[2] = 1;
    test_sequence[3] = 2;
    test_sequence[4] = 3;
    test_sequence[5] = 4;
    test_sequence[6] = 5;
    test_sequence[7] = 3;
    test_sequence[8] = 4;
    test_sequence[9] = 5;
    test_sequence[10] = 7;
    test_sequence[11] = 8;
    
    i = 0;
    j = 0;
    clock = 0;
    reset = 1;
    valid_data_in = 0;
    sw_in = 2'd0;
    
    #5 reset = 0;
    #5 reset = 1;
    
    for( j = 0; j < 12; j = j + 1) begin 
        data_in = test_sequence[j];
        #5 clock = ~clock;
        valid_data_in = 1;
        #5 clock = ~clock;
        valid_data_in = 0;
        
        for (i = 0 ; i < 15; i = i + 1) begin
            #5 clock = ~clock;
            #5 clock = ~clock;
        end
        
        #5 clock = ~clock;
        sw_in = 2'd0;
        #5 clock = ~clock;
        out0 = out;
        
        #5 clock = ~clock;
        sw_in = 2'd1;
        #5 clock = ~clock;
        out1 = out;
        
        #5 clock = ~clock;
        sw_in = 2'd2;
        #5 clock = ~clock;
        out2 = out;
        
        #5 clock = ~clock;
        sw_in = 2'd3;
        #5 clock = ~clock;
        out3 = out;
        
        $display("inserted %d, out = [%d, %d, %d, %d]", test_sequence[j], out0, out1, out2, out3);
    end
    $stop;
end
endmodule