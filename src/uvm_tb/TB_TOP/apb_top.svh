// UVM TESTBENCH APB_PROTOCOL 
// Header file: apb_top.svh
// Description: This file contains all the files dependant files in TB 

//RTL
//`include "../rtl/slave1.v"
//`include "../rtl/slave2.v"
//`include "../rtl/master.v"
//`include "../rtl/apbtop.v"

//UVM Lib
`include "uvm_macros.svh"
import uvm_pkg::*;

//TestBench
`include "../IF/apb_interface.sv"
`include "../sequences/apb_write_seq_item.sv"
`include "../sequences/apb_a1_sequence.sv"
`include "../agent/apb_a1_sequencer.sv"
`include "../agent/apb_a1_driver.sv"
//`include "../agent/apb_a1_monitor.sv"
//`include "../agent/apb_active_agent_a1.sv"
//`include "../agent/apb_a2_monitor.sv"
//`include "../agent/apb_passive_agent_a2.sv"
//`include "../env/apb_env.sv"
//`include "../env/apb_scoreboard.sv"
//`include "../env/apb_coverage.sv"
//`include "../tests/apb_test.sv"
//`include "../TB_TOP/apb_tb_top.sv"
