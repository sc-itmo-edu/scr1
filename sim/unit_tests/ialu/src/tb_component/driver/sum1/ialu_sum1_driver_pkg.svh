
package ialu_sum1_driver_pkg;

  import uvm_pkg::*;
  import ialu_tb_pkg::*;
  import ialu_sum1_seq_item_pkg::*;

  import ialu_base_driver_pkg::*;

  `include "ialu_sum1_driver.svh"

  // ---------------------------------------------------------------------------
  // UVM Phases
  // ---------------------------------------------------------------------------
  //
  // Constructor
  function ialu_sum1_driver::new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction


  // Build Phase
  function void ialu_sum1_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction


  // Reset Phase
  task ialu_sum1_driver::reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    phase.raise_objection(phase);
    `uvm_info(get_name(), $sformatf("Applying initial reset"), UVM_HIGH);
    drive_reset();
    `uvm_info(get_name(), $sformatf("End of reset"), UVM_HIGH);
    phase.drop_objection(phase);
  endtask


  // Main Phase
  task ialu_sum1_driver::main_phase(uvm_phase phase);
    `uvm_info(get_name(), $sformatf("Main phase"), UVM_HIGH);
    forever begin
      // Get the next data item from sequencer (may block)
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done(); // Consume the request
    end
  endtask


  // Shutdown Phase
  task ialu_sum1_driver::shutdown_phase(uvm_phase phase);
    super.shutdown_phase (phase);
    `uvm_info (get_name(), "Finished DUT drive", UVM_HIGH)
  endtask

  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //

  // Drive Reset
  task ialu_sum1_driver::drive_reset();
    // TODO: add reset state
    vif.rst_n         <= '0;
    vif.ialu_vd       <= '0;
    vif.ialu_op1      <= '0;
    vif.ialu_op2      <= '0;
    vif.ialu_cmd      <= ialu_tb_pkg::SCR1_IALU_CMD_NONE;
    repeat (100) @(posedge vif.clk);
    // TODO: restore state after a reset
    vif.rst_n         <= '1;
    `uvm_info(get_name(), $sformatf("Reset complete"), UVM_HIGH)
  endtask


  // Drive
  task ialu_sum1_driver::drive(input ialu_sum1_seq_item item);
    automatic ialu_sum1_seq_item new_item = item.clone();
    pre_drive(new_item);
    drive_item(new_item);
    post_drive(new_item);
  endtask


  // Pre-Drive
  task ialu_sum1_driver::pre_drive(input ialu_sum1_seq_item item);
    fork
      // FIXME: check
      begin
        @(posedge vif.clk);
        // TODO: define idle signals
        vif.ialu_vd       <= '0;
        vif.ialu_op1      <= '0;
        vif.ialu_op2      <= '0;
        vif.ialu_cmd      <= ialu_tb_pkg::SCR1_IALU_CMD_NONE;
      end
      // Wait for specified number of clk cycles
      delay_before_drive(item.op_delay);
    join
  endtask


  // Drive: drive_item
  task ialu_sum1_driver::drive_item(input ialu_sum1_seq_item item);
    // TODO: fill method
    wait_ready();
    // Drive signals
    vif.ialu_vd       <= '1;
    vif.ialu_op1      <= item.ialu_op1;
    vif.ialu_op2      <= item.ialu_op2;
    vif.ialu_cmd      <= item.ialu_cmd;
  endtask


  // Drive: post_drive
  task ialu_sum1_driver::post_drive(ialu_sum1_seq_item item);
    // // TODO: fill method
    // @(posedge vif.clk);
    // // Drive post-drive state
    // vif.ialu_vd       <= '0;
  endtask


  // Wait ready
  task ialu_sum1_driver::wait_ready();
    logic req_ready = vif.ialu_rdy;

    while (req_ready != 1) begin
      // TODO: place wait signals
      vif.ialu_vd       <= '0;
      @(posedge vif.clk);
      req_ready = vif.ialu_rdy; // TODO: change to ready signal
    end
  endtask : wait_ready

endpackage : ialu_sum1_driver_pkg

