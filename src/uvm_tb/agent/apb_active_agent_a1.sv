class apb_active_agent_a1 extends uvm_agent ;

 `uvm_component_utils(apb_active_agent_a1)

 apb_a1_sequencer seqncr ;
 apb_a1_driver drv;
 apb_a1_monitor mon;

function new(string_name = "apb_active_agent_a1",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(get_is_active() == UVM_ACTIVE)
  begin
     seqncr = apb_a1_sequencer::type_id::create("seqncr",this);
     drv = apb_a1_driver::type_id::create("drv",this);
  end
     mon = apb_a1_monitor::type_id::create("mon",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(get_is_active() == UVM_ACTIVE)
  begin
     drv.seq_item_port.connect(seqncr.seq_item_export);
  end
endfunction

endclass
