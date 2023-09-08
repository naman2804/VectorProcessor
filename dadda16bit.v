module dadda16bit(
a,
b,
x
    );

input [15:0] a, b;
output [31:0] x;
  wire [15:0]y11,y12,y21,y22;
  wire [7:0] s1,s3,s5;
  wire ca1,ca2,ca3,ca4,ca5,ca6;

    dadda8 d1(.a(a[7:0]),.b(b[7:0]),.x(y11));
    dadda8 d2(.a(a[7:0]),.b(b[15:8]),.x(y12));
    dadda8 d3(.a(a[15:8]),.b(b[7:0]),.x(y21));
    dadda8 d4(.a(a[15:8]),.b(b[15:8]),.x(y22));
 
 assign x[7:0]=y11[7:0]; 
 //----------------------------------- 
 carry_lookahead_adder_8 c1(
 .a(y11[15:8]),
 .b(y21[7:0]),
 .cin(1'b0),
 .sum(s1),
 .cout(ca1)
 ); 
 
  carry_lookahead_adder_8 c2(
 .a(s1),
 .b(y12[7:0]),
 .cin(1'b0),
 .sum(x[15:8]),
 .cout(ca2)
 ); 
 //-------------------------------------------
  carry_lookahead_adder_8 c3(
 .a(y12[15:8]),
 .b(y21[15:8]),
 .cin(ca1),
 .sum(s3),
 .cout(ca3)
 ); 
 
  carry_lookahead_adder_8 c4(
 .a(s3),
 .b(y22[7:0]),
 .cin(ca2),
 .sum(x[23:16]),
 .cout(ca4)
 ); 
//---------------------------------------
wire w1,w2,w3,w4,w5,w6,w7;
assign w1=1'b0;
assign w2=1'b0;
assign w3=1'b0;
assign w4=1'b0;
assign w5=1'b0;
assign w6=1'b0;
assign w7=1'b0;

 carry_lookahead_adder_8 c5(
.a(y22[15:8]),
.b({w1,w2,w3,w4,w5,w6,w7,ca4}),
.cin(ca3),
.sum(x[31:24]),
.cout(ca5)
);  

assign ca5=1'b0;
  
endmodule