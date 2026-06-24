# 16×16 Wallace Tree Multiplier in Verilog HDL

## Overview

This project implements a parameterized 16×16 Wallace Tree Multiplier using Verilog HDL. The design utilizes Carry Save Adders (CSA) for partial product reduction and a 32-bit Carry Lookahead Adder (CLA) for final addition.

## Features

* 16×16 Unsigned Multiplication
* Wallace Tree Reduction Architecture
* Parameterized CSA Design
* Hierarchical RTL Implementation
* Generate Loop Based Partial Product Generation
* 32-bit CLA Final Adder
* Verified using Icarus Verilog and GTKWave

## Architecture

Partial Product Generation → Multi-Stage Wallace Reduction Tree → CLA-32 Final Adder

## Modules

* full_adder.v
* csa_parameterized.v
* cla_4bit.v
* cla_16bit.v
* cla_32bit.v
* wallace_16x16.v
* tb_wallace_16x16.v

## Verification Results

| A     | B     | Product    |
| ----- | ----- | ---------- |
| 2     | 3     | 6          |
| 5     | 5     | 25         |
| 15    | 15    | 225        |
| 100   | 50    | 5000       |
| 255   | 255   | 65025      |
| 1000  | 1000  | 1000000    |
| 65535 | 65535 | 4294836225 |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Visual Studio Code

## Author

Faraaz Shaikh
B.Tech Electronics Engineering (VLSI Design & Technology)
