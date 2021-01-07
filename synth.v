`include "oscillator.v"
`include "sine_data.v"

module synth (
	input clk,
	input reset,
	input [31:0] freq,
	output [9:0] index_out,
	output [15:0] sample);

wire [15:0] lfo_out;
reg [31:0] sin_phasestep;
reg [31:0] sin_phasestep_ok;
wire [31:0] themake;
wire [9:0] trash_index;

reg [15:0] sine_mem [1023:0];

oscillator lfo (
	.clk(clk),
	.reset(reset),
	.fcw(freq),
	.index_out(trash_index),
	.sample(lfo_out),
	.memory(sine_mem)
);

oscillator sin (
	.clk(clk),
	.reset(reset),
	.fcw(themake),
	.index_out(index_out),
	.sample(sample),
	.memory(sine_mem)
);

sine_data dat (
	.memory(sine_mem)
);

always@(posedge clk)
begin
	sin_phasestep <= {{16{1'b0}}, lfo_out};
	sin_phasestep_ok <= 32'b00000010000000000000000000000000 + (sin_phasestep << 8);
end

assign themake = sin_phasestep_ok;

endmodule