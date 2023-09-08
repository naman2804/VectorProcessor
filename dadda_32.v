module dadda_32(
a,
b,
x
    );

input [31:0] a, b;
output [63:0] x;
  wire [31:0]y11,y12,y21,y22;
  wire [15:0] s1,s3,s5;
  wire ca1,ca2,ca3,ca4,ca5,ca6;

    dadda16bit d1(.a(a[15:0]),.b(b[15:0]),.x(y11));
    dadda16bit d2(.a(a[15:0]),.b(b[31:16]),.x(y12));
    dadda16bit d3(.a(a[31:16]),.b(b[15:0]),.x(y21));
    dadda16bit d4(.a(a[31:16]),.b(b[31:16]),.x(y22));
 
 assign x[15:0]=y11[15:0]; 
 //----------------------------------- 
 carry_look_ahead_16bit c1(
 .a(y11[31:16]),
 .b(y21[15:0]),
 .cin(1'b0),
 .sum(s1),
 .cout(ca1)
 ); 
 
  carry_look_ahead_16bit c2(
 .a(s1),
 .b(y12[15:0]),
 .cin(1'b0),
 .sum(x[31:16]),
 .cout(ca2)
 ); 
 //-------------------------------------------
  carry_look_ahead_16bit c3(
 .a(y12[31:16]),
 .b(y21[31:16]),
 .cin(ca1),
 .sum(s3),
 .cout(ca3)
 ); 
 
  carry_look_ahead_16bit c4(
 .a(s3),
 .b(y22[15:0]),
 .cin(ca2),
 .sum(x[47:32]),
 .cout(ca4)
 ); 
//---------------------------------------
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
assign w1=1'b0;
assign w2=1'b0;
assign w3=1'b0;
assign w4=1'b0;
assign w5=1'b0;
assign w6=1'b0;
assign w7=1'b0;
assign w8=1'b0;
assign w9=1'b0;
assign w10=1'b0;
assign w11=1'b0;
assign w12=1'b0;
assign w13=1'b0;
assign w14=1'b0;
assign w15=1'b0;




 carry_look_ahead_16bit c5(
.a(y22[31:16]),
.b({w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w5,ca4}),
.cin(ca3),
.sum(x[63:48]),
.cout(ca5)
);  

assign ca5=1'b0;
  
endmodule