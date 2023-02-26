`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2023 20:40:55
// Design Name: 
// Module Name: demux
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

module demux (
input s1 ,
input s2 ,
input f ,
output a,
output b,
output c,
output d
) ;
wire not_s1 , not_s2 , not_f, y1 , y2, not_y1, not_y2;

nor(not_f, f, f) ;

nor(y1, not_f, s1) ;
nor(not_y1, y1, y1) ;
nor(a, not_y1, s2) ;

nor(not_s2, s2, s2) ;
nor(b, not_y1, not_s2) ;

nor(not_s1, s1, s1) ;
nor(y2, not_f, not_s1) ;
nor(not_y2, y2, y2) ;
nor(c, not_y2, s2) ;

nor(d, not_y2, not_s2) ;
endmodule
