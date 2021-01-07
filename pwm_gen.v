module pwm_gen(clk,reset,sig_in,pwm_out, convert);
 
parameter integer dwidth_g = 8;
input clk,reset;
input [dwidth_g-1:0] sig_in;
output reg pwm_out;
output convert;
 
reg [dwidth_g-1:0] cnt;
parameter cnt_max_c = 20'hFFFF;
 
always@(posedge clk)
    begin
if(reset == 1'b1)
    cnt <= 0;
else
      if(convert == 1'b1) 
      begin
            cnt <= 0;
      end
      else
         cnt <= cnt +1;
      if(cnt < sig_in)
        pwm_out <= 1'b1;
      else
        pwm_out <= 1'b0;
end 
  
//decode max counter value and output the pwm conversion start
assign convert = (cnt == cnt_max_c) ? 1'b1 : 1'b0;