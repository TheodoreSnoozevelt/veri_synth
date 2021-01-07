module sine_data(output reg [15:0] memory [1023:0]);
	reg [15:0] internal [1023:0];

initial begin
    $readmemh("sine.mem", internal);
	memory = internal;
end
endmodule