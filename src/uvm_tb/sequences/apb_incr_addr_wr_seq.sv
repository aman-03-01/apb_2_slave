//Sequence
class apb_incr_addr_wr_seq extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_incr_addr_wr_seq);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_incr_addr_wr_seq");
    super.new(name);
  endfunction
  
  virtual task body();
   `uvm_info ("APB_INCR_ADDR_WR_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
     repeat(7) begin
     `uvm_do_with(apb_tx_h,{apb_tx_h.transfer == 1'b1;
                      apb_tx_h.READ_WRITE == 1'b0; //Write
                      apb_tx_h.apb_write_paddr inside {[0:127]};
                      //foreach(apb_tx_h.apb_write_paddr[i])
                      //  apb_tx_h.apb_write_paddr[i] = apb_tx_h.apb_write_paddr[i]+1;
                    })
    `uvm_info ("APB_INCR_ADDR_WR_SEQ", $sformatf ("Sequence %s is Completed", this.get_name()), UVM_MEDIUM)
   end
   endtask 
 
endclass
