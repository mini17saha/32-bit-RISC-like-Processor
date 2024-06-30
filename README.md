# 32-bit RISC-like Processor in Verilog

## Overview

This project involves designing and implementing a 32-bit RISC-like processor using Verilog. The processor follows the basic principles of Reduced Instruction Set Computing (RISC) architecture, featuring a simplified instruction set designed for efficient execution.

## Features

- **32-bit Data Path:** Handles 32-bit wide data for both instructions and data operations.
- **RISC Architecture:** Simplified instruction set for efficient processing.
- **ALU (Arithmetic Logic Unit):** Performs arithmetic and logical operations.
- **Registers:** General-purpose registers for storing intermediate data and instructions.
- **Control Unit:** Manages the execution of instructions by controlling the data path and the ALU.
- **Instruction Memory:** Stores the instructions to be executed by the processor.
- **Data Memory:** Stores data to be processed by the instructions.

## Prerequisites

Before running the project, ensure you have the following installed:

- Verilog simulator (e.g., ModelSim, Vivado, or any other Verilog-compatible simulator)
- Basic understanding of digital logic design and RISC architecture

## Project Structure


- `ALU.v`: Verilog module for the Arithmetic Logic Unit.
- `main2.v`: Verilog module for the Control Unit.
- `branch_mechanism.v`: Verilog module for the data path.
- `memory.v`: Verilog module for the Data Memory.
- `reg_mod.v`: Verilog module for the register file.
- `top_level.v`: Top-level Verilog module integrating all components.
- `mux.v`: Verilog module for 2 to 1 and 4 to 1 multiplexers.
- `sign_extend.v`: Verilog module for 15 to 32 bits and 16 to 32 bits sign extension.
- `CPU_FPGA.v`: Top-level Verilog module for simulation which takes 32 bits input.
- `Processor_tb.v`: Testbench for simulating and verifying the processor.
- `booth.txt`: Encoding for multiplication using booth algortihm.
- `gcd.txt`: Encoding for gcd algorithm.
- `controlsignals_doc.ods`: Control unit signals.


## Usage

### Simulation

1. Compile the Verilog source files and the testbench:
    ```bash
    vlog src/*.v testbench/Processor_tb.v
    ```

2. Run the simulation:
    ```bash
    vsim Processor_tb
    ```

3. View the waveforms and verify the functionality of the processor.

### Synthesis

1. Open your synthesis tool (e.g., Vivado).
2. Create a new project and add the Verilog source files from the `src/` directory.
3. Run synthesis to generate the hardware description.

## Project Details

### ALU (Arithmetic Logic Unit)

- Performs basic arithmetic operations (addition, subtraction) and logical operations (AND, OR, XOR).
- Supports immediate and register-to-register operations.

### Control Unit

- Decodes instructions and generates control signals for the data path and ALU.
- Manages the flow of data within the processor.

### Data Path

- Connects the ALU, registers, instruction memory, and data memory.
- Handles data transfer between different components of the processor.

### Data Memory

- Data Memory: Stores the data to be processed by the instructions.

### Registers

- A set of general-purpose registers for storing intermediate results and operands.


