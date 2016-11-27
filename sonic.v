module sonic(clk,trig,reset_n,en,echo,out);
input clk,echo,reset_n,en;
output reg trig;
output reg[23:0]out;

reg [23:0]count;
reg [23:0]countp;


always@(posedge clk)
if(~reset_n)
begin
 countp<=24'b0;
 count<=24'b0;
end
else 

if(en)
begin
	countp<=countp+1'b1;
	if(countp==1)
	 trig<=1'b1;
	if(echo)
		count<=count+1'b1;	
	if(countp==501)
		trig<=1'b0;
	if(countp==2500001)
		begin
			if (count>1800001)			
				out<=24'hfff;
			else
				out<=count/24'd2900;// /50/58
			countp<=24'b0;
			count<=24'b0;
		end
end
endmodule					
 
