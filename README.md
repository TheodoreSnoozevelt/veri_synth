# veri_synth
such sine, wow.

Given enough time and motivation, this might turn into a usable synthesizer module based on some FPGA evaluation board.

Right now, it's basically 
1) a sine oscillator with an input for the phase step.
2) a _synth_ module that chains two of them together to create a frequency moulated sine wave


## Usage
All the interesting stuff should be covered by `make`. Without any parameters, this should give you a brand new `output.wav` file that contains the horrible sounds the current version of the code produces.

Verify and build just the Verilog code with verilator using `make build_verilog`

Build the c++ test application using `make build_test`

## Requisites
It works on my machine.
- Windows 10
- WSL2 / Ubuntu 20.04
- verilator 4.028
- GNU Make 4.2.1
- g++ 9.3.0
