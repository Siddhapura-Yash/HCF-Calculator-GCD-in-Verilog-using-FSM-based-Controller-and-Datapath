# HCF (GCD) Calculator in Verilog

This project implements the Highest Common Factor (HCF), also known as the Greatest Common Divisor (GCD), using Verilog. The design is based on a **controller-datapath architecture**.

## 🧩 Architecture Overview

- **Datapath**: Includes registers, multiplexers, comparator, and subtractor. It performs the core arithmetic operations.
- **Controller (FSM)**: A finite state machine that generates control signals to guide the datapath based on current conditions.
- **Testbench**: Provides test inputs to verify the functionality of the overall design.

## 📂 Project Structure

- `DATA_PATH.v` – Datapath logic module
- `CTRL_PATH.v` – FSM controller module
- `PIPO.v` – Parallel-In Parallel-Out register
- `MUX.v` – Multiplexer
- `CMP.v` – Comparator
- `SUB.v` – Subtractor
- `testbench.v` – Verilog testbench for verification

## 💡 Functionality

The system loads two numbers and repeatedly subtracts the smaller from the larger until both values are equal, which is then the HCF.
