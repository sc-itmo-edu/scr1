module ialu_wrapper (
    ialu_sum1_if           sum1_if
  );

  // TODO: instantiate DUT
  scr1_pipe_ialu i_ialu(
  `ifdef SCR1_RVM_EXT
      // Common
      .clk                (sum1_if.clk),
      .rst_n              (sum1_if.rst_n),
      .ialu_vd            (sum1_if.ialu_vd),
      .ialu_rdy           (sum1_if.ialu_rdy),
  `endif // SCR1_RVM_EXT

      // IALU
      .ialu_op1           (sum1_if.ialu_op1),
      .ialu_op2           (sum1_if.ialu_op2),
      .ialu_cmd           (sum1_if.ialu_cmd),
      .ialu_res           (sum1_if.ialu_res),
      .ialu_cmp           (sum1_if.ialu_cmp),

      // SUM2
      .ialu_sum2_op1      ('0),
      .ialu_sum2_op2      ('0),
      .ialu_sum2_res      ()
  );

endmodule : ialu_wrapper