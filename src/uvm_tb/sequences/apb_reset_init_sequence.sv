class apb_reset_init_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_reset_init_sequence);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_reset_init_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    //  `uvm_info ("APB_RESET_INIT_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
     repeat(5) begin
     `uvm_do_with (req, { PRESETn == 1'b0;})
    //  `uvm_info ("APB_RESET_INIT_SEQ", $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
   end
   endtask 
 
endclass
