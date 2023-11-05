`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// addsub4 u (.a(), .b(), .sign(), .ci(), .s(), .co());
// 4bit Adder_Subtractor (input [3:0] a, b, input sign, ci, output [3:0] s, output co) 
// sign = 0 : adder, 1 : subtractor
// tr : 276
// gate : 46
// FA 8 + XOR 6
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module addsub4(
    input [3:0] a,
    input [3:0] b,
    input sign, 
    input ci,
    output [3:0] s,
    output co
    );
    
    wire    [3:0] c, x, y, z;
    
    assign z = {{3{sign}}, ci ^ sign};
    
    fa u0 (.a(sign), .b(sign), .ci(z[0]), .co(x[0]), .s(c[0]));
    
    fa u2 (.a(x[0]), .b(y[0]), .ci(z[1]), .co(x[1]), .s(c[1]));
    fa u4 (.a(x[1]), .b(y[1]), .ci(z[2]), .co(x[2]), .s(c[2]));
    fa u6 (.a(x[2]), .b(y[2]), .ci(z[3]), .co(x[3]), .s(c[3]));
    
    fa u1 (.a(a[0]), .b(b[0] ^ sign), .ci(c[0]), .co(y[0]), .s(s[0]));
    fa u3 (.a(a[1]), .b(b[1] ^ sign), .ci(c[1]), .co(y[1]), .s(s[1]));
    fa u5 (.a(a[2]), .b(b[2] ^ sign), .ci(c[2]), .co(y[2]), .s(s[2]));
    fa u7 (.a(a[3]), .b(b[3] ^ sign), .ci(c[3]), .co(y[3]), .s(s[3]));
    
    assign co = x[3] ^ y[3];
   
endmodule
