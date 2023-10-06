video_signal_generator: hvsync_generator.v tb_hvsync_generator.cpp
	verilator --cc hvsync_generator.v;
	verilator -Wall --trace -cc hvsync_generator.v --exe tb_hvsync_generator.cpp;
	make -C obj_dir -f Vhvsync_generator.mk Vhvsync_generator; 

.PHONY: clean

all:
	video_signal_generator

clean:
	rm -rf obj_dir