all: obj_dir build

verilog_files := $(wildcard *.v)
test_bench_files := $(wildcard *.cpp)
obj_build_file := $(patsubst  %.v, V%.mk, $(verilog_files))
build_target := $(patsubst  %.v, V%, $(verilog_files))

obj_dir: $(verilog_files) $(test_bench_files)
	verilator --cc $(verilog_files);
	verilator -Wall --trace -cc $(verilog_files) --exe $(test_bench_files);

build: obj_dir
	make -C obj_dir -f $(obj_build_file) $(build_target); 

.PHONY: clean

clean:
	rm -rf obj_dir