module FA (
a,
b,
c,
sum,
cin
);
input a;
input b,c;

output sum,cin;

wire w1;
wire w2,w3;
xor(w1 , a,b);
xor(sum,w1,c);
and (w2,a,b);
and(w3,w1,c);
or(cin,w3,w2);
// cout = ab +(a^b)cin
// cout = ab + (abbar + abarb)cin



endmodule