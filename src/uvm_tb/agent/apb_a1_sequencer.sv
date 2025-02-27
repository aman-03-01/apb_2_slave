class apb_a1_sequencer extends uvm_sequencer#(apb_write_seq_item);

 `uvm_component_utils(apb_a1_sequencer)

function new(input string_name = "apb_a1_sequencer",uvm_component parent);
  super.new(name,parent);
endfunction

endclass
