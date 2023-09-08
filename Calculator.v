module Calculator(A,B,clk,rst,Result);

	input [95:0] A;
	input [95:0] B;
	input clk;
	input rst;
	output [159:0] Result;
	
//	wire [287:0] Result;
	wire [31:0] A1 [0:2][0:0];
	wire [31:0] B1 [0:0][0:2];
	wire [31:0] Res1 [0:2][0:2];
	wire [31:0]Resultf [0:4];  
	 
	
	  wire [31:0]y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31,y32,y33,y34,y35,y36,y37; 
	  wire [31:0]z11,z12,z13,z14,z15,z16,z17,z18,z19,z20,z21;
	  wire [31:0] a1,a2,a3,a4,a5;
	
	
		//We convert the 1D arrays into 2D
		assign	{A1[0][0],A1[1][0],A1[2][0]} = A;
		assign {B1[0][0],B1[0][1],B1[0][2]} = B;
		//assign {Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]} = 144'd0;
		
			
fpmul fp1(.a(A1[0][0]),.b(B1[0][0]),.z(Res1[0][0]),.clk(clk),.rst(rst));
fpmul fp4(.a(A1[0][0]),.b(B1[0][1]),.z(Res1[0][1]),.clk(clk),.rst(rst));
fpmul fp7(.a(A1[0][0]),.b(B1[0][2]),.z(Res1[0][2]),.clk(clk),.rst(rst));
fpmul fp10(.a(A1[1][0]),.b(B1[0][0]),.z(Res1[1][0]),.clk(clk),.rst(rst));
fpmul fp13(.a(A1[1][0]),.b(B1[0][1]),.z(Res1[1][1]),.clk(clk),.rst(rst));
fpmul fp16(.a(A1[1][0]),.b(B1[0][2]),.z(Res1[1][2]),.clk(clk),.rst(rst));
fpmul fp19(.a(A1[2][0]),.b(B1[0][0]),.z(Res1[2][0]),.clk(clk),.rst(rst));
fpmul fp22(.a(A1[2][0]),.b(B1[0][1]),.z(Res1[2][1]),.clk(clk),.rst(rst));
fpmul fp25(.a(A1[2][0]),.b(B1[0][2]),.z(Res1[2][2]),.clk(clk),.rst(rst));


//assign Result = {Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]};
//concolution
assign Resultf[0]=Res1[0][0];

fpadd ap19(.a(Res1[0][1]),.b(Res1[1][0]),.clk(clk),.out(Resultf[1]));

fpadd ap20(.a(Res1[0][2]),.b(Res1[2][0]),.clk(clk),.out(z21));
fpadd ap21(.a(Res1[1][1]),.b(z21),.clk(clk),.out(Resultf[2]));

fpadd ap22(.a(Res1[1][2]),.b(Res1[2][1]),.clk(clk),.out(Resultf[3]));

assign Resultf[4]=Res1[2][2];

assign Result={Resultf[0],Resultf[1],Resultf[2],Resultf[3],Resultf[4]};

endmodule