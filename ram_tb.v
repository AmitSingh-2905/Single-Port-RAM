`include "ram.v"  
`timescale 1ns/1ns
module tb_coincident_ram_1k8;
    reg clk;
    reg we;
    reg [9:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Module instantiation
    coincident_ram_1k8 DUT (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("coincident_ram.vcd");
        $dumpvars(0, tb_coincident_ram_1k8);
        $monitor($time, " clk=%b we=%b addr=%h din=%h dout=%h", clk, we, addr, din, dout);

       
        clk = 0;
        we  = 0;
        addr = 10'd0;
        din = 8'd0;

        #2  we = 1; 
        addr = 10'd21; 
        din = 8'hAA;
        #10 we = 0;

        // Read back from address 21
        #10 addr = 10'd21;

        
        #10 we = 1; addr = 10'd228; din = 8'h5C;
        #10 we = 0;

        // Read back from address 228
        #10 addr = 10'd228;

       
        #10 addr = 10'd1023;

        #10 $finish;
    end
endmodule
