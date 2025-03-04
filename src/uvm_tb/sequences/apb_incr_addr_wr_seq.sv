//Sequence
class apb_incr_addr_wr_seq extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_incr_addr_wr_seq);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_incr_addr_wr_seq");
    super.new(name);
  endfunction
  
  virtual task body();
   `uvm_info ("APB_INCR_ADDR_WR_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
     repeat(1) begin
     `uvm_do (req)
    `uvm_info ("APB_INCR_ADDR_WR_SEQ", $sformatf ("Sequence %s is Completed", this.get_name()), UVM_MEDIUM)
   end
   endtask 
 
endclass
