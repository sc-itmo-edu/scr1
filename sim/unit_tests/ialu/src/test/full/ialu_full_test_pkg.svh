package ialu_full_test_pkg;

  import uvm_pkg::*;

  import ialu_base_test_pkg::*;

  import ialu_sum1_sequence_pkg::*;

  `include "ialu_full_test.svh"


  // Constructor
  function ialu_full_test::new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction


  // Build_phase
  function void ialu_full_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create sequences
    sum1_seq = ialu_sum1_sequence::type_id::create("sum1_seq");
  endfunction : build_phase



  // End of Elaboration Phase
  function void ialu_full_test::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
  endfunction : end_of_elaboration_phase



  // Reset Phase
task ialu_full_test::reset_phase (uvm_phase phase);
  // reset_test_seq reset_seq = reset_test_seq::type_id::create("reset_seq");

  // phase.raise_objection(this, "Starting reset_test_seq in reset phase");
  // // TODO: add virtual sequence
  // // reset_seq.start(env.m_v_sqr.ifu); // FIXME insert correct component path
  // phase.drop_objection(this, "Finished reset_test_seq in reset phase");
endtask : reset_phase


  // Main Phase
  task ialu_full_test::main_phase(uvm_phase phase);
    super.main_phase(phase);

    phase.phase_done.set_drain_time(this, 50_000ns); // Letting things settle down
    phase.raise_objection(this, "Starting sequences in main phase" );
    fork
      sum1_seq.start(env.sum1_agent.sequencer);
    join
    phase.drop_objection(this , "Finished sequences in main phase" );

  endtask : main_phase


endpackage: ialu_full_test_pkg