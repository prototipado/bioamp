EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nxp_armmcu
LIBS:ftdi
LIBS:biopotenciales
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Xicor
LIBS:Zilog
LIBS:biblioteca_vac
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 700  850  2450 2150
U 56B0A266
F0 "Entradas Analogicas" 60
F1 "entradas_analogicas.sch" 60
F2 "IN6-" O R 3150 1350 60 
F3 "IN6+" O R 3150 1425 60 
F4 "IN5-" O R 3150 1500 60 
F5 "IN5+" O R 3150 1575 60 
F6 "IN4-" O R 3150 1650 60 
F7 "IN4+" O R 3150 1725 60 
F8 "IN3-" O R 3150 1800 60 
F9 "IN3+" O R 3150 1875 60 
F10 "IN2-" O R 3150 1950 60 
F11 "IN2+" O R 3150 2025 60 
F12 "IN1-" O R 3150 2100 60 
F13 "IN1+" O R 3150 2175 60 
F14 "IN_SRB" O R 3150 2725 60 
F15 "RL_DRV" O R 3150 2650 60 
F16 "IN8-" O R 3150 1050 60 
F17 "IN8+" O R 3150 1125 60 
F18 "IN7-" O R 3150 1200 60 
F19 "IN7+" O R 3150 1275 60 
$EndSheet
$Sheet
S 5675 5125 1125 1450
U 56B0A2C1
F0 "Microcontrolador" 60
F1 "microcontrolador.sch" 60
F2 "M/S" I L 5675 5175 60 
F3 "CS2" O L 5675 5325 60 
F4 "CS3" O L 5675 5400 60 
F5 "RESET/" O L 5675 5600 60 
F6 "START" O L 5675 5675 60 
F7 "DRDY/" I L 5675 5750 60 
F8 "SDA" B L 5675 5950 60 
F9 "SCl" B L 5675 6025 60 
F10 "MISO" I L 5675 6225 60 
F11 "MOSI" O L 5675 6300 60 
F12 "SCK" O L 5675 6375 60 
F13 "I_TX0" O R 6800 5525 60 
F14 "I_RX0" I R 6800 5600 60 
F15 "CS1" O L 5675 6450 60 
$EndSheet
$Sheet
S 750  3625 2425 2900
U 56B0A2DC
F0 "Interfaz Interconectividad" 60
F1 "interfaz_interconectividad.sch" 60
F2 "M/S" O R 3175 5175 60 
F3 "SCKL" I R 3175 3875 60 
F4 "MOSI" I R 3175 3800 60 
F5 "MISO" O R 3175 3725 60 
F6 "CS1" I R 3175 4025 60 
F7 "CS2" I R 3175 4275 60 
F8 "CLK" I R 3175 3950 60 
F9 "RESET/" I R 3175 5850 60 
F10 "START" I R 3175 5925 60 
F11 "SDA" B R 3175 5450 60 
F12 "SCL" B R 3175 5525 60 
F13 "GPIO1" B R 3175 6150 60 
F14 "GPIO2" B R 3175 6225 60 
F15 "GPIO3" B R 3175 6300 60 
F16 "GPIO4" B R 3175 6375 60 
F17 "CS3" I R 3175 4350 60 
F18 "BIAS_INV" I R 3175 4825 60 
$EndSheet
$Sheet
S 7725 5100 1050 725 
U 56B0A2FC
F0 "Comunicacion USB" 60
F1 "interfaz_usb.sch" 60
F2 "I_RX0" O L 7725 5600 60 
F3 "I_TX0" I L 7725 5525 60 
$EndSheet
$Sheet
S 5925 850  1700 3400
U 56B0A297
F0 "Analog Front End" 60
F1 "analog_front_end.sch" 60
F2 "MOSI" I L 5925 2525 60 
F3 "CLK" O L 5925 2675 60 
F4 "START" I L 5925 4075 60 
F5 "CS1/" I L 5925 2825 60 
F6 "SCLK" I L 5925 2600 60 
F7 "GPIO1" B L 5925 3575 60 
F8 "GPIO2" B L 5925 3650 60 
F9 "GPIO3" B L 5925 3725 60 
F10 "GPIO4" B L 5925 3800 60 
F11 "DRDY/" O L 5925 4150 60 
F12 "BIAS_INV" O L 5925 3150 60 
F13 "RL_DRV" B L 5925 3275 60 
F14 "SRB" B L 5925 3350 60 
F15 "MISO" O L 5925 2450 60 
F16 "RESET/" I L 5925 4000 60 
F17 "IN8N" I L 5925 1050 60 
F18 "IN8P" I L 5925 1125 60 
F19 "IN7N" I L 5925 1200 60 
F20 "IN7P" I L 5925 1275 60 
F21 "IN6N" I L 5925 1350 60 
F22 "IN6P" I L 5925 1425 60 
F23 "IN5N" I L 5925 1500 60 
F24 "IN5P" I L 5925 1575 60 
F25 "IN4N" I L 5925 1650 60 
F26 "IN4P" I L 5925 1725 60 
F27 "IN3N" I L 5925 1800 60 
F28 "IN3P" I L 5925 1875 60 
F29 "IN2N" I L 5925 1950 60 
F30 "IN2P" I L 5925 2025 60 
F31 "IN1N" I L 5925 2100 60 
F32 "IN1P" I L 5925 2175 60 
$EndSheet
Wire Wire Line
	5925 3575 4475 3575
Wire Wire Line
	4475 3575 4475 6150
Wire Wire Line
	4475 6150 3175 6150
Wire Wire Line
	3175 6225 4550 6225
Wire Wire Line
	4550 6225 4550 3650
Wire Wire Line
	4550 3650 5925 3650
Wire Wire Line
	5925 3725 4625 3725
Wire Wire Line
	4625 3725 4625 6300
Wire Wire Line
	4625 6300 3175 6300
Wire Wire Line
	3175 6375 4700 6375
Wire Wire Line
	4700 6375 4700 3800
Wire Wire Line
	4700 3800 5925 3800
Wire Wire Line
	5925 2450 3525 2450
Wire Wire Line
	3525 2450 3525 4725
Wire Wire Line
	3525 3725 3175 3725
Wire Wire Line
	3175 3800 3600 3800
Wire Wire Line
	3600 2525 3600 4800
Wire Wire Line
	3600 2525 5925 2525
Wire Wire Line
	5925 2600 3675 2600
Wire Wire Line
	3675 2600 3675 4875
Wire Wire Line
	3675 3875 3175 3875
Wire Wire Line
	3175 3950 3750 3950
Wire Wire Line
	3750 3950 3750 2675
Wire Wire Line
	3750 2675 5925 2675
Wire Wire Line
	3175 4025 3925 4025
Wire Wire Line
	3925 2825 3925 4950
Wire Wire Line
	3925 2825 5925 2825
Wire Wire Line
	3150 1050 5925 1050
Wire Wire Line
	3525 4725 5300 4725
Wire Wire Line
	5300 4725 5300 6225
Wire Wire Line
	5300 6225 5675 6225
Connection ~ 3525 3725
Wire Wire Line
	5225 6300 5675 6300
Wire Wire Line
	5225 6300 5225 4800
Wire Wire Line
	5225 4800 3600 4800
Connection ~ 3600 3800
Wire Wire Line
	5675 6375 5150 6375
Wire Wire Line
	5150 6375 5150 4875
Wire Wire Line
	5150 4875 3675 4875
Connection ~ 3675 3875
Wire Wire Line
	5675 6450 5075 6450
Wire Wire Line
	5075 6450 5075 4950
Wire Wire Line
	5075 4950 3925 4950
Connection ~ 3925 4025
Wire Wire Line
	5675 5675 3675 5675
Wire Wire Line
	3675 5675 3675 5925
Wire Wire Line
	3675 5925 3175 5925
Wire Wire Line
	5925 4075 4875 4075
Wire Wire Line
	4875 4075 4875 5675
Connection ~ 4875 5675
Wire Wire Line
	3175 4275 5350 4275
Wire Wire Line
	5350 4275 5350 5325
Wire Wire Line
	5350 5325 5675 5325
Wire Wire Line
	3175 4350 5400 4350
Wire Wire Line
	5400 4350 5400 5400
Wire Wire Line
	5400 5400 5675 5400
Wire Wire Line
	5675 5950 3900 5950
Wire Wire Line
	3900 5950 3900 5450
Wire Wire Line
	3900 5450 3175 5450
Wire Wire Line
	3175 5525 3825 5525
Wire Wire Line
	3825 5525 3825 6025
Wire Wire Line
	3825 6025 5675 6025
Wire Wire Line
	5675 5600 3600 5600
Wire Wire Line
	3600 5600 3600 5850
Wire Wire Line
	3600 5850 3175 5850
Wire Wire Line
	5925 4000 4800 4000
Wire Wire Line
	4800 4000 4800 5600
Connection ~ 4800 5600
Wire Wire Line
	5675 5750 5475 5750
Wire Wire Line
	5475 5750 5475 4150
Wire Wire Line
	5475 4150 5925 4150
Wire Wire Line
	5675 5175 3175 5175
Wire Wire Line
	3150 2650 3425 2650
Wire Wire Line
	3425 2650 3425 3275
Wire Wire Line
	3425 3275 5925 3275
Wire Wire Line
	5925 3150 3275 3150
Wire Wire Line
	3275 3150 3275 4825
Wire Wire Line
	3275 4825 3175 4825
Wire Wire Line
	7725 5525 6800 5525
Wire Wire Line
	6800 5600 7725 5600
Wire Wire Line
	3150 1125 5925 1125
Wire Wire Line
	5925 1275 3150 1275
Wire Wire Line
	3150 1200 5925 1200
Wire Wire Line
	5925 1350 3150 1350
Wire Wire Line
	3150 1425 5925 1425
Wire Wire Line
	5925 1500 3150 1500
Wire Wire Line
	3150 1575 5925 1575
Wire Wire Line
	3150 1650 5925 1650
Wire Wire Line
	5925 1725 3150 1725
Wire Wire Line
	3150 1800 5925 1800
Wire Wire Line
	5925 1875 3150 1875
Wire Wire Line
	3150 1950 5925 1950
Wire Wire Line
	5925 2025 3150 2025
Wire Wire Line
	3150 2100 5925 2100
Wire Wire Line
	5925 2175 3150 2175
Wire Wire Line
	3150 2725 3375 2725
Wire Wire Line
	3375 2725 3375 3350
Wire Wire Line
	3375 3350 5925 3350
$Sheet
S 9125 1100 975  475 
U 56CCACB9
F0 "configuración_cables" 60
F1 "configuración_cables.sch" 60
$EndSheet
$EndSCHEMATC
