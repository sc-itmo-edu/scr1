
class ialu_sum1_agent_config extends ialu_base_agent_config #(
    .T_intf(virtual ialu_sum1_if)
  );
  `uvm_object_utils(ialu_sum1_agent_config)

  // ---------------------------------------------------------------------------
  // Members
  // ---------------------------------------------------------------------------
  //
  //
  // ---------------------------------------------------------------------------
  // Class Methods
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  //                                                                 UVM Methods
  // ---------------------------------------------------------------------------
  //
  extern function new (string name = "ialu_sum1_agent_config");

endclass : ialu_sum1_agent_config

