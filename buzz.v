module buzz(clk,reset_n,en,tim,tone);
input clk,reset_n,en;
input [1:0]tim;
output reg tone;

wire [6:0]notein;
wire noteout;
assign notein=21;

reg [27:0]counter,div,div1;
reg ene;

note note1(clk,reset_n,notein,noteout);

always@(posedge clk)
if(~reset_n)
begin
 counter<=28'b0;
 ene<=1'b0;
end
else
begin
  case(tim)
	0:begin div<=28'd 5_000_000; div1<=28'd 12_000_000; end
	1:begin div<=28'd 10_000_000; div1<=28'd 20_000_000; end
	2:begin div<=28'd 25_000_000; div1<=28'd 35_000_000; end
	3:begin div<=28'd 50_000_000; div1<=28'd 60_000_000; end
   default begin div<=28'd 10_000_000; div1<=28'd 20_000_000; end
  endcase
  
  counter<=counter+1;
  if(counter==div)
	 ene<=1'b1;
  if(counter==div1 | counter>60_000_000)
   begin
	 counter<=28'b0;
	 ene<=1'b0;
   end
end

always@(posedge clk)
tone<=en&noteout&ene;
endmodule