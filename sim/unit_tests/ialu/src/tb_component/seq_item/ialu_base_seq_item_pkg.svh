`ifndef IALU_BASE_SEQ_ITEM_PKG
`define IALU_BASE_SEQ_ITEM_PKG

package ialu_base_seq_item_pkg;

  import uvm_pkg::*;


  `include "ialu_base_seq_item.svh"

  // Constructor
  function ialu_base_seq_item::new(string name = "ialu_base_seq_item");
    super.new(name);
  endfunction : new


  // Copy
  function void ialu_base_seq_item::copy(ialu_base_seq_item rhs);
    // TODO
    this.op_delay            = rhs.op_delay;
  endfunction : copy


  // Clone
  function ialu_base_seq_item ialu_base_seq_item::clone();
    ialu_base_seq_item new_item = new();
    new_item.copy(this);
    return new_item;
  endfunction : clone


  // Display
  function void ialu_base_seq_item::display();
    // TODO
  endfunction : display


endpackage : ialu_base_seq_item_pkg

`endif