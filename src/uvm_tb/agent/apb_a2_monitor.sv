class apb_a2_monitor extends uvm_monitor;
  `uvm_component_utils(apb_a2_monitor)
  function new(string name="apb_a2_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
  endfunction
  virtual task run_phase(uvm_phase phase);
  endtask
endclass
