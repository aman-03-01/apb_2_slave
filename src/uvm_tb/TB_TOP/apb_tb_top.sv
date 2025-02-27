module APB_TB_TOP;

apb_if APB_DUT_IF(PCLK,PRESETn);
initial begin 
    APB_IF.PCLK   =1'b0; 
    APB_IF.PRESETn=1'b0; 
    APB_IF.transfer=1'b0;
#5; 

    APB_IF.PRESETn=1'b1; 
    APB_IF.transfer=1'b1;
#5;
end

always begin
    #5   APB_IF.PCLK = ~APB_IF.PCLK;
end

initial begin
    run_test("apb_test");
end

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
    uvm_config_db #( virtual APB_DUT_IF)::set(uvm_root::get(),"*","vif",APB_DUT_IF);
end

initial begin
    #1000 $finish;
end

//Waves
endmodule
