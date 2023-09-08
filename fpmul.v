module fpmul(
    input clk, rst,en,
    input [31:0] a, b,
    output reg [31:0] z
);

    wire [31:0] n1, n2;
    wire [23:0] ma, mb;
    wire [7:0] ea, eb;
    wire [63:0] product;
	 wire en1;
	 assign en1 = en+rst;
    assign n1 = a;
    assign n2 = b;
    assign ma = {1'b1, n1[22:0]};
    assign mb = {1'b1, n2[22:0]};
    assign ea = n1[30:23] - 127;
    assign eb = n2[30:23] - 127;

    dadda_32 d32(
        .a({8'd0, ma}),
        .b({8'd0, mb}),
        .x(product)
    );
	 

    always @(posedge clk or posedge rst) begin
       
		 if (rst) begin
            z[31] <= n1[31] ^ n2[31];
            z[30:23] <= 8'b00000000;
            z[22:0] <= 23'd0;
        end
        else if (product[47] && en) begin
            z[31] <= n1[31] ^ n2[31];
            z[30:23] <= ea + eb + 127 + 1; // bias + 1
            z[22:0] <= product[46:24];
        end
        else begin
            z[31] <= n1[31] ^ n2[31];
            z[30:23] <= ea + eb + 127;
            z[22:0] <= product[45:23];
        end
		  
    end

endmodule
