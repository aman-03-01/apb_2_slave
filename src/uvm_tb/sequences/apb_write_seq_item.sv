class apb_write_seq_item extends uvm_sequence_item;
  rand bit PRESETn;
  rand bit [8:0] apb_write_paddr ;
  rand bit [8:0] apb_read_paddr ;
  rand bit [7:0] apb_write_data;
  rand bit transfer;
  rand bit READ_WRITE;
  bit [7:0] apb_read_data_out;
  bit PSLVERR;
  
  `uvm_object_utils_begin(apb_write_seq_item)
  `uvm_field_int(PRESETn,UVM_ALL_ON)
  `uvm_field_int(PSLVERR,UVM_ALL_ON)
  `uvm_field_int(apb_read_data_out,UVM_ALL_ON)
  `uvm_field_int(transfer,UVM_ALL_ON);
  `uvm_field_int(READ_WRITE,UVM_ALL_ON);
  `uvm_field_int(apb_write_data,UVM_ALL_ON);
  `uvm_field_int(apb_write_paddr,UVM_ALL_ON);
  `uvm_field_int(apb_read_paddr,UVM_ALL_ON);
  `uvm_object_utils_end

  function new(string name="apb_write_seq_item");
    super.new(name);
  endfunction

 constraint Rd_Wr {READ_WRITE dist {1:=5};}
 constraint write_addr {apb_write_paddr inside {[0:0]};}
 constraint read_addr {apb_read_paddr inside {[0:0]};}
 constraint write_data {apb_write_data == 8'b10011001;}
endclass
