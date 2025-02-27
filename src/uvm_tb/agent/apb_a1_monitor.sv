class apb_a1_monitor extends uvm_monitor;

 `uvm_component_utils(apb_a1_monitor)
  virtual apb_if v_intf;
  apb_write_seq_item tr;
  uvm_analysis_port#(apb_write_seq_item)ap;

function new(string_name = "apb_a1_monitor",uvm_component parent);
  super.new(name,parent);
  ap = new("ap",this);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
 // if(!(uvm_config_db#(virtual v_intf)::get(this,"","vif",v_intf))
 // `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".v_intf"});
endfunction


task run_phase(uvm_phase phase);
forever 
begin
   @(posedge v_intf.pclk)
   if(v_intf.psel==1 && v_intf.penable==1)
   begin
      if(v_intf.pwrite==1)
      begin
         tr.pwrite=v_intf.pwrite;
         tr.paddr=v_intf.paddr;
         tr.pwdata=v_intf.pwdata;
         tr.psel=v_intf.psel;
         tr.penable=v_intf.penable;
         ap.write(tr);
      end
      else
      begin
         tr.pwrite=v_intf.pwrite;
         tr.paddr=v_intf.paddr;
         tr.psel=v_intf.psel;
         tr.penable=v_intf.penable;
         tr.prdata=v_intf.prdata;
         ap.write(tr);
      end
   end
end
endtask 

endclass
