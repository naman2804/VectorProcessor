module ALU (
    input [31:0] in1,in2, 
    input[3:0] alu_control,
	input [95:0] A, B,
   output reg [159:0] conv_Result,
    output reg [31:0] alu_result,
    output reg zero_flag
	
);
//wire [31:0]y111;
reg mul_en,add_en;
always @(*) begin 
		case(alu_control)

        4'b0010: mul_en = 1 ;
        4'b0100: add_en = 1;
       4'b1000: conv_Result = y33;
     

        endcase
		  
		 end
  
  
 wire [31:0]y11;
	wire [31:0]y22;
	wire [159:0] y33;
	  parameter CLOCK_PERIOD = 50;
reg clk=0;
    reg rst = 0; 
    
always #((CLOCK_PERIOD) / 2) clk = ~clk;
	fpmul fp1(.a(in1),.b(in2),.z(y11),.clk(clk),.rst(rst),.en(mul_en));
	fpadd ap1(.a(in1),.b(in2),.clk(clk),.out(y22),.en(add_en));
Calculator c1(.A(A),.B(B),.clk(clk),.rst(rst),.Result(y33));
//assign y22=y111;
    always @(*)
    begin
        // Operating based on control input
        case(alu_control)

        4'b0010: alu_result = y11;
        4'b0100: alu_result = y22;
       4'b1000: conv_Result = y33;
     

        endcase

        // Setting Zero_flag if ALU_result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end
endmodule