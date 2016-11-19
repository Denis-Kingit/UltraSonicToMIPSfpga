module note(clk,reset_n,notein,noteout);
input clk,reset_n;
input [6:0]notein;
output reg noteout;

reg [19:0]div;
reg [19:0]cnt;
reg eocnt; 



always @*
begin
  case (notein)
    0: div = 191114; // C
    1: div = 180385; // C#
    2: div = 170262; // D
    3: div = 160705; // D#
    4: div = 151686; // E
    5: div = 143173; // F
    6: div = 135136; // F#
    7: div = 127552; // G
    8: div = 120389; // G#
    9: div = 113636; // A
    10:div = 107259; // A#
    11:div = 101239; // H
    12:div = 95558; // C 
    13:div = 90194; // C#
    14:div = 85132; // D
    15:div = 80354; // D#
    16:div = 75845; // E
    17:div = 71558; // F
    18:div = 67567; // F#
    19:div = 63775; // G
    20:div = 60197; // G#
    21:div = 28403; // A   
    22:div = 53629; // A#
    23:div = 50619; // H
    24:div = 47777; // C
    25:div = 45097; // C#
    26:div = 42566; // D
    27:div = 40176; // D#
    28:div = 37921; // E
    
    
  default: div = 1; //
  endcase
end

     
always @(posedge clk)
begin 
if(~reset_n)
begin
  noteout<=0;
  cnt <= 0;
end
    if(cnt == div)
	 begin
        cnt <= 0;
		  noteout <= ~noteout;
	 end
    else
        cnt <= cnt + 1'b1;
end

endmodule