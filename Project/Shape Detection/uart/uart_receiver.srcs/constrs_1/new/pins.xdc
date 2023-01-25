# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


set_property PACKAGE_PIN N3 [get_ports {cir}]
    set_property IOSTANDARD LVCMOS33 [get_ports {cir}]
set_property PACKAGE_PIN P1 [get_ports {rec}]
    set_property IOSTANDARD LVCMOS33 [get_ports {rec}]
set_property PACKAGE_PIN L1 [get_ports {tr}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tr}]
    
set_property PACKAGE_PIN B18 [get_ports rx]
    set_property IOSTANDARD LVCMOS33 [get_ports rx]

    
# Switches
set_property PACKAGE_PIN V17 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]