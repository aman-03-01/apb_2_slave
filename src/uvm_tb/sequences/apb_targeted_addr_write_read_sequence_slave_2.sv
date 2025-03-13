class apb_targeted_addr_write_read_sequence_slave_2 extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_targeted_addr_write_read_sequence_slave_2);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_targeted_addr_write_read_sequence_slave_2");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(1) 
     begin
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_data =='d24;apb_tx_h.apb_write_paddr =='h150;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); 
 	//`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b1;apb_tx_h.apb_write_data =='d24;apb_tx_h.apb_write_paddr =='h16b;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); 
       #150; 
 	`uvm_do_with(apb_tx_h,{apb_tx_h.READ_WRITE==1'b1;apb_tx_h.apb_read_paddr =='h150;apb_tx_h.transfer==1'b1;}); 
 	//`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b1;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.apb_read_paddr =='h150;apb_tx_h.transfer==1'b1;}); 
#50;
   end
  endtask

 
endclass

