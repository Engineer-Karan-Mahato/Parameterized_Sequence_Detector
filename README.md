# Parameterized Sequence Detector

## Overview

This project implements a parameterized sequence detector in Verilog. The detector monitors a serial input stream and asserts the output when a user-defined bit sequence is detected.

The design supports different sequence lengths and patterns through Verilog parameters, making it reusable for multiple applications.

## Features

* Parameterized sequence length
* Parameterized detection sequence
* Overlapping sequence detection
* Simple shift-register-based implementation

## Parameters

| Parameter   | Description             |
| ----------- | ----------------------- |
| `SEQ_LENGTH`| Length of the sequence  |
| `SEQUENCE`  | Sequence to be detected |

## Working Principle

1. Incoming serial data is shifted into a shift register.
2. After every clock cycle, the updated register contents are compared with the target sequence.
3. When a match occurs, the `detected` signal is asserted for one clock cycle.
4. The detector supports overlapping sequence detection.

Example:

Input Stream:

```
1011011
```

Sequence:

```
1011
```

Detected at multiple positions due to overlapping matches.

## Tools Used

* Verilog HDL
* Verilator
* GTKWave

## Author

Karan Kumar
