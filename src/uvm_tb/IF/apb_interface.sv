interface apb_if(input logic PCLK,PRESETn);
  logic transfer;
  logic READ_WRITE;
  logic [8:0] apb_write_paddr;
  logic [7:0] apb_write_data;
  logic [8:0] apb_read_paddr;
  logic PSLVERR;
  logic [7:0] apb_read_data_out;

//Clocking blocks for driver
//Clocking blocks for Active Agent-monitor
//Clocking blocks for Passive Agent-monitor
//Modports For Driver
//Modports For Active Agent-monitor
//Modports For Passive Agent-monitor
endinterface

