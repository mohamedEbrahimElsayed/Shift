module shift(sclr,sset,shiftin,load,data,clk,en,aclr,aset,shiftout,q);
parameter LOAD_AVALUE=11;
parameter SHIFT_DIRECTION="LEFT";
parameter LOAD_SVALUE=14;
parameter SHIFT_WIDTH=4; 
input sclr,sset,shiftin,load,clk,en,aclr,aset;
input [SHIFT_WIDTH-1:0] data;
output shiftout;
output reg [SHIFT_WIDTH-1:0] q;

generate
	if(SHIFT_DIRECTION=="LEFT")begin
		always @(posedge clk or posedge aclr or posedge aset) begin
			if (aclr)
				q<= 'b0;
			else if (aset)
				q<= LOAD_AVALUE;
			else begin
				if(sclr)
					q<= 'b0;
				else if(sset)
					q<= LOAD_SVALUE;
				else if(en)begin
					if(load)
						q<=data;
					else
						q<= {q[SHIFT_WIDTH-2:0],shiftin};
				end
			end
		end
	end
else if(SHIFT_DIRECTION=="RIGHT")begin
always @(posedge clk or posedge aclr or posedge aset) begin
			if (aclr)
				q<= 'b0;
			else if (aset)
				q<= LOAD_AVALUE;
			else begin
				if(sclr)
					q<= 'b0;
				else if(sset)
					q<= LOAD_SVALUE;
				else if(en)begin
					if(load)
						q<=data;
					else
						q<= {shiftin,q[SHIFT_WIDTH-1:1]};
				end
			end
		end
	end
endgenerate
assign shiftout =q[SHIFT_WIDTH-1] ;
endmodule