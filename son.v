module sonn
(
    input  clock,
    input  reset_n,
    input  rx,
	 output reg [15:0]hword
);

reg [1:0]count2;
wire [7:0]byte_data;

reg [31:0]wordd;
reg wready;
wire byte_ready;

always@(posedge clock)
if (wready)
hword={4'b0000,wordd[19:16],wordd[11:8],wordd[3:0]};

always @(posedge clock)
    if (! reset_n)
	     wordd <= 32'b0;
	  else if (byte_ready)
	     	case(count2)
			2'd0:begin 
				wready<=1'b0;
					if(byte_data==8'h52)
						count2<=2'd1;
					end
			2'd1:begin wordd[23:16]<=byte_data; count2<=2'd2;end
			2'd2:begin wordd[15:8]<=byte_data; count2<=2'd3;end
			2'd3:begin wordd[7:0]<=byte_data; count2<=2'd0;wready<=1'b1;end
			default begin 
				wready<=1'b0;
					if(byte_data==8'h52)
						count2<=count2+1'b1;
					end
			endcase
	
uart_receiver uart(clock,reset_n,rx,byte_data,byte_ready);
endmodule
