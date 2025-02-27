class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard)

apb_write_seq_item apb_wr_q [$];
bit [7:0] apb_mem [4];

uvm_analysis_imp #(apb_write_seq_item, apb_scoreboard) apb_a1_scb_port;
uvm_analysis_imp #(apb_write_seq_item, apb_scoreboard) apb_a2_scb_port;

function new(string name,uvm_component parent);
 super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 apb_a1_scb_port=new("apb_a1_scb_port",this);
 apb_a2_scb_port=new("apb_a2_scb_port",this);
endfunction 

virtual function void write(apb_write_seq_item pkt);
	  apb_wr_q.push_back(pkt);
endfunction

  virtual task run_phase(uvm_phase phase);
    apb_write_seq_item apb_pkt;
    
    forever begin
      wait(apb_wr_q.size() > 0);
      
      apb_pkt = apb_wr_q.pop_front();
      $display("################NEW_TRANSACTION##################\n");
      if(apb_pkt.READ_WRITE==1) begin
        apb_mem [apb_pkt.apb_write_paddr] = apb_pkt.apb_write_data;//Golden Dut
        `uvm_info(get_type_name(),$sformatf("------ :: WRITE DATA       :: ------"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.apb_write_paddr),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("Data: %0h",apb_pkt.apb_write_data),UVM_LOW)
        `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
      end
      else if(apb_pkt.READ_WRITE==0) begin
        if(apb_mem[apb_pkt.apb_read_paddr] == apb_pkt.apb_read_data_out) begin
          `uvm_info(get_type_name(),$sformatf("------ :: READ DATA Match :: ------"),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.apb_read_paddr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",apb_mem[apb_pkt.apb_read_paddr],apb_pkt.apb_read_data_out),UVM_LOW)
          `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
        end
        else begin
          `uvm_error(get_type_name(),"------ :: READ DATA MisMatch :: ------")
          `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_pkt.apb_read_paddr),UVM_LOW)
          `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",apb_mem[apb_pkt.apb_read_paddr],apb_pkt.apb_read_data_out),UVM_LOW)
          `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
        end
      end
    end
  endtask : run_phase


endclass
