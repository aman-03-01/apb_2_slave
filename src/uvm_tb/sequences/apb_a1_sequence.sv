class apb_a1_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_a1_sequence);
  apb_write_seq_item tr;

  function new(string name="apb_a1_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(2) begin
        `uvm_do(tr.req)
    end
  endtask
 
endclass

