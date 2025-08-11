class apb_targeted_addr_write_read_sequence extends uvm_sequence #(apb_write_seq_item);
  `uvm_object_utils(apb_targeted_addr_write_read_sequence);
  apb_write_seq_item apb_tx_h;

  function new(string name="apb_targeted_addr_write_read_sequence");
    super.new(name);
  endfunction
 
 /* virtual task body();
   // repeat(2)
     begin
      `uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d24;apb_tx_h.apb_write_paddr=='d2;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
     #50;  
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d2;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
     #50;
      `uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d64;apb_tx_h.apb_write_paddr=='d4;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
     #50;  
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d4;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
   end
  endtask
*/
 virtual task body();
   // repeat(2)
     begin
      `uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d24;apb_tx_h.apb_write_paddr=='d2;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
     #50; 
      `uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d22;apb_tx_h.apb_write_paddr=='d3;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
      #50;
	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d44;apb_tx_h.apb_write_paddr=='d4;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
      #50;
	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_write_paddr[8]==1'b0;apb_tx_h.apb_write_data =='d64;apb_tx_h.apb_write_paddr=='d5;apb_tx_h.READ_WRITE==1'b0;apb_tx_h.transfer==1'b1;}); //Slave 0 Write targeted address
 	#50;
	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d2;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
#50;
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d3;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
#50;
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d4;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
#50;
 	`uvm_do_with(apb_tx_h,{apb_tx_h.apb_read_paddr[8]==1'b0;apb_tx_h.apb_read_paddr =='d5;apb_tx_h.READ_WRITE==1'b1;apb_tx_h.transfer==1'b1;}); //Slave 0 read address 
   end
  endtask


/*
virtual task body();
//    repeat (2)
 begin
      // Create and start write transaction with inline constraints
      apb_tx_h = apb_write_seq_item::type_id::create("apb_tx_h");
      start_item(apb_tx_h);
      if (!apb_tx_h.randomize() with {
          apb_write_paddr[8] == 1'b0;
          apb_write_data == 'd24;
          apb_write_paddr == 'd2;
          READ_WRITE == 1'b0;  // Write operation
          transfer == 1'b1;
        }) 
      begin
        `uvm_error("SEQ", "Randomization failed for write transaction")
      end
      finish_item(apb_tx_h);

      #50;

      // Create and start read transaction with inline constraints
      apb_tx_h = apb_write_seq_item::type_id::create("apb_tx_h");
      start_item(apb_tx_h);
      if (!apb_tx_h.randomize() with {
          apb_read_paddr[8] == 1'b0;
          apb_read_paddr == 'd2;
          READ_WRITE == 1'b1;  // Read operation
          transfer == 1'b1;
        }) 
      begin
        `uvm_error("SEQ", "Randomization failed for read transaction")
      end
      finish_item(apb_tx_h);
    end
  
endtask
*/
endclass

