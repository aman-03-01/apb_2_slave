class apb_a1_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_a1_sequence);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_a1_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(2) begin
     apb_tx_h= apb_write_seq_item::type_id::create(apb_tx_h);
     wait_for_grant();
     if(!apb_tx_h.randomize())
     `uvm_error("APB_WR_SEQ","Transaction could not be randomized");
     send_request(apb_tx_h);
     wait_for_item_done();
    end
  endtask
 
endclass

