class apb_a1_driver extends uvm_driver #(apb_write_seq_item);

 `uvm_component_utils(apb_a1_driver)
  virtual apb_if v_intf;
  apb_write_seq_item tr;

function new(string_name = "apb_a1_driver",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!(uvm_config_db#(virtual v_intf)::get(this,"", "intf",v_intf)))
  `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".v_intf"});
endfunction

virtual task run_phase(uvm_phase phase);
forever 
   begin
      seq_item_port.get_next_item(tr);
      drive(tr);
      seq_item_port.item_done(tr);
   end
endtask

task drive(apb_write_seq_item tr);
 if(tr.READ_WRITE ==1)
   begin
      write_task(tr);
   end
 else
   begin
      read_task(tr);
   end
 endtask

task write_task(apb_write_seq_item tr);
  @(posedge v_intf.pclk);
  begin
     /*
     v_intf.READ_WRITE<=tr.READ_WRITE;
     //v_intf.penable<=0;
     //v_intf.psel<=1;
     v_intf.apb_write_paddr<=tr.apb_write_paddr;
     v_intf.apb_write_data<=tr.apb_write_data;
     @(posedge v_intf.pclk)
     v_intf.penable<=1;
     while (v_intf.pready!=1)
     @(posedge v_intf.pclk)
     v_intf.penable=1;
  */
  end
endtask


task read_task(apb_write_seq_item tr);
  @(posedge v_intf.pclk);
  begin
     v_intf.READ_WRITE<=tr.READ_WRITE;
     //v_intf.penable<=0;
     //v_intf.psel<=1;
     v_intf.apb_read_paddr<=tr.apb_read_paddr;
     @(posedge v_intf.pclk)
     v_intf.penable<=1;
     while (v_intf.pready!=1)
     @(posedge v_intf.pclk)
     v_intf.penable=1;
  end
endtask

endclass
