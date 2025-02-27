class apb_active_agent_a1 extends uvm_agent ;

 `uvm_component_utils(apb_active_agent_a1)

 apb_a1_sequencer apb_seqr_h ;
 apb_a1_driver apb_drv_h;
 apb_a1_monitor apb_mon_h;

function new(input string name = "apb_active_agent_a1",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(get_is_active() == UVM_ACTIVE)
  begin
     apb_seqr_h = apb_a1_sequencer::type_id::create("apb_seqr_h",this);
     apb_drv_h = apb_a1_driver::type_id::create("apb_drv_h",this);
  end
     apb_mon_h = apb_a1_monitor::type_id::create("apb_mon_h",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(get_is_active() == UVM_ACTIVE)
  begin
     apb_drv_h.seq_item_port.connect(apb_seqr_h.seq_item_export);
  end
endfunction

endclass
