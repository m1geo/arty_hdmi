`timescale 1ns / 1ps

// George Smart, M1GEO
// 14/04/2022

module img_rom(
    input clk,
    output reg bit,
    input [15:0] sx,
    input [15:0] sy
    );
    
reg [1:0] ROM [0:32767];

// ROM is a single bit (but using 2 bits to keep Vivado happy) - only LSB is used.
// Image is 512x64. Data is stored pixel by pixel, from 0x0 to 511x63
//   with X values increasing every pixel, Y steps every 512 pixels.
initial begin
    $readmemb("test2_1d.mem", ROM);
end

always @ (posedge clk) begin
    bit <= ~ROM[(sy*512)+sx][0];
end

endmodule
