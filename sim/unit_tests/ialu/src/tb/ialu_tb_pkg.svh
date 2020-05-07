package ialu_tb_pkg;
  // REVIEW: due to types are not contained in packages, we use some crutches to
  // get it working
  `undef SCR1_ARCH_TYPES_SVH
  `undef SCR1_ARCH_DESCRIPTION_SVH
  `undef SCR1_RISCV_ISA_DECODING_SVH
  `include "scr1_arch_description.svh"
  `include "scr1_riscv_isa_decoding.svh"
  `include "scr1_search_ms1.svh"
endpackage : ialu_tb_pkg