class apb_coverage extends uvm_subscriber #(apb_write_seq_item);
`uvm_component_utils(apb_coverage);

apb_write_seq_item apb_tx_h;

covergroup apb_cg;
option.per_instance=1;

   READ_WRITE_TX_RW : coverpoint apb_tx_h.READ_WRITE {
   option.comment = "READ_WRITE";
   bins WRITE                              = {0}; 
   bins READ                             = {1};
   }

   APB_WRITE_PADDR_0_CP : coverpoint apb_tx_h.apb_write_paddr{
   option.comment = "apb write address ";
   bins WRITE_PADDR_LOW_VALID_RANGE = {[0:50]};
   bins WRITE_PADDR_MID_VALID_RANGE = {[51:200]};
   bins WRITE_PADDR_HIGH_VALID_RANGE = {[201:255]}; 
   }
 
   
    APB_READ_PADDR_0_CP : coverpoint apb_tx_h.apb_read_paddr{
   option.comment = "apb read address ";
   bins READ_PADDR_LOW_VALID_RANGE = {[0:50]};
   bins READ_PADDR_MID_VALID_RANGE = {[51:200]};
   bins READ_PADDR_HIGH_VALID_RANGE = {[201:255]}; 
   }
 
   
endgroup 

function new(string name="apb_coverage",uvm_component parent);
    super.new(name,parent);
endfunction

function void write(apb_write_seq_item t);
    apb_tx_h=t;
    apb_cg.sample();
endfunction

endclass
