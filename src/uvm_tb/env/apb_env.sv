class apb_env extends uvm_env;
`uvm_component_utils(apb_env)

apb_active_agent_a1 a1;
apb_passive_agent_a2 a2;
apb_scoreboard apb_scb;
apb_coverage apb_cov_inst;

function new(input string name="apb_env",uvm_component parent);
    super.new(name,parent);
endfunction

//Phases
virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a1=apb_active_agent_a1::type_id::create("a1",this);
    a2=apb_passive_agent_a2::type_id::create("a2",this);
    apb_cov_inst=apb_coverage::type_id::create("apb_cov_inst",this);
    apb_scb=apb_scoreboard::type_id::create("apb_scb",this);

endfunction

virtual function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
     //agt.mon.ap.connect(scb.mon_export);
     a1.apb_mon1_h.apb_a1_mon_port.connect(apb_scb.apb_a1_scb_port);
     a2.apb_mon2_h.apb_a2_mon_port.connect(apb_scb.apb_a2_scb_port);
     a1.apb_mon1_h.apb_a1_mon_port.connect(apb_cov_inst.analysis_export);

      //  a1.apb_mon1_h.apb_a1_mon_port.connect(apb_scb.master_fifo.analysis_export);
       // a2.apb_mon2_h.apb_a2_mon_port.connect(apb_scb.slave_fifo.analysis_export);

   endfunction

endclass
