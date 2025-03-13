class apb_random_write_read_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_random_write_read_sequence);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_random_write_read_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(1) 
     begin
        ////###########slave 0 random_write
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data inside {[8'h00 : 8'hff]};apb_tx_h.apb_write_paddr inside {[9'h000 : 9'h7ff]};apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write random address 
         #50;
        /////##############slave 0 random_read
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr inside {[9'h000 : 9'h7ff]};apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read random address 
        //////##############slave 1 random_write
 	//`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b1;apb_tx_h.apb_write_data inside {[8'h00 : 8'hff]};apb_tx_h.apb_write_paddr inside {[9'h800 : 9'hfff]};apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write random address 
       ////###############slave 1 random_read
 	//`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b1;apb_tx_h.apb_read_paddr inside {[9'h800 : 9'hfff]};apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read random address 

   end
  endtask

 
endclass

