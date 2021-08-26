module PC(input clk, rst,
			 output reg [31:0] pc_out);

always@(posedge clk)
	if(rst != 1'b0)
		pc_out = pc_out+32'd4;
 
			
endmodule 