module ctrl_unit(input [5:0]opcode,
					  output wire [2:0]ALUOp,
					  output wire RegDst, Jump, 
					  Branch, MemRead, MemtoReg,
					  MemWrite, ALUSrc, RegWrite);

reg [10:0]ctrl_out;					  
		  

assign Jump 		= [10]ctrl_out;
assign Branch 		= [9]ctrl_out;
assign RegDst 		= [8]ctrl_out;
assign RegWrite 	= [7]ctrl_out;
assign MemRead 	= [6]ctrl_out;
assign MemtoReg 	= [5]ctrl_out;
assign MemWrite 	= [4]ctrl_out;
assign ALUSrc 		= [3]ctrl_out;
assign ALUOp		= [2:0]ctrl_out;


always@(*)
	begin
		case(opcode)						      //19 instructions so far
			0:  ctrl_out = 11'b001_1000_0100; //R type	OK
			2:  ctrl_out = 11'b1XX_00X0_XXXX; //j
			3:  ctrl_out = 11'b000_0000_0000; //jal
			4:  ctrl_out = 11'b01X_00X0_0110; //beq		OK
			5:  ctrl_out = 11'b010_0000_0000; //bne
			6:  ctrl_out = 11'b010_0000_0000; //blez
			7:  ctrl_out = 11'b010_0000_0000; //bgtz
			8:  ctrl_out = 11'b000_0000_0000; //addi
			9:  ctrl_out = 11'b000_0000_0000; //addiu
			10: ctrl_out = 11'b000_0000_0000; //slti
			11: ctrl_out = 11'b000_0000_0000; //sltiu
			12: ctrl_out = 11'b000_0000_0000; //andi
			13: ctrl_out = 11'b000_1000_1001; //ori		OK
			14: ctrl_out = 11'b000_0000_0000; //xori
			15: ctrl_out = 11'b000_0000_0000; //lui
			32: ctrl_out = 11'b000_0000_0000; //lb
			35: ctrl_out = 11'b000_1110_1010; //lw			OK
			40: ctrl_out = 11'b000-0000_0000; //sb
			43: ctrl_out = 11'b00X_00X1_1010; //sw			OK
		endcase
	end

endmodule 

//control word:
//Jump Branch RegDst _ RegWrite MemRead MemtoReg MemWrite _ ALUSrc ALUOp2 ALUOp1 ALUOp0

/*OP CODES:

0: R TYPE
2: j
3: jal
4: beq
5: bne
6: blez
7: bgtz
8: addi
9: addiu
10: slti
11: sltiu
12: andi
13: ori
14: xori
15: lui
32: lb
33: lh
34: lwl
35: lw
36: lbu
37: lhu
38: lwr
40: sb
41: sh
42: swl
43: sw
46: swr
47: cache
48: ll
49: lwc1
50: lwc2
51: pref
53: ldc1
54: ldc2
56: sc
57: swc1
58: swc2
61: sdc1
62: sdc2


*/