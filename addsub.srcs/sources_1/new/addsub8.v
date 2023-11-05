`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// addsub8 u (.a(), .b(), .sign(), .ci(), .s(), .co());
// 8bit Adder_Subtractor (input [7:0] a, b, input sign, ci, output [7:0] s, output co) 
// sign = 0 : adder, 1 : subtract
// tr : 552
// gate : 92
// 4bit Add/Sub : 2
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module addsub8(
    input [7:0] a,
    input [7:0] b,
    input sign,
    input ci,
    output [7:0] s,
    output co
    );
    
    wire c;
    
    addsub4 u0(.a(a[3:0]), .b(b[3:0]), .sign(sign), .ci(ci), .s(s[3:0]), .co(c));
    addsub4 u1(.a(a[7:4]), .b(b[7:4]), .sign(sign), .ci(c), .s(s[7:4]), .co(co));
    
endmodule

