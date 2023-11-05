`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// addsub4_bC u (.a(), .b(), .ci(), .sign(), .s(), .co());
// 4bit Add/Sub with Carry in, Carry out (Behavioral) (input [3:0] a, b, input ci, sign, output [3:0] s, output co)
// sign = 1 : sub, = 0 : add
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module addsub4_B(
    input [3:0] a,
    input [3:0] b,
    input ci,
    input sign,
    output [3:0] s,
    output co
    );
    
    assign {co, s} = (sign==1'b0) ? (a + b + ci) : (a + (~b + sign) + (~ci + sign));
    
endmodule
