# Auto-detect your testbench file
TB_FILE := $(shell ls *_tb.v | head -n 1)
TOP_MODULE := $(basename $(TB_FILE))
VVP_FILE := $(TOP_MODULE).vvp

# Auto-detect VCD file from dumpfile (default = example.vcd)
VCD_FILE := $(shell grep -o '\".*\.vcd\"' $(TB_FILE) | tr -d '"')
VCD_FILE := $(if $(VCD_FILE),$(VCD_FILE),example.vcd)

# Default target
all: wave

compile:
	@echo "🔧 Compiling only $(TB_FILE) (contains \`include)..."
	iverilog -o $(VVP_FILE) $(TB_FILE)

run: compile
	@echo "🚀 Running simulation..."
	vvp $(VVP_FILE)

wave: run
	@echo "🌊 Opening GTKWave..."
	gtkwave $(VCD_FILE) &

clean:
	@echo "🧹 Cleaning up..."
	rm -f *.vvp *.vcd
