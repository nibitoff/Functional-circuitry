`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2023 21:41:38
// Design Name: 
// Module Name: demux_tb
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


module demux_tb;

reg s1_in , s2_in, f_in ;
wire a_out, b_out, c_out, d_out ;
demux demux_1 (
    . s1 (s1_in),
    . s2 (s2_in),
    . f (f_in),
    . a (a_out),
    . b (b_out),
    . c (c_out),
    . d (d_out)
) ;
integer i ;
reg [1:0] test_val ;
reg expected_val_a, expected_val_b, expected_val_c, expected_val_d ;
initial begin
f_in = 1;
for (i = 0 ; i < 4 ; i = i +1) begin
    test_val = i ;
    s1_in = test_val[1] ;
    s2_in = test_val[0] ;
    expected_val_a = f_in & !test_val[0] & !test_val[1];
    expected_val_b = f_in & test_val[0] & !test_val[1];
    expected_val_c = f_in & !test_val[0] & test_val[1];
    expected_val_d = f_in & test_val[0] & test_val[1];
    #10
    if (a_out == expected_val_a && b_out == expected_val_b && c_out == expected_val_c && d_out == expected_val_d) begin
        $display("The demux output is correct!!! s1_in=%b, s2_in=%b ,f_in=%b, a_out = %b, b_out = %b, c_out = %b, d_out = %b" ,s1_in ,s2_in ,f_in, a_out, b_out, c_out, d_out);
    end else begin
        $display("The demux output is wrong!!!") ;
    end
    end
    #10 $stop ;
end
endmodule
