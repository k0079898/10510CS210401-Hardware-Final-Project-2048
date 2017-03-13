# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]	
	
# LEDs
#LD0
set_property PACKAGE_PIN U16 [get_ports {LED[0]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
#LD1
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
#LD2
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
#LD3
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
#LD4
set_property PACKAGE_PIN W18 [get_ports {LED[4]}]                    
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]


	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {display[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]
set_property PACKAGE_PIN W6 [get_ports {display[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]
set_property PACKAGE_PIN U8 [get_ports {display[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]
set_property PACKAGE_PIN V8 [get_ports {display[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]
set_property PACKAGE_PIN U5 [get_ports {display[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[4]}]
set_property PACKAGE_PIN V5 [get_ports {display[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[5]}]
set_property PACKAGE_PIN U7 [get_ports {display[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {display[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {digit[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {digit[0]}]
set_property PACKAGE_PIN U4 [get_ports {digit[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {digit[1]}]
set_property PACKAGE_PIN V4 [get_ports {digit[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {digit[2]}]
set_property PACKAGE_PIN W4 [get_ports {digit[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {digit[3]}]


## Switches
set_property PACKAGE_PIN V17 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

 
##VGA Connector
    set_property PACKAGE_PIN G19 [get_ports {vgaRed[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
    set_property PACKAGE_PIN H19 [get_ports {vgaRed[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
    set_property PACKAGE_PIN J19 [get_ports {vgaRed[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
    set_property PACKAGE_PIN N19 [get_ports {vgaRed[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
    set_property PACKAGE_PIN N18 [get_ports {vgaBlue[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
    set_property PACKAGE_PIN L18 [get_ports {vgaBlue[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
    set_property PACKAGE_PIN K18 [get_ports {vgaBlue[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
    set_property PACKAGE_PIN J18 [get_ports {vgaBlue[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
    set_property PACKAGE_PIN J17 [get_ports {vgaGreen[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
    set_property PACKAGE_PIN H17 [get_ports {vgaGreen[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
    set_property PACKAGE_PIN G17 [get_ports {vgaGreen[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
    set_property PACKAGE_PIN D17 [get_ports {vgaGreen[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
    set_property PACKAGE_PIN P19 [get_ports hsync]
    set_property IOSTANDARD LVCMOS33 [get_ports hsync]
    set_property PACKAGE_PIN R19 [get_ports vsync]
    set_property IOSTANDARD LVCMOS33 [get_ports vsync] 
 
#USB HID (PS/2)
set_property PACKAGE_PIN C17 [get_ports PS2_CLK]						
	set_property IOSTANDARD LVCMOS33 [get_ports PS2_CLK]
	set_property PULLUP true [get_ports PS2_CLK]
set_property PACKAGE_PIN B17 [get_ports PS2_DATA]					
	set_property IOSTANDARD LVCMOS33 [get_ports PS2_DATA]	
	set_property PULLUP true [get_ports PS2_DATA]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
