module tb_myCPU;
  reg cpu_clk;
  reg cpu_rst;


  wire [31:0] perip_addr;
  wire        perip_wen;
  wire [1:0]  perip_mask;
  wire [31:0] perip_wdata;
  wire [31:0] irom_addr;
  wire [31:0] irom_data;
  wire [31:0] perip_rdata;
/*  wire [31:0] x26;
  wire [31:0] x27;
  wire [31:0] x3;
  reg  [31:0] tmp;

assign x3  = tb_myCPU.myCPU_inst.RegFile_inst.regs[3];
assign x26 = tb_myCPU.myCPU_inst.RegFile_inst.regs[26];
assign x27 = tb_myCPU.myCPU_inst.RegFile_inst.regs[27];
*/  
  myCPU  myCPU_inst (
    .cpu_rst(cpu_rst),
    .cpu_clk(cpu_clk),
    .irom_addr(irom_addr),
    .irom_data(irom_data),
    .perip_addr(perip_addr),
    .perip_wen(perip_wen),
    .perip_mask(perip_mask),
    .perip_wdata(perip_wdata),
    .perip_rdata(perip_rdata)
  );

  ROM  ROM_inst (
    .instr_addr(irom_addr),
    .instr_out(irom_data)
  );

  RAM  RAM_inst (
    .clk(cpu_clk),
    .perip_addr(perip_addr[17:0]),
    .perip_wdata(perip_wdata),
    .perip_mask(perip_mask),
    .dram_wen(dram_wen),
    .perip_rdata(perip_rdata)
  );

  always #5 cpu_clk = ~cpu_clk;

  initial begin
    cpu_clk         = 1'b0;
    cpu_rst        = 1'b1;
    // 复位阶段
    #100;
    cpu_rst        = 1'b0;
end
/*

// =============================================
integer i;  

initial begin
    forever begin
        tmp = x3;
        @(posedge cpu_clk);

        if (tmp != x3) begin
            $display("test[%0d]", x3);
        end
        else if (x26 == 32'h1) begin
            repeat(10) @(posedge cpu_clk);

            if (x27 == 32'h1) begin
                $display("\n");
                repeat(3) $display("*************************************");
                $display("\n");
                $display("%s  test passed !!!!! ", "C:/Users/darre/Documents/ARC_RISC-V_CPU/tests/test1.txt");
                $display("\n");
                repeat(3) $display("*************************************");
                $display("\n");

                for (i = 0; i < 32; i = i + 1) begin
                    $display("%0d register value is %0d",
                        i,
                        tb_myCPU.myCPU_inst.RegFile_inst.regs[i]);
                end
                $finish;
            end
            else begin
                repeat(3) $display("*************************************");
                $display("\n");
                $display("%s  test failed !!!!! ", "C:/Users/darre/Documents/ARC_RISC-V_CPU/tests/test1.txt");
                repeat(3) $display("*************************************");
                $display("The failed test case is test[%0d]", x3);

                for (i = 0; i < 32; i = i + 1) begin
                    $display("%0d register value is %0d",
                        i,
                        tb_myCPU.myCPU_inst.RegFile_inst.regs[i]);
                end
            end
        end
    end
end
*/
endmodule


