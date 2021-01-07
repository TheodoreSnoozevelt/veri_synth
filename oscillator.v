module oscillator(
        input clk ,
        input reset,
		input [15:0] memory [1023:0],
        input [31:0] fcw,
        output [15:0] sample,
		output [9:0] index_out
		);
		
reg [31:0] acc;
wire [9:0] index;

always@(posedge clk)
begin
	if(reset == 1'b1)         
		acc <= 0; 
      
	acc <= acc + fcw;
end
 
assign index = acc[31:22];
assign index_out = index;
assign sample = memory[index];
endmodule