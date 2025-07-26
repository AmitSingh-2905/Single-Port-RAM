# Single-Port RAM  – Verilog

This repository contains a simple Verilog implementation and simulation testbench for a **Single-Port RAM** with a 10-bit address space and 8-bit data width. It demonstrates how a memory block can be written to and read from synchronously using a single clock input.

## Project Structure


## Features

- Single-port RAM with synchronous read/write
- 10-bit address (supports 1024 memory locations)
- 8-bit data width
- Write-enable (`we`) support
- Simulation testbench included
- Generates `.vcd` file for waveform visualization

## Requirements

- [Icarus Verilog](http://iverilog.icarus.com/) or any Verilog simulator (e.g., ModelSim, Vivado)
- [GTKWave](http://gtkwave.sourceforge.net/) to view `.vcd` waveform output

## How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/Single-Port-RAM.git
cd Single-Port-RAM-main
