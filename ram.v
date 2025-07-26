module coincident_ram_1k8 (
    input wire clk,
    input wire we,             // Write Enable
    input wire [9:0] addr,     // 10-bit address = 5 row + 5 col(co-incident decoding)
    input wire [7:0] din,      // 8-bit data input
    output reg [7:0] dout      // 8-bit data output(useful in case of read)
);

    // Split address -- to make less use of nand gates in hardware
    wire [4:0] row_addr = addr[9:5];    // Top 5 bits for row
    wire [4:0] col_addr = addr[4:0];    // Bottom 5 bits for col

    // Memory: 32 rows × 32 cols of 8-bit values instead of the mem[0:1023]
    reg [7:0] mem [0:31][0:31];

    // Coincident decoding: Write and Read
    always @(posedge clk) begin
        if (we)
            mem[row_addr][col_addr] <= din; // Write to [row][col]
       
        dout <= mem[row_addr][col_addr];  // Read from [row][col]
    end

endmodule
