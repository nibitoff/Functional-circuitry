# -----------------------internal clock -> CLK -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
create_clock -add -name clk -period 10.00 -waveform {0 5} [get_ports {clk}];

# -----------------------push button -> RST -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN P18 [get_ports rst]

# -----------------------slide switchers -> SW[1:0] -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN U12 [get_ports sw[1]]
set_property PACKAGE_PIN U11 [get_ports sw[0]]

# -----------------------slide switcher -> VALID_DATA -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports valid_data]
set_property PACKAGE_PIN V10 [get_ports valid_data]

# -----------------------slide switchers -> DATA[7:0] -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports {data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[0]}]

set_property PACKAGE_PIN J15 [get_ports {data[0]}]
set_property PACKAGE_PIN L16 [get_ports {data[1]}]
set_property PACKAGE_PIN M13 [get_ports {data[2]}]
set_property PACKAGE_PIN R15 [get_ports {data[3]}]
set_property PACKAGE_PIN R17 [get_ports {data[4]}]
set_property PACKAGE_PIN T18 [get_ports {data[5]}]
set_property PACKAGE_PIN U18 [get_ports {data[6]}]
set_property PACKAGE_PIN R13 [get_ports {data[7]}]


# -----------------------OUT[7:0] -> leds -----------------------
set_property IOSTANDARD LVCMOS33 [get_ports {out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[0]}]

set_property PACKAGE_PIN H17 [get_ports {out[0]}]
set_property PACKAGE_PIN K15 [get_ports {out[1]}]
set_property PACKAGE_PIN J13 [get_ports {out[2]}]
set_property PACKAGE_PIN N14 [get_ports {out[3]}]
set_property PACKAGE_PIN R18 [get_ports {out[4]}]
set_property PACKAGE_PIN V17 [get_ports {out[5]}]
set_property PACKAGE_PIN U17 [get_ports {out[6]}]
set_property PACKAGE_PIN U16 [get_ports {out[7]}]