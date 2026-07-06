# Parameterized ALU in Verilog

## Overview

This project implements a reusable, parameterized Arithmetic Logic Unit (ALU) in Verilog HDL.

The ALU supports arithmetic, logical, comparison and shift operations while generating common processor status flags.

---

## Features

- Parameterized data width (8/16/32/64 bits)
- Arithmetic operations
- Logical operations
- Shift operations
- Comparison operations
- Carry Flag
- Overflow Flag
- Zero Flag
- Negative Flag
- Self-checking Testbench

---

## Folder Structure

```
rtl/
tb/
docs/
sim/
waveforms/
screenshots/
```

---

## Supported Operations

| Opcode | Operation |
|---------|-----------|
|0000|ADD|
|0001|SUB|
|0010|AND|
|0011|OR|
|0100|XOR|
|0101|NOT|
|0110|Shift Left|
|0111|Shift Right|
|1000|Equal Compare|
|1001|Signed Less Than|

---

## Simulation

Compile

```bash
iverilog -o alu_sim rtl/alu.v tb/alu_tb.v
```

Run

```bash
vvp alu_sim
```

View Waveform

```bash
gtkwave alu.vcd
```

---

## Project Structure

- rtl → RTL Design
- tb → Testbench
- docs → Specification
- sim → Simulation Script
- waveforms → GTKWave images

---

## Future Improvements

- Multiplication
- Division
- Rotate Left
- Rotate Right
- Arithmetic Shift
- Saturation Arithmetic

---

## Author

Gouri G Menon