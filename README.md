APB UVM Testbench

This project contains a Universal Verification Methodology (UVM) testbench for the Advanced Peripheral Bus (APB) protocol. The testbench is designed to verify an APB interface using industry-standard methodologies and verification techniques.

Features
UVM-Based Verification Environment: Implements a modular and reusable UVM testbench.
APB VIP (Verification IP): Includes APB driver, monitor, and scoreboard for protocol verification.
Constrained-Random Stimulus: Generates randomized transactions to validate APB protocol compliance.
Assertions & Coverage Metrics: Uses SystemVerilog assertions (SVA) and functional coverage for thorough validation.
Parameterized Configuration: Supports configurable APB interface parameters (e.g., address width, data width).
Automated Regression Setup: Integrates with simulation tools for scalable verification.
Structure
tb/ ? UVM testbench components (agent, driver, monitor, sequence, scoreboard).
tests/ ? Testcases for various APB scenarios.
sim/ ? Simulation scripts and configurations.
docs/ ? Project documentation and setup guidelines.
Getting Started
Clone the repository:
git clone <repo_url>
cd apb_uvm_testbench
Set up your verification environment (e.g., Questa, VCS, Xcelium).
Run the simulation:
make run TEST=<test_name>
Contributing
Contributions are welcome! Please follow the contribution guidelines in CONTRIBUTING.md.

