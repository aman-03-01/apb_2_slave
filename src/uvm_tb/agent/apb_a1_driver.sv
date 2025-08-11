class apb_a1_driver extends uvm_driver #(apb_write_seq_item);
 `uvm_component_utils(apb_a1_driver)
  virtual apb_if v_apb_intf;
  apb_write_seq_item apb_tx_h;

function new(input string name = "apb_a1_driver",uvm_component parent);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!(uvm_config_db#(virtual apb_if)::get(this,"", "vif",v_apb_intf)))
  `uvm_fatal("DRV_A1",{"virtual interface must be set for: ",get_full_name(),".v_apb_intf"});
endfunction

virtual task run_phase(uvm_phase phase);
forever begin
      seq_item_port.get_next_item(apb_tx_h);
      drive(apb_tx_h);
      apb_tx_h.print();
      seq_item_port.item_done(apb_tx_h);
end
endtask


virtual task drive(apb_write_seq_item apb_tx_h);
   if(apb_tx_h.READ_WRITE =='b0 )
   begin
      write_task(apb_tx_h);
   end
   else
   begin
      read_task(apb_tx_h);
   end
 endtask

task write_task(apb_write_seq_item apb_tx_h);
  @(posedge v_apb_intf.PCLK);
  begin
     v_apb_intf.transfer  <=apb_tx_h.transfer;
     v_apb_intf.READ_WRITE      <=apb_tx_h.READ_WRITE;
     v_apb_intf.apb_write_paddr <=apb_tx_h.apb_write_paddr;
     v_apb_intf.apb_write_data  <=apb_tx_h.apb_write_data;
     v_apb_intf.PSLVERR  <=apb_tx_h.PSLVERR;
  end
endtask


task read_task(apb_write_seq_item apb_tx_h);
  @(posedge v_apb_intf.PCLK);
  begin
     v_apb_intf.transfer  <=apb_tx_h.transfer;
     v_apb_intf.READ_WRITE      <=apb_tx_h.READ_WRITE;
     v_apb_intf.apb_read_paddr <=apb_tx_h.apb_read_paddr;
     v_apb_intf.PSLVERR  <=apb_tx_h.PSLVERR;
  end
endtask
/*
 virtual task drive(apb_write_seq_item tr);
    @(posedge v_apb_intf.PCLK);
    if (!v_apb_intf.PRESETn) begin
      v_apb_intf.apb_write_data  <= 0;
      v_apb_intf.READ_WRITE      <= 0;
      v_apb_intf.transfer        <= 0;
    end else begin
      v_apb_intf.READ_WRITE  <= tr.READ_WRITE;
      v_apb_intf.transfer    <= tr.transfer;
      
      if (!tr.READ_WRITE)begin
        v_apb_intf.apb_write_paddr <= tr.apb_write_paddr;
        v_apb_intf.apb_write_data  <= tr.apb_write_data;
         `uvm_info("APB_DRIVER", $sformatf("WRITE: ADDR=%0h DATA=%0h", tr.apb_write_paddr, tr.apb_write_data), UVM_MEDIUM)
      end else begin
        v_apb_intf.apb_read_paddr <= tr.apb_read_paddr;
         `uvm_info("APB_DRIVER", $sformatf("READ: ADDR=%0h", tr.apb_read_paddr), UVM_MEDIUM)
      end
      
    //  @(posedge vif.PCLK);
    //  vif.transfer <= 0;

     // wait(vif.PSLVERR == 0);  
      if (tr.READ_WRITE) begin
        tr.apb_read_data_out = v_apb_intf.apb_read_data_out;
          `uvm_info("APB_DRIVER", $sformatf("READ DATA=%0h", tr.apb_read_data_out), UVM_MEDIUM)
      end
      
      @(posedge v_apb_intf.PCLK);
           v_apb_intf.READ_WRITE <= 0;
    end
  endtask
*/

endclass
