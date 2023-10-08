all: verilate build

verilog_files := $(wildcard *.v)
verilog_top_file := $(wildcard *_top.v)
cpp_files := $(wildcard *.cpp)

build_top_file := $(patsubst  %_top.v, V%_top.mk, $(verilog_top_file))
build_top_target := $(patsubst  %_top.v, V%_top, $(verilog_top_file))

VERILATED_FILES := $(patsubst  %.v, obj_dir/V%.h, $(verilog_files))

obj_dir/V%.h: %.v
	verilator -Wall --trace --cc $^

verilate: $(VERILATED_FILES)

obj_dir: $(verilog_files) $(test_bench_files)
	verilator -Wall --trace --cc --exe $(test_bench_files);

build: obj_dir
	make -C obj_dir -f $(build_top_file) $(build_top_target); 

.PHONY: clean

clean:
	rm -rf obj_dir