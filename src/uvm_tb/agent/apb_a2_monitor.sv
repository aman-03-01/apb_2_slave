class apb_a2_monitor extends uvm_monitor;
 `uvm_component_utils(apb_a2_monitor)
  virtual apb_if v_apb_intf;
  apb_write_seq_item apb_tx_h;
  uvm_analysis_port #(apb_write_seq_item) apb_a2_mon_port;

function new(input string name = "apb_a1_monitor",uvm_component parent);
  super.new(name,parent);
  apb_a2_mon_port = new("apb_a2_mon_port",this);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual apb_if)::get(this,"","vif",v_apb_intf))
  `uvm_fatal("MON_A2",{"virtual interface must be set for: ",get_full_name(),".v_apb_intf"});
endfunction

task run_phase(uvm_phase phase);
 forever begin 
  apb_tx_h=apb_write_seq_item::type_id::create("apb_tx_h");
  monitor_logic();
  //apb_a2_mon_port.write(apb_tx_h);
 end
endtask 

//Need to chenge wrt Monitor type : PASSIVE 
task monitor_logic();
   @(posedge v_apb_intf.PCLK)
   if(v_apb_intf.READ_WRITE=='b0)
   begin
         apb_tx_h.transfer            =v_apb_intf.transfer;
         apb_tx_h.READ_WRITE          =v_apb_intf.READ_WRITE;
         apb_tx_h.apb_write_paddr     =v_apb_intf.apb_write_paddr;
         apb_tx_h.apb_write_data      =v_apb_intf.apb_write_data;
         apb_tx_h.PSLVERR   =v_apb_intf.PSLVERR;
         apb_a2_mon_port.write(apb_tx_h);
         $display("monitor_a2_if read is %d",apb_tx_h.transfer,apb_tx_h.READ_WRITE,apb_tx_h.apb_read_paddr,apb_tx_h.apb_read_data_out);
   end
   else
   begin
         apb_tx_h.transfer             =v_apb_intf.transfer;
         apb_tx_h.READ_WRITE           =v_apb_intf.READ_WRITE;
         apb_tx_h.apb_read_paddr       =v_apb_intf.apb_read_paddr;
         apb_tx_h.apb_read_data_out    =v_apb_intf.apb_read_data_out;
         apb_tx_h.PSLVERR   =v_apb_intf.PSLVERR;
         apb_a2_mon_port.write(apb_tx_h);
         $display("monitor_a2_else read is %d",apb_tx_h.transfer,apb_tx_h.READ_WRITE,apb_tx_h.apb_read_paddr,apb_tx_h.apb_read_data_out);
   end
endtask 

endclass
