`timescale 1ns / 1ps

// George Smart, M1GEO
// 14/04/2022

module colour_bar(
    input clk,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue,
    input [15:0] sx
    );

reg [3:0] bar;

always @ (posedge clk) begin
    if (sx < 128)
        bar <= 4'd0;
    else if (sx < 256)
        bar <= 4'd1;
    else if (sx < 384)
        bar <= 4'd2;
    else if (sx < 512)
        bar <= 4'd3;
    else if (sx < 640)
        bar <= 4'd4;
    else if (sx < 768)
        bar <= 4'd5;
    else if (sx < 896)
        bar <= 4'd6;
    else if (sx < 1024)
        bar <= 4'd7;
    else if (sx < 1152)
        bar <= 4'd8;
    else 
        bar <= 4'd9;
end

always @ (posedge clk) begin
    case (bar)
        4'd0: begin
            red <=   8'd104;
            green <= 8'd104;
            blue <=  8'd104;
            end
        4'd1: begin
            red <=   8'd180;
            green <= 8'd180;
            blue <=  8'd180;
            end
        4'd2: begin
            red <=   8'd180;
            green <= 8'd180;
            blue <=  8'd16;
            end
        4'd3: begin
            red <=   8'd16;
            green <= 8'd180;
            blue <=  8'd180;
            end
        4'd4: begin
            red <=   8'd16;
            green <= 8'd180;
            blue <=  8'd16;
            end
        4'd5: begin
            red <=   8'd180;
            green <= 8'd16;
            blue <=  8'd180;
            end
        4'd6: begin
            red <=   8'd180;
            green <= 8'd16;
            blue <=  8'd16;
            end
        4'd7: begin
            red <=   8'd16;
            green <= 8'd16;
            blue <=  8'd180;
            end
         4'd8: begin
            red <=   8'd16;
            green <= 8'd16;
            blue <=  8'd16;
            end
        4'd9: begin
            red <=   8'd235;
            green <= 8'd235;
            blue <=  8'd235;
            end
        default: begin
            red <=   8'd0;
            green <= 8'd0;
            blue <=  8'd0;
            end
    endcase
end

endmodule
