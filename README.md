
# Single-Cycle RISC-V Processor Design

A 32-bit single-cycle RISC-V processor implemented in Verilog HDL using Xilinx Vivado, focusing on datapath design, control logic, instruction execution, and functional verification.

## Overview

This project implements a single-cycle processor based on the RISC-V RV32I instruction set architecture (ISA). The design integrates essential datapath and control-path components to execute supported instructions within a single clock cycle.

The project aims to strengthen understanding of processor architecture, RTL design, digital systems, and simulation-based verification.

## Key Features

- 32-bit processor datapath
- Program Counter (PC)
- Instruction Memory
- Register File
- Arithmetic Logic Unit (ALU)
- Immediate Generator
- Instruction Decoder and Control Unit
- Data Memory
- Arithmetic and logical operations
- Load and store operations
- Conditional branches and jump instructions
- Functional verification using simulation and waveform analysis

## Architecture

The processor consists of the following major components:

| Component | Function |
|---|---|
| Program Counter | Holds the address of the current instruction |
| Instruction Memory | Supplies instructions to the processor |
| Register File | Stores and provides source operands |
| ALU | Performs arithmetic and logical operations |
| Immediate Generator | Extracts and extends instruction immediates |
| Control Unit | Generates control signals based on the instruction |
| Data Memory | Supports load and store operations |

## Instruction Support

The design targets the RV32I instruction set architecture.

Implemented instruction categories include:

- Arithmetic and logical instructions
- Load and store instructions
- Conditional branch instructions
- Jump instructions


## Tools and Technologies

- Verilog HDL
- Xilinx Vivado
- RTL simulation
- Testbench-based verification
- Waveform analysis


## Verification

Processor functionality is evaluated through testbenches and simulation waveforms.

Verification should cover:

- ALU operations and register write-back
- Instruction decoding and control signals
- Load and store operations
- Branch conditions and jump targets
- Program Counter updates
- Corner cases and invalid instruction handling, where implemented

Add screenshots of your actual simulation waveforms and test results to the repository.

## How to Run

1. Clone or download the repository.
2. Open Xilinx Vivado.
3. Create or open an RTL project.
4. Add the Verilog source files from `rtl/`.
5. Add the testbench files from `testbench/`.
6. Set the appropriate top module and simulation top.
7. Run behavioral simulation.
8. Inspect the waveforms and verify the expected results.

## Future Improvements

- Expand and verify complete RV32I instruction support.
- Develop automated self-checking testbenches.
- Compare execution results with a trusted RISC-V reference model.
- Synthesize the RTL and analyze area and timing reports.
- Explore FPGA implementation and hardware demonstrations.


---

This project is intended for educational and learning purposes.
