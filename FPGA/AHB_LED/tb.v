`timescale 1ns/1ps

module tb;

  // Global signals
  reg HCLK;
  reg HRESETn;

  // Master side signals
  reg HSEL;
  reg HREADY;
  reg [31:0] HADDR;
  reg [1:0]  HTRANS;
  reg HWRITE;
  reg [2:0]  HSIZE;
  reg [31:0] HWDATA;

  // Slave response signals
  wire HREADYOUT;
  wire [31:0] HRDATA;

  // LED output
  wire [7:0] LED;

  // Clock generation
  initial begin
    HCLK = 0;
    forever #5 HCLK = ~HCLK; // 100 MHz clock
  end

  // Reset
  initial begin
    HRESETn = 0;
    #20 HRESETn = 1;
  end

  // Stimulus
  initial begin
    HSEL    = 1'b0;
    HREADY  = 1'b0;
    HADDR   = 32'h0;
    HTRANS  = 2'b00;
    HWRITE  = 1'b0;
    HSIZE   = 3'b000;
    HWDATA  = 32'h0;

    // Wait for reset deassertion
    @(posedge HRESETn);

    // Example transactions
    @(posedge HCLK);
    HSEL   = 1'b1;
    HREADY = 1'b1;
    HTRANS = 2'b11;
    HWRITE = 1'b1;
    HSIZE  = 3'b001;

    #10 HWDATA = 32'h000;
    #10 HWDATA = 32'h001;
    #10 HWDATA = 32'h010;
    #10 HWDATA = 32'h100;
    #10 HWDATA = 32'h101;
    #10 HWDATA = 32'h111;

    #50 $finish;
  end

  // DUT instantiation
  AHB2LED led1 (
    .HSEL(HSEL),
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HREADY(HREADY),
    .HADDR(HADDR),
    .HTRANS(HTRANS),
    .HWRITE(HWRITE),
    .HSIZE(HSIZE),
    .HWDATA(HWDATA),
    .HREADYOUT(HREADYOUT),
    .HRDATA(HRDATA),
    .LED(LED)
  );

  // VCD dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule

