set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Switches
set_property PACKAGE_PIN V17 [get_ports {enable}]
    set_property IOSTANDARD LVCMOS33 [get_ports {enable}]
    
set_property PACKAGE_PIN W19 [get_ports measure]
    set_property IOSTANDARD LVCMOS33 [get_ports measure]
set_property PACKAGE_PIN T17 [get_ports reset]
    set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN U16 [get_ports {data_valid}]
    set_property IOSTANDARD LVCMOS33 [get_ports {data_valid}]


set_property PACKAGE_PIN J1 [get_ports {trigger}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {trigger}] 
##Sch name = JA2 
set_property PACKAGE_PIN L2 [get_ports {echo}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {echo}]     
##Sch name = JA3 
set_property PACKAGE_PIN J2 [get_ports {buzzer}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {buzzer}]

set_property PACKAGE_PIN W7 [get_ports {cat0}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat0}] 
set_property PACKAGE_PIN W6 [get_ports {cat1}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat1}] 
set_property PACKAGE_PIN U8 [get_ports {cat2}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat2}] 
set_property PACKAGE_PIN V8 [get_ports {cat3}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat3}] 
set_property PACKAGE_PIN U5 [get_ports {cat4}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat4}] 
set_property PACKAGE_PIN V5 [get_ports {cat5}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat5}] 
set_property PACKAGE_PIN U7 [get_ports {cat6}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {cat6}] 

set_property PACKAGE_PIN U2 [get_ports {an[0]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
set_property PACKAGE_PIN V4 [get_ports {an[2]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
set_property PACKAGE_PIN W4 [get_ports {an[3]}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
