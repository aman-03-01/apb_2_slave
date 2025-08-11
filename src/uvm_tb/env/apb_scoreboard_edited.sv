class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard)

  uvm_tlm_analysis_fifo#(apb_write_seq_item) master_fifo;
  uvm_tlm_analysis_fifo#(apb_write_seq_item) slave_fifo;
  apb_write_seq_item act_txn;//slave
  apb_write_seq_item exp_txn;//master
  int act_q[$],exp_q[$];
  int act_read_data, exp_read_data;


  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     master_fifo = new("master_fifo", this);
     slave_fifo  = new("slave_fifo", this);
     act_txn=apb_write_seq_item::type_id::create("act_txn");
     exp_txn=apb_write_seq_item::type_id::create("exp_txn");

  endfunction

 task run_phase(uvm_phase phase);
    fork
      act_out_t();
      exp_out_t();
    join
    compare_task();
  endtask
  task act_out_t();
    slave_fifo.get(act_txn);
    act_q.push_back(act_txn.apb_read_data_out);
$display("Task act_out: the read_data_out is:%0d",act_txn.apb_read_data_out);
  
  endtask
  task exp_out_t();
    master_fifo.get(exp_txn);
    exp_q.push_back(exp_txn.apb_write_data);
$display("Task exp_out: the write data is:%0d",act_txn.apb_write_data);

  endtask
  task compare_task();
    if(act_q.size()!=0 && exp_q.size()!=0) begin
      act_read_data=act_q.pop_front();
      exp_read_data=exp_q.pop_front();
      if (act_read_data!= exp_read_data) begin
        `uvm_error("SCOREBOARD", $sformatf("Data MISMATCH ? Expected: %0h, Received: %0h", exp_read_data,act_read_data))
      end else begin
        `uvm_info("SCOREBOARD", $sformatf("? Data MATCHED expected: %0h and actual:%0h",exp_read_data,act_read_data ), UVM_LOW)
      end
    end
  endtask

endclass
