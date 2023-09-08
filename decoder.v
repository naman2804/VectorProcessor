module decoder(
inst,
rs1,
rs2,
rd,
reg_wrt,
rst,
clk,
alu_control);

input [31:0] inst;
input rst,clk;
output reg [4:0] rs1,rs2,rd;
output reg [3:0] alu_control;
output reg reg_wrt;

always @ (posedge clk) 
begin
  if(rst==1'b0) begin
  rs1<= inst[19:15] ;
  rs2 <= inst[24:20];
  rd<= inst[11:7];
  alu_control<=inst[3:0];
  reg_wrt<=1'b1;
  
  end
  else begin
   rs1<= 5'b0 ;
  rs2 <= 5'b0;
  rd<= 5'b0;
  alu_control<=4'b0;
  end
  
end

endmodule

