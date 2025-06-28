# HCF (GCD) Calculator in Verilog

This project implements a hardware-based solution for calculating the Highest Common Factor (HCF), also known as the Greatest Common Divisor (GCD), using Verilog. The design is split into a **datapath** and a **controller** based on a Finite State Machine (FSM).

## 🧩 Components

- **Datapath**: Handles register operations, MUX selection, subtraction, and comparison.
- **Controller (FSM)**: Drives control signals based on states and input conditions.
- **Testbench**: Validates the design using sample inputs.

## 🛠️ Modules Used

- `DATA_PATH.v`
- `CTRL_PATH.v`
- `PIPO.v`
- `MUX.v`
- `CMP.v`
- `SUB.v`
- `testbench.v`

## 🔬 Simulation

Simulate using Icarus Verilog:

```sh
iverilog -o hcf.vvp *.v
vvp hcf.vvp
gtkwave dump.vcd
