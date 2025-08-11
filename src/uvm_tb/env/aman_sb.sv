`uvm_analysis_imp_decl(_expdata)
`uvm_analysis_imp_decl(_actdata)
 
class apb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb_scoreboard)
  
  apb_write_seq_item exp_queue[$];
  
  uvm_analysis_imp_expdata#(apb_write_seq_item, apb_scoreboard) apb_a1_scb_port;
  uvm_analysis_imp_actdata#(apb_write_seq_item, apb_scoreboard) apb_a2_scb_port;
  
  
  function new(string name, uvm_component parent);
    super.new(name, parent);  
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    apb_a1_scb_port = new("apb_a1_scb_port", this);
    apb_a2_scb_port = new("apb_a2_scb_port", this);
  endfunction
  
   function write_expdata(input apb_write_seq_item tr);
    exp_queue.push_back(tr);
  endfunction
  
  
  
  function write_actdata(input apb_write_seq_item tr);
    apb_write_seq_item expdata;
    if(exp_queue.size()) begin
      expdata =exp_queue.pop_front();
      if(tr.compare(expdata))begin
        `uvm_info("",$sformatf("MATCHED"),UVM_LOW)
      end
      else begin
        `uvm_info("",$sformatf("MISMATCHED"),UVM_LOW)
      end
    end
  endfunction
 
endclass
