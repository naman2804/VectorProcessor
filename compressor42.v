module compressor42 (
x1,
x2,
x3,
x4,
cin,
sum,
cout,
carry
);

input x1,x2,x3,x4,cin;
output sum,cout,carry;
wire s1;


FA f1(.a(x1),
.b(x2),
.c(x3),
.cin(cout),
.sum(s1));

FA f2(.a(s1),
.b(x4),
.c(cin),
.cin(carry),
.sum(sum));


endmodule