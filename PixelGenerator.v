module pixel_gen(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input wire valid,
   input wire win,
   input wire GG,
   input wire [11:0] number_0,
   input wire [11:0] number_1,
   input wire [11:0] number_2,
   input wire [11:0] number_3,
   input wire [11:0] number_4,
   input wire [11:0] number_5,
   input wire [11:0] number_6,
   input wire [11:0] number_7,
   input wire [11:0] number_8,
   input wire [11:0] number_9,
   input wire [11:0] number_10,
   input wire [11:0] number_11,
   input wire [11:0] number_12,
   input wire [11:0] number_13,
   input wire [11:0] number_14,
   input wire [11:0] number_15,
   output reg [3:0] vgaRed,
   output reg [3:0] vgaGreen,
   output reg [3:0] vgaBlue
   );
   
   wire [3:0] blockR_0, blockR_1, blockR_2, blockR_3, blockR_4, blockR_5, blockR_6, blockR_7, blockR_8, blockR_9, blockR_10, blockR_11, blockR_12, blockR_13, blockR_14, blockR_15;
   wire [3:0] blockG_0, blockG_1, blockG_2, blockG_3, blockG_4, blockG_5, blockG_6, blockG_7, blockG_8, blockG_9, blockG_10, blockG_11, blockG_12, blockG_13, blockG_14, blockG_15;
   wire [3:0] blockB_0, blockB_1, blockB_2, blockB_3, blockB_4, blockB_5, blockB_6, blockB_7, blockB_8, blockB_9, blockB_10, blockB_11, blockB_12, blockB_13, blockB_14, blockB_15;
   
   block_pixel B00(h_cnt, v_cnt,  36, 116,  number_0,  blockR_0,  blockG_0,  blockB_0);
   block_pixel B01(h_cnt, v_cnt, 180, 116,  number_1,  blockR_1,  blockG_1,  blockB_1);
   block_pixel B02(h_cnt, v_cnt, 324, 116,  number_2,  blockR_2,  blockG_2,  blockB_2);
   block_pixel B03(h_cnt, v_cnt, 468, 116,  number_3,  blockR_3,  blockG_3,  blockB_3);
   block_pixel B04(h_cnt, v_cnt,  36, 180,  number_4,  blockR_4,  blockG_4,  blockB_4);
   block_pixel B05(h_cnt, v_cnt, 180, 180,  number_5,  blockR_5,  blockG_5,  blockB_5);
   block_pixel B06(h_cnt, v_cnt, 324, 180,  number_6,  blockR_6,  blockG_6,  blockB_6);
   block_pixel B07(h_cnt, v_cnt, 468, 180,  number_7,  blockR_7,  blockG_7,  blockB_7);
   block_pixel B08(h_cnt, v_cnt,  36, 244,  number_8,  blockR_8,  blockG_8,  blockB_8);
   block_pixel B09(h_cnt, v_cnt, 180, 244,  number_9,  blockR_9,  blockG_9,  blockB_9);
   block_pixel B10(h_cnt, v_cnt, 324, 244, number_10, blockR_10, blockG_10, blockB_10);
   block_pixel B11(h_cnt, v_cnt, 468, 244, number_11, blockR_11, blockG_11, blockB_11);
   block_pixel B12(h_cnt, v_cnt,  36, 308, number_12, blockR_12, blockG_12, blockB_12);
   block_pixel B13(h_cnt, v_cnt, 180, 308, number_13, blockR_13, blockG_13, blockB_13);
   block_pixel B14(h_cnt, v_cnt, 324, 308, number_14, blockR_14, blockG_14, blockB_14);
   block_pixel B15(h_cnt, v_cnt, 468, 308, number_15, blockR_15, blockG_15, blockB_15);
   
   always @(*) begin
     if(valid==1) begin
         if(h_cnt < 28 || h_cnt >= 612) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
         else if(h_cnt < 36) begin
             if(v_cnt < 108 || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
             else {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         end else if(h_cnt < 172) begin
             if(v_cnt < 108  || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
             else if(v_cnt < 116) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 172) {vgaRed, vgaGreen, vgaBlue} = {blockR_0, blockG_0, blockB_0};
             else if(v_cnt < 180) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 236) {vgaRed, vgaGreen, vgaBlue} = {blockR_4, blockG_4, blockB_4};
             else if(v_cnt < 244) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 300) {vgaRed, vgaGreen, vgaBlue} = {blockR_8, blockG_8, blockB_8};
             else if(v_cnt < 308) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 364) {vgaRed, vgaGreen, vgaBlue} = {blockR_12, blockG_12, blockB_12};
             else if(v_cnt < 372) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end else if(h_cnt < 180) begin
             if(v_cnt < 108 || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
             else {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         end else if(h_cnt < 316) begin
             if(v_cnt < 108  || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
             else if(v_cnt < 116) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 172) {vgaRed, vgaGreen, vgaBlue} = {blockR_1, blockG_1, blockB_1};
             else if(v_cnt < 180) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 236) {vgaRed, vgaGreen, vgaBlue} = {blockR_5, blockG_5, blockB_5};
             else if(v_cnt < 244) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 300) {vgaRed, vgaGreen, vgaBlue} = {blockR_9, blockG_9, blockB_9};
             else if(v_cnt < 308) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 364) {vgaRed, vgaGreen, vgaBlue} = {blockR_13, blockG_13, blockB_13};
             else if(v_cnt < 372) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end else if(h_cnt < 324) begin
             if(v_cnt < 108 || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
             else {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         end else if(h_cnt < 460) begin
             if(v_cnt < 108  || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
             else if(v_cnt < 116) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 172) {vgaRed, vgaGreen, vgaBlue} = {blockR_2, blockG_2, blockB_2};
             else if(v_cnt < 180) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 236) {vgaRed, vgaGreen, vgaBlue} = {blockR_6, blockG_6, blockB_6};
             else if(v_cnt < 244) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 300) {vgaRed, vgaGreen, vgaBlue} = {blockR_10, blockG_10, blockB_10};
             else if(v_cnt < 308) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 364) {vgaRed, vgaGreen, vgaBlue} = {blockR_14, blockG_14, blockB_14};
             else if(v_cnt < 372) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end else if(h_cnt < 468) begin
             if(v_cnt < 108 || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
             else {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         end else if(h_cnt < 604) begin
             if(v_cnt < 108  || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
             else if(v_cnt < 116) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 172) {vgaRed, vgaGreen, vgaBlue} = {blockR_3, blockG_3, blockB_3};
             else if(v_cnt < 180) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 236) {vgaRed, vgaGreen, vgaBlue} = {blockR_7, blockG_7, blockB_7};
             else if(v_cnt < 244) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 300) {vgaRed, vgaGreen, vgaBlue} = {blockR_11, blockG_11, blockB_11};
             else if(v_cnt < 308) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else if(v_cnt < 364) {vgaRed, vgaGreen, vgaBlue} = {blockR_15, blockG_15, blockB_15};
             else if(v_cnt < 372) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
             else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end else if(h_cnt < 612) begin
             if(v_cnt < 108 || v_cnt >= 372) {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
             else {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
endmodule
