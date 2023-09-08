module dadda8(
a,
b,
x
);

input [7:0] a, b;
output [15:0] x;
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20,s21,s22,s23,s61,s91;
wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20,c21,c22,c23,c24,c61,c91;
wire ca0, ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8,ca9,ca10,ca12,ca11,ca13,ca14,ca15,ca16,ca17,ca18,ca19,ca20,ca21,ca51;
reg [7:0] pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8;
wire [15:0] x1;
  
  always @* begin
    // 0th bit
    if (b[0] == 1)
      pp1[7:0] = a[7:0];
    else
      pp1[7:0] = 8'b00000000;
		
	if (b[1] == 1)
      pp2[7:0] = a[7:0];
    else
      pp2[7:0] = 8'b00000000;
	
		if (b[2] == 1)
      pp3[7:0] = a[7:0];
    else
      pp3[7:0] = 8'b00000000;
		
	if (b[3] == 1)
      pp4[7:0] = a[7:0];
    else
      pp4[7:0] = 8'b00000000;
		
	if (b[4] == 1)
      pp5[7:0] = a[7:0];
    else
      pp5[7:0] = 8'b00000000;
		
	
		
	if (b[5] == 1)
      pp6[7:0] = a[7:0];
    else
      pp6[7:0] = 8'b00000000;
		
	if (b[6] == 1)
      pp7[7:0] = a[7:0];
    else
      pp7[7:0] = 8'b00000000;
		
	if (b[7] == 1)
      pp8[7:0] = a[7:0];
    else
      pp8[7:0] = 8'b00000000;
		
		end
		
	 //assign z = {pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8};
	
	
	//stage one 
 HA h1(
      .a(pp1[4]),
      .b(pp2[3]),
      .sum(s0),
      .carry(c0)
    );
	 //0
compressor42 c41 (
.x1(pp1[5]),
.x2(pp2[4]),
.x3(pp3[3]),
.x4(1'd0),
.cin(c0),
.sum(s1),
.cout(ca1),
.carry(c1)
);//1


compressor42 c42 (
.x1(pp1[6]),
.x2(pp2[5]),
.x3(pp3[4]),
.x4(pp4[3]),
.cin(ca1),
.sum(s2),
.cout(ca2),
.carry(c2)
);//2
	 
 HA h2(
      .a(pp5[2]),
      .b(pp6[1]),
      .sum(s3),
      .carry(c3)
    );//3
	 
compressor42 c43 (
.x1(pp1[7]),
.x2(pp2[6]),
.x3(pp3[5]),
.x4(pp4[4]),
.cin(ca2),
.sum(s4),
.cout(ca3),
.carry(c4)
);//4

compressor42 c44 (
.x1(pp5[3]),
.x2(pp6[2]),
.x3(pp7[1]),
.x4(1'd0),
.cin(c3),
.sum(s5),
.cout(ca4),
.carry(c5)
);
//5

compressor42 c45 (
.x1(pp2[7]),
.x2(pp3[6]),
.x3(pp4[5]),
.x4(pp5[4]),
.cin(ca3),
.sum(s6),
.cout(ca5),
.carry(c6)
);//6

compressor42 c4543 (
.x1(pp6[3]),
.x2(pp7[2]),
.x3(pp8[1]),
.x4(1'd0),
.cin(ca4),
.sum(s61),
.cout(ca51),
.carry(c61)
);//7  /// 

compressor42 c46 (
.x1(pp3[7]),
.x2(pp4[6]),
.x3(pp5[5]),
.x4(pp6[4]),
.cin(ca5),
.sum(s8),
.cout(ca6),
.carry(c8)
);


FA f44(
      .a(pp7[3]),
      .b(pp8[2]),
		.c(ca51),
      .sum(s9),
      .cin(c9)
    );
	 
compressor42 c47 (
.x1(pp4[7]),
.x2(pp5[6]),
.x3(pp6[5]),
.x4(pp7[4]),
.cin(ca6),
.sum(s10),
.cout(ca7),
.carry(c10)
);
	 

	FA f55(
      .a(pp5[7]),
      .b(pp6[6]),
		.c(ca7),
      .sum(s91),
      .cin(c91)
    ); 

	 
 
//---------------------------


HA h5(
      .a(pp1[2]),
      .b(pp2[1]),
      .sum(s12),
      .carry(c12)
    );


compressor42 c48 (
.x1(pp1[3]),
.x2(pp2[2]),
.x3(pp3[1]),
.x4(pp4[0]),
.cin(c12),
.sum(s13),
.cout(ca8),
.carry(c13)
);


compressor42 c49 (
.x2(pp3[2]),
.x3(pp4[1]),
.x4(pp5[0]),
.x1(s0),
.cin(ca8),
.sum(s14),
.cout(ca9),
.carry(c14)
);
//-------

compressor42 c410 (
.x1(s1),
.x2(pp4[2]),
.x3(pp5[1]),
.x4(pp6[0]),
.cin(ca9),
.sum(s15),
.cout(ca10),
.carry(c15)
);


compressor42 c411 (
.x1(s2),
.x2(c1),
.x3(s3),
.x4(pp7[0]),
.cin(ca10),
.sum(s16),
.cout(ca11),
.carry(c16)
);


compressor42 c412 (
.x1(s4),
.x2(c2),
.x3(s5),
.x4(pp8[0]),
.cin(ca11),
.sum(s17),
.cout(ca12),
.carry(c17)
);


compressor42 c413 (
.x1(s6),
.x2(c4),
.x3(s61),
.x4(c5),
.cin(ca12),
.sum(s18),
.cout(ca13),
.carry(c18)
);


compressor42 c414 (
.x1(s8),
.x2(c6),
.x3(s9),
.x4(c61),
.cin(ca13),
.sum(s19),
.cout(ca14),
.carry(c19)
);

compressor42 c415 (
.x1(s10),
.x2(c8),
.x3(c9),
.x4(pp8[3]),
.cin(ca14),
.sum(s20),
.cout(ca15),
.carry(c20)
);
//
compressor42 c416 (
.x1(s91),
.x2(c10),
.x3(pp7[5]),
.x4(pp8[4]),
.cin(ca15),
.sum(s21),
.cout(ca16),
.carry(c21)
);
//

compressor42 c417 (
.x1(c91),
.x2(pp6[7]),
.x3(pp7[6]),
.x4(pp8[5]),
.cin(ca16),
.sum(s22),
.cout(ca17),
.carry(c22)
);
	
FA F666(
      .a(pp7[7]),
      .b(pp8[6]),
		.c(ca17),
      .sum(s23),
      .cin(c23)
    );

//assign x[15:0] = {pp8[7],s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12   ,pp1[1],pp1[0]} + {c23   ,c22,c21,c20,c19,c18,c17,c16,c15,c14,c13,1'd0, pp3[0],pp2[0], 1'd0} ;

wire w1,w2,w3,w4;
assign w1 = 1'b0;
assign w2 = 1'b0;
assign w3 = 1'b0;
assign w4 = 1'b0;

	carry_look_ahead_16bit  cla1(
.a({w1,pp8[7],s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,pp1[1],pp1[0]}),
.b({w2,c23,c22,c21,c20,c19,c18,c17,c16,c15,c14,c13,w3,pp3[0],pp2[0],w4}),
.cin(1'd0),
 .sum(x),
 .cout(c24)	
		
);

endmodule
