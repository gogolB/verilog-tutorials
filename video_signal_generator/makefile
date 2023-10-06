all: verilate build

verilate:
	verilator --cc hvsync_generator.v;
	verilator -Wall --trace -cc hvsync_generator.v --exe tb_hvsync_generator.cpp;

build:
	make -C obj_dir -f Vhvsync_generator.mk Vhvsync_generator; 

.PHONY: clean

clean:
	rm -rf obj_dir