module shift_reg(clk,rst,load,load_value,po);
parameter SHIFT_DIRECTION="LEFT";
parameter SHIFT_AMOUNT=1;
input clk,rst,load;
input [7:0] load_value;
output reg [7:0] po;

generate
	if(SHIFT_DIRECTION=="LEFT")begin
	
		always @(posedge clk or posedge rst) begin
			if (rst)
				po<='b0;
		
			else if (load) 
				po<= load_value;
			else
				po<= po << SHIFT_AMOUNT;
		end
		end
	else if(SHIFT_DIRECTION=="RIGHT") begin
		always @(posedge clk or posedge rst) begin
			if (rst)
				po<='b0;
		
			else if (load) 
				po<= load_value;
			else
				po<= po >> SHIFT_AMOUNT;
		end
	end
endgenerate
endmodule