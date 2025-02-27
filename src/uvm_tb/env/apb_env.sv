class apb_env extends uvm_env;
`uvm_component_utils(apb_env)

function new(input string name="apb_env",uvm_component parent);
    super.new(name,parent);
endfunction

apb_active_agent_a1 a1;
apb_passive_agent_a2 a2;
//apb_scoreboard scb;
//virtual dut_if  vif;

//Phases
virtual function void build_phase(uvm_phase phase)
    super.phase(uvm_phase phase);
    a1=apb_active_agent_a1::type_id::create("a1",this);
    a2=apb_passive_agent_a2::type_id::create("a2",this);
//    scb=apb_scoreboard::type_id::create("scb",this);

//    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
//       `uvm_fatal("build phase", "No virtual interface specified for this env instance")
//     end
//     uvm_config_db#(virtual dut_if)::set( this, "a1", "vif", vif);
endfunction
/*
virtual function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
     agt.mon.ap.connect(scb.mon_export);
   endfunction
*/
endclass
