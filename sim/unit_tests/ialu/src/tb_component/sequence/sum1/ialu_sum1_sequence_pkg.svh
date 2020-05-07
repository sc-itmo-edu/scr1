`ifndef IALU_SUM1_SEQUENCE_PKG
`define IALU_SUM1_SEQUENCE_PKG

package ialu_sum1_sequence_pkg;

  import uvm_pkg::*;
  import ialu_sum1_seq_item_pkg::*;
  import ialu_sum1_sequencer_config_pkg::*;
  import ialu_sum1_sequencer_pkg::*;

  import ialu_base_sequence_pkg::*;

  `include "ialu_sum1_sequence.svh"

  // Constructor
  function ialu_sum1_sequence::new(string name = "ialu_sum1_sequence");
    super.new(name);
  endfunction : new


  // Body
  task ialu_sum1_sequence::body();
    int unsigned trans_counter = 0;
    this.num_times = `NUM_OF_TRANS;
    `uvm_info(get_name(), $sformatf("Starting body"), UVM_HIGH)

    item = T_seq_item::type_id::create("item");
    // Generate and send transactions until limit is reached
    while (trans_counter < num_times || run_forever) begin
      start_item(item);
      // TODO: extend if needed
      assert(item.randomize());
      finish_item(item);

      trans_counter++;
      `uvm_info("TRANS_COUNTER", trans_counter, UVM_DEBUG)
    end
    `uvm_info(get_name(), $sformatf("Body is over"), UVM_HIGH)
  endtask


  // Post-Body
  task ialu_sum1_sequence::post_body();
    `uvm_info(get_name(), $sformatf("Starting post-body"), UVM_HIGH)

    // start_item(item);
    // TODO: send IDLE transaction at the end?
    // finish_item(item);

    `uvm_info(get_name(), $sformatf("Post-body is over"), UVM_HIGH)
  endtask

endpackage : ialu_sum1_sequence_pkg

`endif