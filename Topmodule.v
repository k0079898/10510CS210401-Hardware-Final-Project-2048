module Topmodule(
    input  wire clk,
    input  wire rst,
    inout  wire PS2_DATA,
    inout  wire PS2_CLK,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output [6:0] display,
    output [3:0] digit,
    output [4:0] LED
     );

    wire up, down, left, right, Enter, Reset, win, GG, clk_25MHz;
    wire [11:0] number_0, number_1, number_2, number_3, number_4, number_5, number_6, number_7, number_8, number_9, number_10, number_11, number_12, number_13, number_14, number_15;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

    assign LED[4] = up;
    assign LED[3] = down;
    assign LED[2] = left;
    assign LED[1] = right;
    assign LED[0] = Enter;
    
    SevenSegment seven_seg (
		.display(display),
		.digit(digit),
		.clk(clk)
	);
	
	KeyboradInput key (
	    .up(up),
        .down(down),
        .left(left),
        .right(right),
        .Enter(Enter),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(~rst),
        .clk(clk)
    );
	
	
	Game game_state(
	    .clk(clk),
	    .up(up),
	    .down(down), 
	    .left(left),
	    .right(right),
	    .Enter(Enter),
	    .Reset(~rst), 
	    .win(win),
	    .GG(GG),
	    .number_0(number_0),
	    .number_1(number_1),
	    .number_2(number_2),
	    .number_3(number_3),
	    .number_4(number_4),
	    .number_5(number_5),
	    .number_6(number_6),
	    .number_7(number_7),
	    .number_8(number_8),
	    .number_9(number_9),
	    .number_10(number_10),
	    .number_11(number_11),
	    .number_12(number_12),
	    .number_13(number_13),
	    .number_14(number_14),
	    .number_15(number_15)
	);

    clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz)
    );
    
    vga_controller vga_inst(
      .pclk(clk_25MHz),
      .reset(~rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
    
   
   pixel_gen pixel_gen_inst(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .valid(valid),
        .win(win),
        .GG(GG),
        .number_0(number_0),
        .number_1(number_1),
        .number_2(number_2),
        .number_3(number_3),
        .number_4(number_4),
        .number_5(number_5),
        .number_6(number_6),
        .number_7(number_7),
        .number_8(number_8),
        .number_9(number_9),
        .number_10(number_10),
        .number_11(number_11),
        .number_12(number_12),
        .number_13(number_13),
        .number_14(number_14),
        .number_15(number_15),
        .vgaRed(vgaRed),
        .vgaGreen(vgaGreen),
        .vgaBlue(vgaBlue)
     );
    


endmodule