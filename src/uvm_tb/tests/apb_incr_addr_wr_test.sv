class apb_incr_addr_wr_test extends uvm_test;
  //Register with factory
`uvm_component_utils(apb_incr_addr_wr_test);
  
  apb_env  apb_env_h;
  apb_incr_addr_wr_seq apb_incr_addr_wr_seq1;
  
  function new(input string name = "apb_incr_addr_wr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //Phases
  virtual function void build_phase(uvm_phase phase);
    apb_env_h = apb_env::type_id::create("apb_env_h", this);
    apb_incr_addr_wr_seq1 = apb_incr_addr_wr_seq::type_id::create("apb_incr_addr_wr_seq1");
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
 
  virtual task run_phase( uvm_phase phase );
    phase.raise_objection( this, "Starting apb_incr_addr_wr_seq in main phase" );
    `uvm_info("APB_INCR_ADDR_WR_TEST",$sformatf("%t Starting sequence apb_a1_seq run_phase",$time),UVM_NONE)
    apb_incr_addr_wr_seq1.start(apb_env_h.a1.apb_seqr_h);
    #1000ns;
    phase.drop_objection( this , "Finished apb_incr_addr_wr_seq in main phase" );
  endtask
  
  
endclass
