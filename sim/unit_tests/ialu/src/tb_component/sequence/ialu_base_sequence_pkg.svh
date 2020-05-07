`ifndef IALU_BASE_SEQUENCE_PKG
`define IALU_BASE_SEQUENCE_PKG

package ialu_base_sequence_pkg;

  import uvm_pkg::*;
  import ialu_base_seq_item_pkg::*;
  import ialu_base_sequencer_config_pkg::*;
  import ialu_base_sequencer_pkg::*;


  `include "ialu_base_sequence.svh"

  // Constructor
  function ialu_base_sequence::new(string name = "ialu_base_sequence");
    super.new(name);
  endfunction : new


  // Body
  task ialu_base_sequence::body();
    int unsigned trans_counter = 0;
    `uvm_info(get_name(), $sformatf("Starting body"), UVM_HIGH)

    item = T_seq_item::type_id::create("item");
    // Generate and send transactions until limit is reached
    while (trans_counter < num_times || run_forever) begin
      start_item(item);
      // TODO: extend if needed
      assert(item.randomize());
      finish_item(item);

      trans_counter++;
    end
    `uvm_info(get_name(), $sformatf("Body is over"), UVM_HIGH)
  endtask


  // Post-Body
  task ialu_base_sequence::post_body();
    `uvm_info(get_name(), $sformatf("Starting post-body"), UVM_HIGH)

    // start_item(item);
    // TODO: send IDLE transaction at the end?
    // finish_item(item);

    `uvm_info(get_name(), $sformatf("Post-body is over"), UVM_HIGH)
  endtask

endpackage : ialu_base_sequence_pkg

`endif