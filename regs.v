module regs(input wire clk, wr_data, wr_en,
				input reg [1:0]wr_addr, reg_addr1, reg_addr2,
				input wire [31:0]data_in, 
				output [31:0]data_out1, data_out2);
	
	reg [31:0] register [3:0];
	
	reg [31:0] reg_data1, reg_data2;
	
	assign data_out1 = reg_data1;
	assign data_out2 = reg_data2;
	
	always@(posedge clk)
		begin
			if(wr_en)
				case(wr_addr)
					2'b00: register[0] <= data_in;
					2'b01: register[1] <= data_in;
					2'b10: register[2] <= data_in;
					2'b11: register[3] <= data_in;
				endcase
		end
	
	always(*)
		begin
			case(reg_addr1)
				2'd0: reg_data1 <= register[0];
				2'd1: reg_data1 <= register[1];
				2'd2: reg_data1 <= register[2];
				2'd3: reg_data1 <= register[3];
			endcase
			
			case(reg_addr2)
				2'd0: reg_data2 <= register[0];
				2'd1: reg_data2 <= register[1];
				2'd2: reg_data2 <= register[2];
				2'd3: reg_data2 <= register[3];
			endcase
		end
		
	
		
endmodule 