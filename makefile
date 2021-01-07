run_test: build_test
	./obj_dir/Vsynth

build_test: copy_dependencies build_verilog synth.c wav.h
	cd obj_dir && make -f Vsynth.mk
	
build_verilog: synth.v pwm_gen.v sine_data.v
	verilator --cc synth.v --exe synth.c

copy_dependencies: output_folder sine.mem
	cp sine.mem ./obj_dir/sine.mem
	
output_folder:
	mkdir -p ./obj_dir


