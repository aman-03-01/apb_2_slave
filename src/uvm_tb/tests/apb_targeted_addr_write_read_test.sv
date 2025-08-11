class apb_targeted_addr_write_read_test extends uvm_test;
  //Register with factory
`uvm_component_utils(apb_targeted_addr_write_read_test);
  
  apb_env  apb_env_h;
  apb_targeted_addr_write_read_sequence apb_tar_addr_wr_rd_seq;
  
  function new(input string name = "apb_targeted_addr_write_read_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //Phases
  virtual function void build_phase(uvm_phase phase);
    apb_env_h = apb_env::type_id::create("apb_env_h", this);
    apb_tar_addr_wr_rd_seq = apb_targeted_addr_write_read_sequence::type_id::create("apb_tar_addr_wr_rd_seq");
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
  
  virtual task run_phase( uvm_phase phase );
    phase.raise_objection( this, "Starting apb_targeted_addr_write_read_sequence in main phase" );
    $display("%t Starting sequence apb_a1_seq run_phase",$time);
    apb_tar_addr_wr_rd_seq.start(apb_env_h.a1.apb_seqr_h);
    #50ns;
    phase.drop_objection( this , "Finished apb_targeted_addr_write_read_sequence in main phase" );
  endtask
  
  
endclass

