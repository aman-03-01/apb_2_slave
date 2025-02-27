class apb_a1_monitor extends uvm_monitor;

 `uvm_component_utils(apb_a1_monitor)
  virtual apb_if v_apb_intf;
  apb_write_seq_item apb_tx_h;
  uvm_analysis_port #(apb_write_seq_item) apb_a1_mon_port;

function new(input string name = "apb_a1_monitor",uvm_component parent);
  super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  apb_a1_mon_port = new("apb_a1_mon_port",this);
  if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",v_apb_intf))
  //`uvm_fatal("MON_A1","Virtual interface not set, unable to get Config DB");
  `uvm_fatal("MON_A1",{"virtual interface must be set for: ",get_full_name(),".v_apb_intf"});
endfunction

//
task run_phase(uvm_phase phase);
 forever begin 
  apb_tx_h=apb_write_seq_item::type_id::create("apb_tx_h");
  monitor_logic();
  mon_port.write(apb_tx_h);
 end
endtask 

//
//Need to chenge wrt Monitor type : ACTIVE 
task monitor_logic();
//@(posedge v_apb_intf_h.MONITOR.pclk;
   @(posedge v_apb_intf.PCLK)
   //Check with Harsha
   //if(v_apb_intf.psel==1 && v_apb_intf.penable==1)
   begin
      if(v_apb_intf.pwrite==1)
      begin
         apb_tx_h.transfer            =v_apb_intf.transfer;
         apb_tx_h.READ_WRITE          =v_apb_intf.READ_WRITE;
         apb_tx_h.apb_write_paddr     =v_apb_intf.apb_write_paddr;
         apb_tx_h.apb_read_paddr      =v_apb_intf.apb_read_paddr;
         apb_tx_h.apb_write_data      =v_apb_intf.apb_write_data;
         apb_tx_h.apb_read_data_out   =v_apb_intf.apb_read_data_out;
         apb_tx_h.PSLVERR   =v_apb_intf.PSLVERR;
         ap.write(apb_tx_h);
      end
      else
      begin
         apb_tx_h.transfer             =v_apb_intf.transfer;
         apb_tx_h.READ_WRITE           =v_apb_intf.READ_WRITE;
         apb_tx_h.apb_write_paddr      =v_apb_intf.apb_write_paddr;
         apb_tx_h.apb_read_paddr       =v_apb_intf.apb_read_paddr;
         apb_tx_h.apb_write_data       =v_apb_intf.apb_write_data;
         apb_tx_h.apb_read_data_out    =v_apb_intf.apb_read_data_out;
         apb_tx_h.PSLVERR              =v_apb_intf.PSLVERR;
         ap.write(apb_tx_h);
      end
   end
endtask 

endclass
