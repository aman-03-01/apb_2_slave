class apb_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(apb_scoreboard)

function new(input string path="apb_scoreboard", uvm_compoennt parent);
    super.new(path,parent);
endfunction


endclass
