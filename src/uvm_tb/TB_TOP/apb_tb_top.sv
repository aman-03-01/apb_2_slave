module APB_TB_TOP;

apb_if APB_DUT_IF;
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

initial begin 
    PCLK   =1'b0; 
    PRESETn=1'b0; 
    transfer=1'b0;
#5 

    PRESETn=1'b1; 
    transfer=1'b1;
#5 
end


always begin
    #5   PCLK = ~PCLK;
end


intial begin
    run_test("apb_test");
end

// Set Config DB
intial begin
    `uvm_config_db #( virtual APB_DUT_IF)::set(null,"*","vif",APB_DUT_IF);
end

intial begin
    #1000 $finish;
end

//Waves
endmodule
