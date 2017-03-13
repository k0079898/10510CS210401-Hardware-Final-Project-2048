module Game(clk, up, down, left, right, Enter, Reset, win, GG, number_0, number_1, number_2, number_3, number_4, number_5, number_6, number_7, number_8, number_9, number_10, number_11, number_12, number_13, number_14, number_15);
    input clk, up, down, left, right, Enter, Reset;
    output reg win, GG;
    output wire [11:0] number_0, number_1, number_2, number_3, number_4, number_5, number_6, number_7, number_8, number_9, number_10, number_11, number_12, number_13, number_14, number_15;
    
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    //integer m, n;
    wire RTC_ds;
    
    reg [11:0] number[0:15];
    reg [1:0]  state, i;
    reg        notLose, initialstart;
    reg [23:0] divider_ds;
    
    always@ (posedge clk) begin
      if(divider_ds==10000000) divider_ds <= 0;
      else divider_ds <= divider_ds + 1;
    end

    assign RTC_ds = divider_ds[23];
    
    reg [3:0] random1, random2;
    always @(posedge clk) begin
      random1 <= { random1[2:0], random1[3] ^ random1[2] };
      random2 <= { random2[3:1], random2[1] ^ random1[0] };
    end 
    
    always@(posedge RTC_ds) begin
        if(Reset) begin
            state = S0;
            win = 0;
            GG = 0;
            initialstart = 0;
        end else begin
            case (state)
                S0 : begin
                       number[0]  = 12'b000000000000;
                       number[1]  = 12'b000000000000;
                       number[2]  = 12'b000000000000;
                       number[3]  = 12'b000000000000;
                       number[4]  = 12'b000000000000;
                       number[5]  = 12'b000000000000;
                       number[6]  = 12'b000000000000;
                       number[7]  = 12'b000000000000;
                       number[8]  = 12'b000000000000;
                       number[9]  = 12'b000000000000;
                       number[10] = 12'b000000000000;
                       number[11] = 12'b000000000000;
                       number[12] = 12'b000000000000;
                       number[13] = 12'b000000000000;
                       number[14] = 12'b000000000000;
                       number[15] = 12'b000000000000;
                       initialstart = 0;
                       if(Enter) state = S1;
                       else state = S0;
                     end
                S1 : begin
                       if(initialstart == 0) begin
                         //if(random1 != random2) begin
                           number[2] = 12'b000000000010;
                           number[6] = 12'b000000000010;
                           initialstart = 1;
                           state = S2;
                        // end else state = S1;
                       end else begin
                         if(number[random1] != 12'b000000000000) begin
                           number[random1] = 12'b000000000010;
                           state = S2;
                         end else state = S1;
                       end
                     end
                /*
                         if(initialstart == 0) begin
                             //if(random1 != random2) begin
                                 number[2] = 12'b000000000010;
                                 number[7] = 12'b000000000010;
                                 state <= S2;
                                 initialstart <= 1;
                             //end else state <= S1;
                         end else begin
                             //if(number[00]==12'b000000000000) begin
                                 state <= S2;
                                 number[15] = 2;// + (random2[1] * 2); 
                         /        if(number[00]!=12'b000000000000 && number[01]!=12'b000000000000 && number[02]!=12'b000000000000 && number[03]!=12'b000000000000
                                    && number[04]!=12'b000000000000 && number[05]!=12'b000000000000 && number[06]!=12'b000000000000 && number[07]!=12'b000000000000
                                    && number[08]!=12'b000000000000 && number[09]!=12'b000000000000 && number[10]!=12'b000000000000 && number[11]!=12'b000000000000
                                    && number[12]!=12'b000000000000 && number[13]!=12'b000000000000 && number[14]!=12'b000000000000 && number[15]!=12'b000000000000) begin
                                     notLose <= 0;
                                     for(m=0;m<12;m=m+1)
                                         if(number[m]==number[m+4]) notLose <= 1;
                                     if(notLose == 0) begin
                                         for(m=0;m<13;m=m+4)
                                             for(n=0;n<3;n=n+1)
                                                 if(number[m+n]==number[m+n+1]) notLose <= 1;
                                     end 
                                 end else notLose <= 1;
                                 if(notLose == 1) state = S2;
                                 else begin
                                     GG <= 1;
                                     state <= S3;
                                 end 
                         //    end else state <= S2;
                         end
                     end */
                S2 : begin
                         if(up) begin
                             i = 0;
                             repeat(4) begin
                                 if(number[0+i] == number[4+i] && number[8+i] == number[12+i]) begin
                                     number[0+i] = number[0+i] + number[4+i];
                                     number[4+i] = number[8+i] + number[12+i];
                                     number[8+i] = 12'b000000000000;
                                     number[12+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[04+i];
                                         number[4+i] = 12'b000000000000;
                                     end
                                     if(number[0+i]==2048 || number[4+i]==2048) win = 1;
                                 end else if(number[0+i]==number[4+i]) begin
                                     number[0+i] = number[0+i] + number[4+i];
                                     number[4+i] = number[8+i];
                                     number[8+i] = number[12+i];
                                     number[12+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000 && number[4+i] == 12'b000000000000) begin
                                         number[0+i] = number[8+i];
                                         number[4+i] = number[12+i];
                                         number[8+i] = 12'b000000000000;
                                     end else if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[4+i];
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end else if(number[4+i] == 12'b000000000000) begin
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end
                                     if(number[0+i]==2048) win = 1;
                                 end else if(number[4+i]==number[8+i]) begin
                                     number[4+i] = number[4+i] + number[8+i];
                                     number[8+i] = number[12+i];
                                     number[12+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[4+i];
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end else if(number[4+i] == 12'b000000000000) begin
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end
                                     if(number[0+i]==2048 || number[4+i]==2048) win = 1;
                                 end else if(number[8+i]==number[12+i] && number[8+i]!=12'b000000000000 && number[12+i]!=12'b000000000000) begin
                                     number[8+i] = number[08+i] + number[12+i];
                                     number[12+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[4+i];
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end else if(number[04+i] == 12'b000000000000) begin
                                         number[4+i] = number[8+i];
                                         number[8+i] = number[12+i];
                                     end
                                     if(number[4+i]==2048 || number[8+i]==2048) win = 1;
                                 end
                                 i = i + 1;
                             end
                             if(win==1) state = S3;
                             else state = S1;
                         end else if(down) begin
                             i = 0;
                             repeat(4) begin
                                 if(number[12+i]==number[8+i] && number[4+i]==number[0+i]) begin
                                     number[12+i] = number[12+i] + number[8+i];
                                     number[8+i] = number[4+i] + number[0+i];
                                     number[4+i] = 12'b000000000000;
                                     number[0+i] = 12'b000000000000;
                                     if(number[12+i] == 12'b000000000000) begin
                                         number[12+i] = number[8+i];
                                         number[8+i] = 12'b000000000000;
                                     end
                                     if(number[12+i]==2048 || number[8+i]==2048) win = 1;
                                 end else if(number[12+i]==number[8+i]) begin
                                     number[12+i] = number[12+i] + number[8+i];
                                     number[8+i] = number[4+i];
                                     number[4+i] = number[0+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[12+i] == 12'b000000000000 && number[8+i] == 12'b000000000000) begin
                                         number[12+i] = number[4+i];
                                         number[8+i] = number[0+i];
                                         number[4+i] = 12'b000000000000;
                                     end else if(number[12+i] == 12'b000000000000) begin
                                         number[12+i] = number[8+i];
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end else if(number[8+i] == 12'b000000000000) begin
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end
                                     if(number[12+i]==2048) win = 1;
                                 end else if(number[8+i]==number[4+i]) begin
                                     number[8+i] = number[8+i] + number[4+i];
                                     number[4+i] = number[0+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[12+i] == 12'b000000000000) begin
                                         number[12+i] = number[8+i];
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end else if(number[08+i] == 12'b000000000000) begin
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end
                                     if(number[12+i]==2048 || number[8+i]==2048) win = 1;
                                 end else if(number[4+i]==number[0+i] && number[4+i]!=12'b000000000000 && number[1+i]!=12'b000000000000) begin
                                     number[4+i] = number[4+i] + number[0+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[12+i] == 12'b000000000000) begin
                                         number[12+i] = number[8+i];
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end else if(number[08+i] == 12'b000000000000) begin
                                         number[8+i] = number[4+i];
                                         number[4+i] = number[0+i];
                                     end
                                     if(number[8+i]==2048 || number[4+i]==2048) win = 1;
                                 end
                                 i = i + 1;
                             end
                             if(win==1) state = S3;
                             else state = S1;
                         end else if(left) begin
                             i = 0;
                             repeat(4) begin
                                 if(number[0+i]==number[1+i] && number[2+i]==number[3+i]) begin
                                     number[0+i] = number[00+i] + number[01+i];
                                     number[1+i] = number[02+i] + number[03+i];
                                     number[2+i] = 12'b000000000000;
                                     number[3+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[1+i];
                                         number[1+i] = 12'b000000000000;
                                     end
                                     if(number[0+i]==2048 || number[1+i]==2048) win = 1;
                                 end else if(number[0+i]==number[1+i]) begin
                                     number[0+i] = number[0+i] + number[1+i];
                                     number[1+i] = number[2+i];
                                     number[2+i] = number[3+i];
                                     number[3+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000 && number[1+i] == 12'b000000000000) begin
                                         number[0+i] = number[2+i];
                                         number[1+i] = number[3+i];
                                         number[2+i] = 12'b000000000000;
                                     end else if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[1+i];
                                         number[1+i] = number[2+i];
                                         number[2+i] = number[3+i];
                                     end else if(number[1+i] == 12'b000000000000) begin
                                         number[1+i] = number[2+i];
                                         number[2+i] = number[3+i];
                                     end
                                     if(number[0+i]==2048) win = 1;
                                 end else if(number[1+i]==number[2+i]) begin
                                     number[1+i] = number[1+i] + number[2+i];
                                     number[2+i] = number[3+i];
                                     number[3+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[1+i];
                                         number[1+i] = number[2+i];
                                         number[2+i] = number[3+i];
                                     end else if(number[1+i] == 12'b000000000000) begin
                                         number[1+i] = number[2+i];
                                         number[2+i] = number[3+i];
                                     end
                                     if(number[0+i]==2048 || number[1+i]==2048) win = 1;
                                 end else if(number[2+i]==number[3+i] && number[2+i]!=12'b000000000000 && number[3+i]!=12'b000000000000) begin
                                     number[2+i] = number[2+i] + number[3+i];
                                     number[3+i] = 12'b000000000000;
                                     if(number[0+i] == 12'b000000000000) begin
                                         number[0+i] = number[01+i];
                                         number[1+i] = number[02+i];
                                         number[2+i] = number[03+i];
                                     end else if(number[1+i] == 12'b000000000000) begin
                                         number[1+i] = number[2+i];
                                         number[2+i] = number[3+i];
                                     end
                                     if(number[1+i]==2048 || number[2+i]==2048) win = 1;
                                 end
                                 i = i + 4;
                             end
                             if(win==1) state = S3;
                             else state = S1;
                         end else if(right) begin
                             i = 0;
                             repeat(4) begin
                                 if(number[3+i]==number[2+i] && number[1+i]==number[0+i]) begin
                                     number[3+i] = number[3+i] + number[02+i];
                                     number[2+i] = number[1+i] + number[0+i];
                                     number[1+i] = 12'b000000000000;
                                     number[0+i] = 12'b000000000000;
                                     if(number[3+i] == 12'b000000000000) begin
                                         number[3+i] = number[2+i];
                                         number[2+i] = 12'b000000000000;
                                     end
                                     if(number[3+i]==2048 || number[2+i]==2048) win = 1;
                                 end else if(number[3+i]==number[2+i]) begin
                                     number[3+i] = number[3+i] + number[2+i];
                                     number[2+i] = number[2+i];
                                     number[1+i] = number[0+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[3+i] == 12'b000000000000 && number[2+i] == 12'b000000000000) begin
                                         number[3+i] = number[1+i];
                                         number[2+i] = number[0+i];
                                         number[1+i] = 12'b000000000000;
                                     end else if(number[3+i] == 12'b000000000000) begin
                                         number[3+i] = number[2+i];
                                         number[2+i] = number[1+i];
                                         number[1+i] = number[0+i]; 
                                     end else if(number[02+i] == 12'b000000000000) begin
                                         number[2+i] = number[1+i];
                                         number[1+i] = number[0+i]; 
                                     end 
                                     if(number[3+i]==2048) win = 1;
                                 end else if(number[2+i]==number[1+i]) begin
                                     number[2+i] = number[2+i] + number[1+i];
                                     number[1+i] = number[00+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[3+i] == 12'b000000000000) begin
                                         number[3+i] = number[2+i];
                                         number[2+i] = number[1+i];
                                         number[1+i] = number[0+i];
                                     end else if(number[2+i] == 12'b000000000000) begin
                                         number[2+i] = number[1+i];
                                         number[1+i] = number[0+i];
                                     end 
                                     if(number[3+i]==2048 || number[2+i]==2048) win = 1;
                                 end else if(number[1+i]==number[0+i] && number[01+i]!=12'b000000000000 && number[0+i]!=12'b000000000000) begin
                                     number[1+i] = number[01+i] + number[0+i];
                                     number[0+i] = 12'b000000000000;
                                     if(number[3+i] == 12'b000000000000) begin
                                         number[3+i] = number[02+i];
                                         number[2+i] = number[01+i];
                                         number[1+i] = number[00+i];
                                     end else if(number[2+i] == 12'b000000000000) begin
                                         number[2+i] = number[1+i];
                                         number[1+i] = number[0+i];
                                     end
                                     if(number[2+i]==2048 || number[1+i]==2048) win = 1;
                                 end
                                 i = i + 4;
                             end
                             if(win==1) state = S3;
                             else state = S1;
                         end else state = S2;
                     end
                S3 : if(Enter==1) state = S0;
                     else state = S3;
            endcase
        end
    end
  
    assign number_0  = number[0];
    assign number_1  = number[1];
    assign number_2  = number[2];
    assign number_3  = number[3];
    assign number_4  = number[4];
    assign number_5  = number[5];
    assign number_6  = number[6];
    assign number_7  = number[7];
    assign number_8  = number[8];
    assign number_9  = number[9];
    assign number_10 = number[10];
    assign number_11 = number[11];
    assign number_12 = number[12];
    assign number_13 = number[13];
    assign number_14 = number[14];
    assign number_15 = number[15];
    
endmodule
