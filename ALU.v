module ALU(input wire clk,
			  input wire [2:0]control,
			  input wire [7:0] A, B,
			  output reg [7:0]result);
			
	always@(posedge clk)
			begin
				case(control)
					3'd0: result <= A & B;
					3'd1: result <= A | B;
					3'd2: result <= A + B;
					3'd6: result <= A + ~B + 1;
					3'd7: result <= (A < B)? 1:0;
				endcase
			end			  
			  
endmodule
