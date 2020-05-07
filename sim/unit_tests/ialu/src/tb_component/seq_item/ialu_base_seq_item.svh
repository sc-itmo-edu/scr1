class ialu_base_seq_item extends uvm_sequence_item;

  // TODO: don't forget to import neede packages!

  // ---------------------------------------------------------------------------
  // Data
  // ---------------------------------------------------------------------------
  //
  rand int unsigned op_delay;
  // ---------------------------------------------------------------------------
  // Constraints
  // ---------------------------------------------------------------------------
  //
  // ---------------------------------------------------------------------------
  // Methods
  // ---------------------------------------------------------------------------
  //
  extern function new(string name = "ialu_base_seq_item");
  extern function void copy(ialu_base_seq_item rhs);
  extern function ialu_base_seq_item clone();
  extern function void display();

endclass : ialu_base_seq_item