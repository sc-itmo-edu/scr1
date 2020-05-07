package ialu_scoreboard_pkg;

  // REVIEW: can't import struct from a module, so it's copied
  typedef struct packed {
    logic       z;      // Zero
    logic       s;      // Sign
    logic       o;      // Overflow
    logic       c;      // Carry
  } type_scr1_ialu_flags_s;

  import uvm_pkg::*;
  import ialu_tb_pkg::*;

  import ialu_sum1_seq_item_pkg::*;

  import ialu_scoreboard_config_pkg::*;

  `include "ialu_scoreboard.svh"


  // Constructor
  function ialu_scoreboard::new(string name = "ialu_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void ialu_scoreboard::build_phase (uvm_phase phase);
    super.build_phase(phase);
    sum1_item       = ialu_sum1_seq_item::type_id::create("sum1_item");

    // Get config from env
    if(!uvm_config_db#(ialu_scoreboard_config)::get(this, "", "cfg", cfg))
      `uvm_fatal(get_full_name(), "Cannot get config");

    sum1_in_item_export  = new("sum1_in_item_export", this);
    sum1_out_item_export = new("sum1_out_item_export", this);
  endfunction : build_phase

  // Perform any remaining comparisons or checks before end of simulation
  function void ialu_scoreboard::check_phase (uvm_phase phase);
    super.check_phase(phase);

    // Check that all operations are finished
    if (ialu_sum1_res_q.size() != 0)
      `uvm_fatal(get_name(), "IALU SUM1 results queue is not empty")
  endfunction : check_phase

  // ---------------------------------------------------------------------------
  //                                                             Write Functions
  // ---------------------------------------------------------------------------
  //
  function void ialu_scoreboard::write_sum1_in(ialu_sum1_seq_item item);
    `uvm_info("DEBUG", item.convert2str_req(), UVM_DEBUG);
    this.compute_sum1_res(item);
    ialu_sum1_res_q.push_back(item);
  endfunction : write_sum1_in


  function void ialu_scoreboard::write_sum1_out(ialu_sum1_seq_item item);
    ialu_sum1_seq_item expected_item = ialu_sum1_res_q.pop_front();

    `uvm_info("DEBUG", item.convert2str_resp(), UVM_DEBUG);

    if (item.ialu_res != expected_item.ialu_res)
      `uvm_fatal(get_name(), "Results don't match")
    if (item.ialu_cmp != expected_item.ialu_cmp)
      `uvm_fatal(get_name(), "Compare bits don't match")
  endfunction : write_sum1_out


  // ---------------------------------------------------------------------------
  //                                                                     Methods
  // ---------------------------------------------------------------------------
  //
  function void ialu_scoreboard::compute_sum1_res(ialu_sum1_seq_item item);
    type_scr1_ialu_flags_s          sum1_flags;
    logic [32:0]                    sum1_res;

    // SUM1
    sum1_res = (item.ialu_cmd != ialu_tb_pkg::SCR1_IALU_CMD_ADD)
                  ? (item.ialu_op1 - item.ialu_op2)   // Subtraction and comparison
                  : (item.ialu_op1 + item.ialu_op2);  // Addition

    // FLAGS1 - flags for comparison (result of subtraction)
    sum1_flags.c = sum1_res[`SCR1_XLEN];
    sum1_flags.z = ~|sum1_res[`SCR1_XLEN-1:0];
    sum1_flags.s = sum1_res[`SCR1_XLEN-1];
    sum1_flags.o = (~item.ialu_op1[`SCR1_XLEN-1] &  item.ialu_op2[`SCR1_XLEN-1] &  sum1_res[`SCR1_XLEN-1]) |
                   ( item.ialu_op1[`SCR1_XLEN-1] & ~item.ialu_op2[`SCR1_XLEN-1] & ~sum1_res[`SCR1_XLEN-1]);

    unique case (item.ialu_cmd)
      ialu_tb_pkg::SCR1_IALU_CMD_NONE    : begin
        item.ialu_res    = '0;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_AND     : begin
        item.ialu_res    = item.ialu_op1 & item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_OR      : begin
        item.ialu_res    = item.ialu_op1 | item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_XOR     : begin
        item.ialu_res    = item.ialu_op1 ^ item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_ADD     : begin
        item.ialu_res    = item.ialu_op1 + item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB     : begin
        item.ialu_res    = item.ialu_op1 - item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_LT  : begin
        item.ialu_res    = `SCR1_XLEN'(sum1_flags.s ^ sum1_flags.o);
        item.ialu_cmp    = sum1_flags.s ^ sum1_flags.o;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_LTU : begin
        item.ialu_res    = `SCR1_XLEN'(sum1_flags.c);
        item.ialu_cmp    = sum1_flags.c;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_EQ  : begin
        item.ialu_res    = `SCR1_XLEN'(sum1_flags.z);
        item.ialu_cmp    = sum1_flags.z;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_NE  : begin
        item.ialu_res    = `SCR1_XLEN'(~sum1_flags.z);
        item.ialu_cmp    = ~sum1_flags.z;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_GE  : begin
        item.ialu_res    = `SCR1_XLEN'(~(sum1_flags.s ^ sum1_flags.o));
        item.ialu_cmp    = ~(sum1_flags.s ^ sum1_flags.o);
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SUB_GEU : begin
        item.ialu_res    = `SCR1_XLEN'(~sum1_flags.c);
        item.ialu_cmp    = ~sum1_flags.c;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SLL     : begin
        item.ialu_res    = item.ialu_op1 << item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SRL     : begin
        item.ialu_res    = item.ialu_op1 >> item.ialu_op2;
        item.ialu_cmp    = '0;
      end
      ialu_tb_pkg::SCR1_IALU_CMD_SRA     : begin
        item.ialu_res    = item.ialu_op1 >>> item.ialu_op2;
        item.ialu_cmp    = '0;
      end
    // FIXME: finish
    // `ifdef SCR1_RVM_EXT
    //   ialu_tb_pkg::SCR1_IALU_CMD_MUL     : begin
    //     item.ialu_res    = item.ialu_op1 * item.ialu_op2;
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_MULHU   : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_MULHSU  : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_MULH    : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_DIV     : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_DIVU    : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_REM     : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    //   ialu_tb_pkg::SCR1_IALU_CMD_REMU    : begin
    //     item.ialu_res    =
    //     item.ialu_cmp    =
    //   end
    // `endif  // SCR1_RVM_EXT
      default : `uvm_fatal(get_name(), "Unknown cmd type")
    endcase

  //   typedef enum logic [SCR1_IALU_CMD_WIDTH_E-1:0] {
  //     SCR1_IALU_CMD_NONE  = '0,   // IALU disable
  //     SCR1_IALU_CMD_AND,          // op1 & op2
  //     SCR1_IALU_CMD_OR,           // op1 | op2
  //     SCR1_IALU_CMD_XOR,          // op1 ^ op2
  //     SCR1_IALU_CMD_ADD,          // op1 + op2
  //     SCR1_IALU_CMD_SUB,          // op1 - op2
  //     SCR1_IALU_CMD_SUB_LT,       // op1 < op2
  //     SCR1_IALU_CMD_SUB_LTU,      // op1 u< op2
  //     SCR1_IALU_CMD_SUB_EQ,       // op1 = op2
  //     SCR1_IALU_CMD_SUB_NE,       // op1 != op2
  //     SCR1_IALU_CMD_SUB_GE,       // op1 >= op2
  //     SCR1_IALU_CMD_SUB_GEU,      // op1 u>= op2
  //     SCR1_IALU_CMD_SLL,          // op1 << op2
  //     SCR1_IALU_CMD_SRL,          // op1 >> op2
  //     SCR1_IALU_CMD_SRA           // op1 >>> op2
  // `ifdef SCR1_RVM_EXT
  //     ,
  //     SCR1_IALU_CMD_MUL,          // low(unsig(op1) * unsig(op2))
  //     SCR1_IALU_CMD_MULHU,        // high(unsig(op1) * unsig(op2))
  //     SCR1_IALU_CMD_MULHSU,       // high(op1 * unsig(op2))
  //     SCR1_IALU_CMD_MULH,         // high(op1 * op2)
  //     SCR1_IALU_CMD_DIV,          // op1 / op2
  //     SCR1_IALU_CMD_DIVU,         // op1 u/ op2
  //     SCR1_IALU_CMD_REM,          // op1 % op2
  //     SCR1_IALU_CMD_REMU          // op1 u% op2
  // `endif  // SCR1_RVM_EXT
  // } type_scr1_ialu_cmd_sel_e;

  endfunction : compute_sum1_res


endpackage : ialu_scoreboard_pkg