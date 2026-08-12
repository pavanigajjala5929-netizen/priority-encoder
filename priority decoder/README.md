# Priority Decoder

## Overview

A Priority Decoder is a combinational digital circuit that gives priority to the highest-priority active input and generates the corresponding binary output.

This project implements a **4-to-2 Priority Decoder** using Verilog HDL.

## Priority

The priority order is:

**D3 > D2 > D1 > D0**

If more than one input is HIGH, the output represents the input with the highest priority.

## Truth Table

| D3 | D2 | D1 | D0 | Y1 | Y0 | Valid |
| -- | -- | -- | -- | -- | -- | ----- |
| 0  | 0  | 0  | 0  | 0  | 0  | 0     |
| 0  | 0  | 0  | 1  | 0  | 0  | 1     |
| 0  | 0  | 1  | X  | 0  | 1  | 1     |
| 0  | 1  | X  | X  | 1  | 0  | 1     |
| 1  | X  | X  | X  | 1  | 1  | 1     |

## Files

* `README.md` – Project documentation
* `priority_decoder.v` – Verilog design code
* `priority_decoder_tb.v` – Verilog testbench
* `simulation/waveform.png` – Simulation waveform

## Working

The circuit checks the inputs from the highest priority (`D3`) to the lowest priority (`D0`).

* If `D3 = 1`, output is `11`.
* Otherwise, if `D2 = 1`, output is `10`.
* Otherwise, if `D1 = 1`, output is `01`.
* Otherwise, if `D0 = 1`, output is `00`.
* If all inputs are `0`, the Valid output becomes `0`.

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## Simulation

Compile the design and testbench using:

```bash
iverilog -o priority_decoder_sim priority_decoder.v priority_decoder_tb.v
```

Run the simulation:

```bash
vvp priority_decoder_sim
```

To view the waveform:

```bash
gtkwave priority_decoder.vcd
```





