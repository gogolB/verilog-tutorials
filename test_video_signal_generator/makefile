all: obj_dir build

verilog_files := $(wildcard *.v)
cpp_files := $(wildcard *.cpp)

VERILATED_FILES := $(patsubst  %.v, obj_dir/V%.h, $(verilog_files))

obj_dir/V%.h: %.v
	verilator -Wall --trace --cc $^

verilate: $(VERILATED_FILES)

obj_dir:
	verilator -Wall --trace --cc --exe top.v $(cpp_files);

build: obj_dir
	make -C obj_dir -f Vtop.mk Vtop; 

.PHONY: clean

clean:
	rm -rf obj_dir