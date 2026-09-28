module multiplier_8x8 (
    input  [7:0] a,
    input  [7:0] b,
    output [14:0] product
);

    // Individual input bits
    wire a0 = a[0];
    wire a1 = a[1];
    wire a2 = a[2];
    wire a3 = a[3];
    wire a4 = a[4];
    wire a5 = a[5];
    wire a6 = a[6];
    wire a7 = a[7];

    wire b0 = b[0];
    wire b1 = b[1];
    wire b2 = b[2];
    wire b3 = b[3];
    wire b4 = b[4];
    wire b5 = b[5];
    wire b6 = b[6];
    wire b7 = b[7];

    // Partial products
    wire p00, p10, p20, p30, p40, p50, p60, p70;
    wire p01, p11, p21, p31, p41, p51, p61, p71;
    wire p02, p12, p22, p32, p42, p52, p62, p72;
    wire p03, p13, p23, p33, p43, p53, p63, p73;
    wire p04, p14, p24, p34, p44, p54, p64, p74;
    wire p05, p15, p25, p35, p45, p55, p65, p75;
    wire p06, p16, p26, p36, p46, p56, p66, p76;
    wire p07, p17, p27, p37, p47, p57, p67, p77;

    // Partial product generation

    assign p00 = a0 & b0;
    assign p10 = a1 & b0;
    assign p20 = a2 & b0;
    assign p30 = a3 & b0;
    assign p40 = a4 & b0;
    assign p50 = a5 & b0;
    assign p60 = a6 & b0;
    assign p70 = a7 & b0;

    assign p01 = a0 & b1;
    assign p11 = a1 & b1;
    assign p21 = a2 & b1;
    assign p31 = a3 & b1;
    assign p41 = a4 & b1;
    assign p51 = a5 & b1;
    assign p61 = a6 & b1;
    assign p71 = a7 & b1;

    assign p02 = a0 & b2;
    assign p12 = a1 & b2;
    assign p22 = a2 & b2;
    assign p32 = a3 & b2;
    assign p42 = a4 & b2;
    assign p52 = a5 & b2;
    assign p62 = a6 & b2;
    assign p72 = a7 & b2;

    assign p03 = a0 & b3;
    assign p13 = a1 & b3;
    assign p23 = a2 & b3;
    assign p33 = a3 & b3;
    assign p43 = a4 & b3;
    assign p53 = a5 & b3;
    assign p63 = a6 & b3;
    assign p73 = a7 & b3;

    assign p04 = a0 & b4;
    assign p14 = a1 & b4;
    assign p24 = a2 & b4;
    assign p34 = a3 & b4;
    assign p44 = a4 & b4;
    assign p54 = a5 & b4;
    assign p64 = a6 & b4;
    assign p74 = a7 & b4;

    assign p05 = a0 & b5;
    assign p15 = a1 & b5;
    assign p25 = a2 & b5;
    assign p35 = a3 & b5;
    assign p45 = a4 & b5;
    assign p55 = a5 & b5;
    assign p65 = a6 & b5;
    assign p75 = a7 & b5;

    assign p06 = a0 & b6;
    assign p16 = a1 & b6;
    assign p26 = a2 & b6;
    assign p36 = a3 & b6;
    assign p46 = a4 & b6;
    assign p56 = a5 & b6;
    assign p66 = a6 & b6;
    assign p76 = a7 & b6;

    assign p07 = a0 & b7;
    assign p17 = a1 & b7;
    assign p27 = a2 & b7;
    assign p37 = a3 & b7;
    assign p47 = a4 & b7;
    assign p57 = a5 & b7;
    assign p67 = a6 & b7;
    assign p77 = a7 & b7;


 ////////////////////    Wallace Tree    ////////////////////
 // 8 stage
 Ha h0(p60,p51);
 Fa f1(p70,p61,p52);
 Ha h2(p43,p34);
 Fa f3(p71,p62,p53); 
 Ha h4(p44,p35); 
 Fa f5(p72,p63,p54); 
 // 6 stage 
Ha h6(p40,p31);
Fa f7(p50,p41,p32); 
Ha h8(p23,p14); 
Fa f9(s0,p42,p33); 
Fa f10(p74,p15,p06); 
Fa f11(c0,s1,s2); 
Fa f12(p25,p16,p07);
Fa f13(c1,c2,s3); 
Fa f14(s4,p26,p17);  
Fa f15(c3,c4,s5); 
Fa f16(p45,p36,p27); 
Fa f17(c5,p73,p64); 
Fa f18(p55,p46,p37);
Fa f19(p74,p65,p56); 
// 4 stage  
Ha h20(p30,p21);
Fa f21(s6,p22,p13); 
Fa f22(c6,s7,s8); 
Fa f23(c7,c8,s9); 
Fa f24(c9,c10,s11);
Fa f25(c11,c12,s13);
Fa f26(c13,c14,s15);
Fa f27(c15,c16,s17);
Fa f28(c17,c18,s19);
Fa f29(c19,p75,p66);
// 3 stage 
Ha h30(p20,p11);
Ha h31(s20,p12);
Fa f32(c20,s21,p04);
Fa f33(c21,s22,p05);
Fa f34(c22,s23,s10);
Fa f35(c23,s24,s12);
Fa f36(c24,s25,s14);
Fa f37(c25,s26,s16);
Fa f38(c26,s27,s18);
Fa f39(c26,s27,p47);
Fa f40(c28,s29,p57);
Fa f41(c29,p76,p67);
// 2 stage
Ha h42(p10,p01);
Fa f43(s30,p02,c42);
Fa f44(c30,s31,c43);
Fa f45(c31,s32,c44);
Fa f46(c32,s33,c45);
Fa f47(c33,s34,c46);
Fa f48(c34,s35,c47);
Fa f49(c35,s36,c48);
Fa f50(c36,s37,c49);
Fa f51(c37,s38,c50);
Fa f52(c38,s39,c51);
Fa f53(c39,s40,c52);
Fa f54(c40,p77,c53);
// result 
assign product[0]  = p00;
assign product[1]  = S42;
assign product[2]  = s34;
assign product[3]  = S44;
assign product[4]  = S45;
assign product[5]  = S46;
assign product[6]  = S47;
assign product[7]  = S48;
assign product[8]  = S49;
assign product[9]  = S50;
assign product[10] = S51;
assign product[11] = S52;
assign product[12] = S53;
assign product[13] = S54;
assign product[14] = c54;

endmodule

// Full Adder and half Adder Modules
module Fa(input a , input b , input cin , output s , output cout);
    assign s = a^b^cin;
    assign cout = a&b | b&cin | cin&a;
endmodule  


module Ha (input  a,input  b,output s ,output cout);

    assign s  = a ^ b;
    assign cout = a & b;

endmodule       










