module block_pixel(
   input wire [9:0] h_cnt,
   input wire [9:0] v_cnt,
   input wire [9:0] X,
   input wire [9:0] Y,
   input wire [11:0] number,
   output reg [3:0] vgaRed,
   output reg [3:0] vgaGreen,
   output reg [3:0] vgaBlue
   );
   
   always@(*) begin
     if(X<=h_cnt<X+136 && Y<=v_cnt<Y+56) begin
         case (number)
           12'b000000000000 : {vgaRed, vgaGreen, vgaBlue} = 12'h000;  //0
           12'b000000000010 : begin  //2
                                if(h_cnt < X+104 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           12'b000000000100 : begin  //4
                                if(h_cnt < X+104 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+24 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           12'b000000001000 : begin  //8
                                if(h_cnt < X+104 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
                                end else if(h_cnt < X+120) begin              
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;   
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;                
                              end
           12'b000000010000 : begin  //16
                                if(h_cnt < X+88 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin  
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
                              end
           12'b000000100000 : begin  //32
                                if(h_cnt < X+72 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
                              end
           12'b000001000000 : begin  //64
                                if(h_cnt < X+72 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+80) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+24 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
                              end
           12'b000010000000 : begin  //128
                                if(h_cnt < X+56 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+64) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+72) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+80) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           12'b000100000000 : begin  //256
                                if(h_cnt < X+40 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+48) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+56) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+64) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+72) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+80) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin  
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
                              end
           12'b001000000000 : begin  //512
                                if(h_cnt < X+40 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+48) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+56) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+64) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           12'b010000000000 : begin  //1024
                                if(h_cnt < X+24 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+32) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+40) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+48) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+56) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+64) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+72) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+80) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+24 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           12'b100000000000 : begin  //2048
                                if(h_cnt < X+8 || h_cnt >= X+128) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                else if(h_cnt < X+16) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+24) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+32) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+40) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+48) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+56) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+64) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+72) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+80) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+88) begin
                                  if(v_cnt < Y+24 || v_cnt >= Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+96) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+104) begin
                                  {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+112) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+120) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+16) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+24) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+32) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else if(v_cnt < Y+40) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else if(h_cnt < X+128) begin
                                  if(v_cnt < Y+8 || v_cnt >= Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                  else if(v_cnt < Y+48) {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                                  else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                                end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
                              end
           default : {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         endcase
     end else {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
   
endmodule