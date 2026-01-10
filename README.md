RTL Digital Design & Computer Architecture Projects

This repository contains RTL-based digital design and computer architecture projects focused on processor internals, memory systems, and timing-critical hardware blocks.
The work emphasizes implementation-level understanding using Verilog, with attention to control logic, FSMs, dataflow, and correctness under timing constraints.

Key Projects
1) Direct-Mapped Cache (Verilog RTL)
Parameterized direct-mapped cache implementing tag/index/offset decoding
Valid and dirty bit management
FSM-based controller for hit/miss handling, write-back, and allocate operations
Focus on timing correctness and control logic
Testbench covers core cases; extensions in progress

2)Asynchronous FIFO (Clock Domain Crossing)
CDC-safe FIFO using Gray-coded read/write pointers
Multi-flop synchronizers for pointer transfer
Robust full and empty flag logic accounting for synchronization delays

3)Synchronous FIFO
FIFO buffer with pointer management and full/empty detection
Studied flow control and backpressure in pipeline-style systems

4)Line Buffer
RTL line buffer for streaming data
Designed for continuous data flow and pipeline-friendly timing
Datapath & Arithmetic Blocks

5)16-bit Booth multiplier synthesized and tested on Basys 3 FPGA
Experience with synthesis, clock constraints, and hardware validation

6)Barrel shifter

7)Structural adders: CLA (8-bit), Carry Skip (32-bit), Carry Select (32-bit)

Tools & Background
HDL: Verilog
Tools: Xilinx Vivado, GTKWave

Architecture Exposure: RISC-V (ISA, datapath, control, basic pipelining)

Coursework: Microprocessors (8085), ARM Cortex-M0+, embedded C, assembly, introductory RTOS
