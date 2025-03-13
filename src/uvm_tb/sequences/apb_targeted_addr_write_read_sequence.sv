class apb_targeted_addr_write_read_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_targeted_addr_write_read_sequence);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_targeted_addr_write_read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(1) 
     begin
      `uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d24;apb_tx_h.apb_write_paddr =='d2;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write random address
     #50;  
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d2;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read random address 
   end
  endtask

 
endclass

