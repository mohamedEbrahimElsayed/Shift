module shift_tb();
parameter LOAD_AVALUE=11;
parameter SHIFT_DIRECTION="LEFT";
parameter LOAD_SVALUE=14;
parameter SHIFT_WIDTH=4;
reg sclr,sset,shiftin,load,clk,en,aclr,aset;
reg [SHIFT_WIDTH-1:0] data;
wire shiftout;
wire [SHIFT_WIDTH-1:0] q;

shift #(.LOAD_AVALUE(LOAD_AVALUE),.SHIFT_DIRECTION(SHIFT_DIRECTION),.LOAD_SVALUE(LOAD_SVALUE),.SHIFT_WIDTH(SHIFT_WIDTH)) dut(sclr,sset,shiftin,load,data,clk,en,aclr,aset,shiftout,q);

integer i=0;
initial begin
	clk=0;
	forever
	#1 clk=~clk;

end
initial begin
aclr=1;
aset=0;
sclr=0;
sset=0;
en=0;
load=0;
shiftin=0;
data=0;
#50;
aclr=0;
aset=1;
#50
sclr=1;
sset=0;
#50
sclr=0;
sset=1;
#50
aclr=0;
aset=0;
sclr=0;
sset=0;
load=1;
for(i=0;i<1000;i=i+1)begin
@(negedge clk);
data=$random;
end
load=0;
en=1;
for(i=0;i<1000;i=i+1)begin
@(negedge clk);
shiftin=$random;
end
for(i=0;i<1000;i=i+1)begin
@(negedge clk);
load=$random;
data=$random;
en=$random;
shiftin=$random;
end
#1 $stop;
end
endmodule

