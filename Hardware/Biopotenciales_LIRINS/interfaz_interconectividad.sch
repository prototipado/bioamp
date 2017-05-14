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
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X03 P5
U 1 1 56B2E773
P 3900 950
F 0 "P5" H 3900 1150 50  0000 C CNN
F 1 "CONN_01X03" V 4000 950 50  0000 C CNN
F 2 "biopotenciales:Pin_Header_Straight_1x03" H 3900 950 50  0001 C CNN
F 3 "" H 3900 950 50  0000 C CNN
	1    3900 950 
	0    -1   -1   0   
$EndComp
$Comp
L A_VCC #PWR41
U 1 1 56B2E93B
P 3750 1250
F 0 "#PWR41" H 3750 1100 50  0001 C CNN
F 1 "A_VCC" H 3750 1390 50  0000 C CNN
F 2 "" H 3750 1250 50  0000 C CNN
F 3 "" H 3750 1250 50  0000 C CNN
	1    3750 1250
	-1   0    0    1   
$EndComp
$Comp
L D_VCC #PWR43
U 1 1 56B2E951
P 4050 1250
F 0 "#PWR43" H 4050 1100 50  0001 C CNN
F 1 "D_VCC" H 4050 1390 50  0000 C CNN
F 2 "" H 4050 1250 50  0000 C CNN
F 3 "" H 4050 1250 50  0000 C CNN
	1    4050 1250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR42
U 1 1 56B2E967
P 3900 1425
F 0 "#PWR42" H 3900 1175 50  0001 C CNN
F 1 "GND" H 3900 1275 50  0000 C CNN
F 2 "" H 3900 1425 50  0000 C CNN
F 3 "" H 3900 1425 50  0000 C CNN
	1    3900 1425
	1    0    0    -1  
$EndComp
Text Notes 2375 1050 0    60   ~ 0
Conector alimentación \npropósito general
Text HLabel 2125 1625 0    60   Output ~ 0
M/S
Text HLabel 2125 1750 0    60   Input ~ 0
SCKL
Text HLabel 2125 1875 0    60   Input ~ 0
MOSI
Text HLabel 2125 2000 0    60   Output ~ 0
MISO
Text HLabel 2150 2400 0    60   Input ~ 0
CS1
Text HLabel 2150 2525 0    60   Input ~ 0
CS2
Text HLabel 2150 2650 0    60   Input ~ 0
CLK
Text HLabel 2150 2775 0    60   Input ~ 0
RESET/
Text HLabel 2150 2900 0    60   Input ~ 0
START
Text HLabel 2225 3850 0    60   BiDi ~ 0
SDA
Text HLabel 2225 3950 0    60   BiDi ~ 0
SCL
Text HLabel 2200 4575 0    60   BiDi ~ 0
GPIO1
Text HLabel 2200 4675 0    60   BiDi ~ 0
GPIO2
Text HLabel 2200 4775 0    60   BiDi ~ 0
GPIO3
Text HLabel 2200 4875 0    60   BiDi ~ 0
GPIO4
$Comp
L CONN_01X05 P4
U 1 1 56B2EAD3
P 3250 4775
F 0 "P4" H 3250 5075 50  0000 C CNN
F 1 "CONN_01X05" V 3350 4775 50  0000 C CNN
F 2 "biopotenciales:Pin_Header_Straight_1x05" H 3250 4775 50  0001 C CNN
F 3 "" H 3250 4775 50  0000 C CNN
	1    3250 4775
	1    0    0    1   
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 56B2EB36
P 3250 3950
F 0 "P3" H 3250 4150 50  0000 C CNN
F 1 "CONN_01X03" V 3350 3950 50  0000 C CNN
F 2 "biopotenciales:Pin_Header_Straight_1x03" H 3250 3950 50  0001 C CNN
F 3 "" H 3250 3950 50  0000 C CNN
	1    3250 3950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P6
U 1 1 56B2EBB1
P 4075 3325
F 0 "P6" H 4075 3625 50  0000 C CNN
F 1 "CONN_01X05" V 4175 3325 50  0000 C CNN
F 2 "biopotenciales:Pin_Header_Straight_1x05" H 4075 3325 50  0001 C CNN
F 3 "" H 4075 3325 50  0000 C CNN
	1    4075 3325
	1    0    0    -1  
$EndComp
Text Notes 1275 1925 0    60   ~ 0
Bus SPI\n
Text Notes 825  2800 0    60   ~ 0
Selección Módulo\n 
Text Notes 1375 3925 0    60   ~ 0
Bus I2C\n
Text Notes 2900 5400 0    60   ~ 0
Conector Pines\nGPIO-ADS1299
Text Notes 3550 4000 0    60   ~ 0
Conectores SPI-I2C \nPropósito General\n
$Comp
L GND #PWR38
U 1 1 56B2EFF8
P 3050 4050
F 0 "#PWR38" H 3050 3800 50  0001 C CNN
F 1 "GND" H 3050 3900 50  0000 C CNN
F 2 "" H 3050 4050 50  0000 C CNN
F 3 "" H 3050 4050 50  0000 C CNN
	1    3050 4050
	1    0    0    -1  
$EndComp
Text Label 2575 3850 0    60   ~ 0
SDA
Text Label 2575 3950 0    60   ~ 0
SCL
Text Label 2625 4575 0    60   ~ 0
GPIO1
Text Label 2625 4675 0    60   ~ 0
GPIO2
Text Label 2625 4775 0    60   ~ 0
GPIO3
Text Label 2625 4875 0    60   ~ 0
GPIO4
$Comp
L GND #PWR39
U 1 1 56B2F210
P 3050 4975
F 0 "#PWR39" H 3050 4725 50  0001 C CNN
F 1 "GND" H 3050 4825 50  0000 C CNN
F 2 "" H 3050 4975 50  0000 C CNN
F 3 "" H 3050 4975 50  0000 C CNN
	1    3050 4975
	1    0    0    -1  
$EndComp
Text Label 2900 2900 2    60   ~ 0
START
Text Label 2900 2775 2    60   ~ 0
RESET/
Text Label 2900 2650 2    60   ~ 0
CLK
Text Label 2900 2525 2    60   ~ 0
CS2
Text Label 2900 2400 2    60   ~ 0
CS1
Text HLabel 3625 3525 0    60   Input ~ 0
CS3
Text Label 3600 3225 0    60   ~ 0
MOSI
Text Label 3600 3325 0    60   ~ 0
MISO
Text Label 3600 3425 0    60   ~ 0
SCKL
$Comp
L GND #PWR40
U 1 1 56B2F80D
P 3450 3125
F 0 "#PWR40" H 3450 2875 50  0001 C CNN
F 1 "GND" H 3450 2975 50  0000 C CNN
F 2 "" H 3450 3125 50  0000 C CNN
F 3 "" H 3450 3125 50  0000 C CNN
	1    3450 3125
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1150 3900 1425
Wire Wire Line
	3750 1250 3800 1250
Wire Wire Line
	3800 1250 3800 1150
Wire Wire Line
	4050 1250 4000 1250
Wire Wire Line
	4000 1250 4000 1150
Wire Wire Line
	3050 3850 2225 3850
Wire Wire Line
	3050 3950 2225 3950
Wire Wire Line
	3050 4575 2200 4575
Wire Wire Line
	3050 4675 2200 4675
Wire Wire Line
	3050 4775 2200 4775
Wire Wire Line
	3050 4875 2200 4875
Wire Wire Line
	2150 2900 2900 2900
Wire Wire Line
	2150 2775 2900 2775
Wire Wire Line
	2150 2650 2900 2650
Wire Wire Line
	2150 2525 2900 2525
Wire Wire Line
	2150 2400 2900 2400
Wire Wire Line
	3875 3525 3625 3525
Wire Wire Line
	3875 3425 3600 3425
Wire Wire Line
	3875 3325 3600 3325
Wire Wire Line
	3875 3225 3600 3225
Wire Wire Line
	3450 3125 3875 3125
Wire Wire Line
	2125 1625 2850 1625
Wire Wire Line
	2125 1750 2850 1750
Wire Wire Line
	2125 1875 2850 1875
Wire Wire Line
	2125 2000 2850 2000
Text Label 2850 2000 2    60   ~ 0
MISO
Text Label 2850 1875 2    60   ~ 0
MOSI
Text Label 2850 1750 2    60   ~ 0
SCKL
Text Label 2850 1625 2    60   ~ 0
M/S
$Comp
L PXG.M0.2GG.NG J10
U 1 1 56B378A7
P 7300 1500
F 0 "J10" H 7300 1650 60  0000 C CNN
F 1 "PXG.M0.2GG.NG" H 7300 1350 60  0000 C CNN
F 2 "biopotenciales:PXG.M0.2GG.NG" H 7150 1500 60  0001 C CNN
F 3 "" H 7150 1500 60  0000 C CNN
	1    7300 1500
	1    0    0    -1  
$EndComp
$Comp
L PXG.M0.4GG.NG J12
U 1 1 56B378F8
P 7300 3950
F 0 "J12" H 7300 4200 60  0000 C CNN
F 1 "PXG.M0.4GG.NG" H 7300 3700 60  0000 C CNN
F 2 "biopotenciales:PXG.M0.4GG.NG" H 7150 3950 60  0001 C CNN
F 3 "" H 7150 3950 60  0000 C CNN
	1    7300 3950
	1    0    0    -1  
$EndComp
$Comp
L PXG.M1.0GG.NG J11
U 1 1 56B3793D
P 7300 2700
F 0 "J11" H 7300 3250 60  0000 C CNN
F 1 "PXG.M1.0GG.NG" H 7300 2150 60  0000 C CNN
F 2 "biopotenciales:PXG.M1.0GG.NG" H 7150 2700 60  0001 C CNN
F 3 "" H 7150 2700 60  0000 C CNN
	1    7300 2700
	1    0    0    -1  
$EndComp
$Comp
L V_USB_IO #PWR45
U 1 1 56B37B5F
P 6450 1450
F 0 "#PWR45" H 6450 1300 50  0001 C CNN
F 1 "V_USB_IO" V 6450 1750 50  0000 C CNN
F 2 "" H 6450 1450 50  0000 C CNN
F 3 "" H 6450 1450 50  0000 C CNN
	1    6450 1450
	0    -1   -1   0   
$EndComp
$Comp
L NI_GND #PWR46
U 1 1 56B37C8B
P 6450 1550
F 0 "#PWR46" H 6450 1300 50  0001 C CNN
F 1 "NI_GND" V 6450 1300 50  0000 C CNN
F 2 "" H 6450 1550 50  0000 C CNN
F 3 "" H 6450 1550 50  0000 C CNN
	1    6450 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 1450 6450 1450
Wire Wire Line
	6450 1550 6900 1550
$Comp
L NI_GND #PWR48
U 1 1 56B37D89
P 7800 1600
F 0 "#PWR48" H 7800 1350 50  0001 C CNN
F 1 "NI_GND" V 7800 1350 50  0000 C CNN
F 2 "" H 7800 1600 50  0000 C CNN
F 3 "" H 7800 1600 50  0000 C CNN
	1    7800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1600 7800 1500
Wire Wire Line
	7800 1500 7700 1500
Wire Wire Line
	6900 2250 6350 2250
Wire Wire Line
	6900 2350 6350 2350
Wire Wire Line
	6900 2450 6350 2450
Wire Wire Line
	6900 2550 6350 2550
Wire Wire Line
	6900 2650 6350 2650
Wire Wire Line
	6900 2750 6350 2750
Wire Wire Line
	6900 2850 6350 2850
Wire Wire Line
	6900 3050 6350 3050
Wire Wire Line
	6900 3150 6350 3150
$Comp
L GND #PWR44
U 1 1 56B3801C
P 6350 3150
F 0 "#PWR44" H 6350 2900 50  0001 C CNN
F 1 "GND" V 6350 2950 50  0000 C CNN
F 2 "" H 6350 3150 50  0000 C CNN
F 3 "" H 6350 3150 50  0000 C CNN
	1    6350 3150
	0    1    1    0   
$EndComp
Text Label 6350 3050 0    60   ~ 0
SCKL
Wire Wire Line
	6900 2950 6350 2950
Text Label 6350 2950 0    60   ~ 0
MISO
Text Label 6350 2850 0    60   ~ 0
MOSI
Text Label 6350 2750 0    60   ~ 0
M/S
Text Label 6350 2650 0    60   ~ 0
CS2
Text Label 6350 2550 0    60   ~ 0
RESET/
Text Label 6350 2450 0    60   ~ 0
START
Text Label 6350 2350 0    60   ~ 0
CS1
Text Label 6350 2250 0    60   ~ 0
CLK
Wire Wire Line
	6900 3800 6550 3800
Wire Wire Line
	6900 4000 6700 4000
Wire Wire Line
	6700 4000 6700 3800
Connection ~ 6700 3800
Text HLabel 6550 3800 0    60   Input ~ 0
BIAS_INV
$Comp
L GNDA #PWR50
U 1 1 56B38367
P 7850 4100
F 0 "#PWR50" H 7850 3850 50  0001 C CNN
F 1 "GNDA" H 7850 3950 50  0000 C CNN
F 2 "" H 7850 4100 50  0000 C CNN
F 3 "" H 7850 4100 50  0000 C CNN
	1    7850 4100
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR47
U 1 1 56B38389
P 6550 4150
F 0 "#PWR47" H 6550 3900 50  0001 C CNN
F 1 "GNDA" H 6550 4000 50  0000 C CNN
F 2 "" H 6550 4150 50  0000 C CNN
F 3 "" H 6550 4150 50  0000 C CNN
	1    6550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3900 6550 3900
Wire Wire Line
	6550 3900 6550 4150
Wire Wire Line
	6900 4100 6550 4100
Connection ~ 6550 4100
Wire Wire Line
	7700 3950 7850 3950
Wire Wire Line
	7850 3950 7850 4100
$Comp
L GND #PWR49
U 1 1 56B384CA
P 7800 2850
F 0 "#PWR49" H 7800 2600 50  0001 C CNN
F 1 "GND" H 7800 2700 50  0000 C CNN
F 2 "" H 7800 2850 50  0000 C CNN
F 3 "" H 7800 2850 50  0000 C CNN
	1    7800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2700 7800 2700
Wire Wire Line
	7800 2700 7800 2850
Text Notes 6150 4450 0    60   ~ 0
Tierra analógica\n
Text Notes 8000 4050 0    60   ~ 0
Conector para placa Slave (Bias_Inv y tierra analógica aislada)
Text Notes 7950 2800 0    60   ~ 0
Conector para placa Slave (Tierra y señales digitales, aisladas)
Text Notes 8000 1600 0    60   ~ 0
Conector para placa Slave (Alimentación no aislada)
Wire Notes Line
	5750 1200 5750 2050
Wire Notes Line
	5750 2050 7950 2050
Wire Notes Line
	7950 2050 7950 1200
Wire Notes Line
	7950 1200 5750 1200
Text Notes 5750 2050 0    60   Italic 0
NO AISLADO!
Text Notes 5475 3175 0    60   ~ 0
Tierra digital\n
$EndSCHEMATC
