module APB_TB_TOP();

bit PCLK,PRESETn,transfer;

//IF
apb_if APB_DUT_IF(PCLK,PRESETn);

initial begin 
    PCLK    =1'b0; 
    PRESETn =1'b0; 
    transfer=1'b0;
#5; 

    PRESETn=1'b1; 
    transfer=1'b1;
end

always begin
    #10   PCLK = ~PCLK;
end

initial begin
    //run_test("apb_test");
    //run_test("apb_reset_init_test");
    //run_test("apb_incr_addr_wr_test");
  // run_test("apb_random_write_read_test");
  run_test("apb_targeted_addr_write_read_test");
  // run_test("apb_targeted_addr_write_read_test_slave_2");
end
//DUT

APB_Protocol APB_DUT(
.PCLK               (APB_DUT_IF.PCLK),
.PRESETn            (APB_DUT_IF.PRESETn),
.transfer           (APB_DUT_IF.transfer),
.READ_WRITE         (APB_DUT_IF.READ_WRITE),
.apb_write_paddr    (APB_DUT_IF.apb_write_paddr),
.apb_write_data     (APB_DUT_IF.apb_write_data),
.apb_read_paddr     (APB_DUT_IF.apb_read_paddr),
.PSLVERR            (APB_DUT_IF.PSLVERR), 
.apb_read_data_out  (APB_DUT_IF.apb_read_data_out)
);


// Set Config DB
initial begin
    //uvm_config_db #( virtual apb_if)::set(uvm_root::get(),"*","vif",APB_DUT_IF);
    uvm_config_db #(virtual apb_if)::set(null,"*","vif",APB_DUT_IF);
end

initial begin
    #10000 
    $finish();
end

//Waves
endmodule
