module shift_reg_tb2();
parameter SHIFT_DIRECTION="RIGHT";
parameter SHIFT_AMOUNT=1;
reg clk,rst,load;
reg [7:0] load_value;
wire [7:0] po;

shift_reg #(.SHIFT_DIRECTION(SHIFT_DIRECTION),.SHIFT_AMOUNT(SHIFT_AMOUNT)) dut(clk,rst,load,load_value,po);

integer i=0;
initial begin
	clk=0;
	forever
	#1 clk=~clk;
end
initial begin
rst=1;
load=0;
load_value=0;
#50;
rst=0;
load=1;
load_value=9;
#50;
load=0;
#100;
for(i=0; i<1000; i=i+1)begin
load=$random;
load_value=$random;
@(negedge clk);
end
#1 $stop;
end
endmodule
