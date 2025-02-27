interface apb_if;
  logic RESETn;
  logic transfer;
  logic READ_WRITE;
  logic [8:0] apb_write_paddr;
  logic [7:0] apb_write_data;
  logic [8:0]apb_read_paddr;
  logic PLSVERR;
  logic [7:0]apb_read_data_out;
endinterface;

