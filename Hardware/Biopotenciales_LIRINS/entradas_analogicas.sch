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
Sheet 2 7
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
L TPD4E1B06 U1
U 1 1 56B30EF3
P 1275 1850
F 0 "U1" H 1275 2250 60  0000 C CNN
F 1 "TPD4E1B06" H 1675 1575 60  0000 C CNN
F 2 "biopotenciales:TSOP-6_2x1.25mm_Pitch0.65mm" H 1275 1850 60  0001 C CNN
F 3 "" H 1275 1850 60  0000 C CNN
	1    1275 1850
	1    0    0    -1  
$EndComp
Text Label 700  825  0    60   ~ 0
E8-
Text Label 700  925  0    60   ~ 0
E8+
Text Label 700  1025 0    60   ~ 0
E7-
Text Label 700  1125 0    60   ~ 0
E7+
$Comp
L GNDA #PWR2
U 1 1 56B320C0
P 3125 2050
F 0 "#PWR2" H 3125 1800 50  0001 C CNN
F 1 "GNDA" H 3125 1900 50  0000 C CNN
F 2 "" H 3125 2050 50  0000 C CNN
F 3 "" H 3125 2050 50  0000 C CNN
	1    3125 2050
	1    0    0    -1  
$EndComp
Text HLabel 3825 825  2    60   Output ~ 0
IN8-
Text HLabel 3825 925  2    60   Output ~ 0
IN8+
Text HLabel 3825 1025 2    60   Output ~ 0
IN7-
Text HLabel 3825 1125 2    60   Output ~ 0
IN7+
Text HLabel 1925 3750 2    60   Output ~ 0
IN4-
Text HLabel 1925 3850 2    60   Output ~ 0
IN4+
Text HLabel 1925 3950 2    60   Output ~ 0
IN3-
Text HLabel 1925 4050 2    60   Output ~ 0
IN3+
Text HLabel 1925 3350 2    60   Output ~ 0
IN6-
Text HLabel 1925 3450 2    60   Output ~ 0
IN6+
Text HLabel 1925 3550 2    60   Output ~ 0
IN5-
Text HLabel 1925 3650 2    60   Output ~ 0
IN5+
$Comp
L TPD4E1B06 U2
U 1 1 56B3336B
P 5000 1850
F 0 "U2" H 5000 2250 60  0000 C CNN
F 1 "TPD4E1B06" H 5400 1575 60  0000 C CNN
F 2 "biopotenciales:TSOP-6_2x1.25mm_Pitch0.65mm" H 5000 1850 60  0001 C CNN
F 3 "" H 5000 1850 60  0000 C CNN
	1    5000 1850
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR3
U 1 1 56B33377
P 4900 2325
F 0 "#PWR3" H 4900 2075 50  0001 C CNN
F 1 "GNDA" H 4900 2175 50  0000 C CNN
F 2 "" H 4900 2325 50  0000 C CNN
F 3 "" H 4900 2325 50  0000 C CNN
	1    4900 2325
	1    0    0    -1  
$EndComp
Text Label 4425 825  0    60   ~ 0
E2-
Text Label 4425 925  0    60   ~ 0
E2+
Text Label 4425 1025 0    60   ~ 0
E1-
Text Label 4425 1125 0    60   ~ 0
E1+
$Comp
L GNDA #PWR5
U 1 1 56B33387
P 6850 2050
F 0 "#PWR5" H 6850 1800 50  0001 C CNN
F 1 "GNDA" H 6850 1900 50  0000 C CNN
F 2 "" H 6850 2050 50  0000 C CNN
F 3 "" H 6850 2050 50  0000 C CNN
	1    6850 2050
	1    0    0    -1  
$EndComp
Text HLabel 7550 825  2    60   Output ~ 0
IN2-
Text HLabel 7550 925  2    60   Output ~ 0
IN2+
Text HLabel 7550 1025 2    60   Output ~ 0
IN1-
Text HLabel 7550 1125 2    60   Output ~ 0
IN1+
$Comp
L TPD4E1B06 U3
U 1 1 56B35629
P 5375 3975
F 0 "U3" H 5375 4375 60  0000 C CNN
F 1 "TPD4E1B06" H 5775 3700 60  0000 C CNN
F 2 "biopotenciales:TSOP-6_2x1.25mm_Pitch0.65mm" H 5375 3975 60  0001 C CNN
F 3 "" H 5375 3975 60  0000 C CNN
	1    5375 3975
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR4
U 1 1 56B35635
P 5275 4450
F 0 "#PWR4" H 5275 4200 50  0001 C CNN
F 1 "GNDA" H 5275 4300 50  0000 C CNN
F 2 "" H 5275 4450 50  0000 C CNN
F 3 "" H 5275 4450 50  0000 C CNN
	1    5275 4450
	1    0    0    -1  
$EndComp
Text Label 4800 2950 0    60   ~ 0
SRB
$Comp
L GNDA #PWR6
U 1 1 56B35645
P 7375 4175
F 0 "#PWR6" H 7375 3925 50  0001 C CNN
F 1 "GNDA" H 7375 4025 50  0000 C CNN
F 2 "" H 7375 4175 50  0000 C CNN
F 3 "" H 7375 4175 50  0000 C CNN
	1    7375 4175
	1    0    0    -1  
$EndComp
Text HLabel 7925 2950 2    60   Output ~ 0
IN_SRB
Text HLabel 1925 4150 2    60   Output ~ 0
RL_DRV
$Comp
L Jack_Touch-Proof J1
U 1 1 56B430F1
P 10350 675
F 0 "J1" H 10550 675 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 535 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 675 60  0001 C CNN
F 3 "" H 10350 675 60  0000 C CNN
	1    10350 675 
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J2
U 1 1 56B4320E
P 10350 1000
F 0 "J2" H 10550 1000 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 860 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 1000 60  0001 C CNN
F 3 "" H 10350 1000 60  0000 C CNN
	1    10350 1000
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J3
U 1 1 56B43255
P 10350 1325
F 0 "J3" H 10550 1325 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 1185 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 1325 60  0001 C CNN
F 3 "" H 10350 1325 60  0000 C CNN
	1    10350 1325
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J4
U 1 1 56B4329F
P 10350 1650
F 0 "J4" H 10550 1650 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 1510 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 1650 60  0001 C CNN
F 3 "" H 10350 1650 60  0000 C CNN
	1    10350 1650
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J5
U 1 1 56B436CE
P 10350 1975
F 0 "J5" H 10575 1975 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 1835 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 1975 60  0001 C CNN
F 3 "" H 10350 1975 60  0000 C CNN
	1    10350 1975
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J6
U 1 1 56B436D4
P 10350 2300
F 0 "J6" H 10575 2300 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 2160 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 2300 60  0001 C CNN
F 3 "" H 10350 2300 60  0000 C CNN
	1    10350 2300
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J7
U 1 1 56B436DA
P 10350 2625
F 0 "J7" H 10575 2625 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 2485 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 2625 60  0001 C CNN
F 3 "" H 10350 2625 60  0000 C CNN
	1    10350 2625
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J8
U 1 1 56B436E0
P 10350 2950
F 0 "J8" H 10575 2950 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 2810 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 2950 60  0001 C CNN
F 3 "" H 10350 2950 60  0000 C CNN
	1    10350 2950
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J9
U 1 1 56B4381C
P 10350 3275
F 0 "J9" H 10575 3275 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10380 3135 60  0001 C CNN
F 2 "biopotenciales:Jack_TouchProof_1.5mm" H 10350 3275 60  0001 C CNN
F 3 "" H 10350 3275 60  0000 C CNN
	1    10350 3275
	1    0    0    -1  
$EndComp
Text Label 9525 675  0    60   ~ 0
E8-
Text Label 9525 1000 0    60   ~ 0
E8+
Text Label 9525 1325 0    60   ~ 0
E7-
Text Label 9525 1650 0    60   ~ 0
E7+
Text Label 9525 1975 0    60   ~ 0
E2-
Text Label 9525 2300 0    60   ~ 0
E2+
Text Label 9525 2625 0    60   ~ 0
E1-
Text Label 9525 2950 0    60   ~ 0
E1+
Text Label 9525 3275 0    60   ~ 0
SRB
Text Notes 6225 5350 0    60   ~ 0
SRB: Patient stimulus, reference, and bias signal.\nRLD: Driver de Pierna Derecha.
Text Notes 2275 1350 0    60   ~ 0
2.2k\n
Text Notes 6350 3475 0    60   ~ 0
2.2k\n
Text Notes 6000 1350 0    60   ~ 0
2.2k\n
Text Notes 3350 1700 0    60   ~ 0
1nF\n
Text Notes 7450 3850 0    60   ~ 0
1nF\n
Text Notes 7075 1725 0    60   ~ 0
1nF\n
$Comp
L GNDA #PWR7
U 1 1 56C60856
P 9675 3425
F 0 "#PWR7" H 9675 3175 50  0001 C CNN
F 1 "GNDA" V 9675 3175 50  0000 C CNN
F 2 "" H 9675 3425 50  0000 C CNN
F 3 "" H 9675 3425 50  0000 C CNN
	1    9675 3425
	0    1    1    0   
$EndComp
NoConn ~ 7075 4025
NoConn ~ 7275 4025
NoConn ~ 7075 3575
NoConn ~ 7175 3575
NoConn ~ 6675 3050
NoConn ~ 6675 3250
NoConn ~ 6225 3250
NoConn ~ 6225 3050
NoConn ~ 5450 3675
NoConn ~ 5175 3675
$Comp
L CKCL44X7R1H CN1
U 1 1 56B6A4F3
P 3125 1675
F 0 "CN1" H 3120 1915 60  0000 C CNN
F 1 "CKCL44X7R1H" H 3150 1425 60  0000 C CNN
F 2 "biopotenciales:Cap_Array_4" H 3150 1710 60  0000 C CNN
F 3 "" H 3150 1710 60  0000 C CNN
	1    3125 1675
	0    1    1    0   
$EndComp
$Comp
L CKCL44X7R1H CN2
U 1 1 56B6A9DC
P 6850 1675
F 0 "CN2" H 6845 1915 60  0000 C CNN
F 1 "CKCL44X7R1H" H 6875 1425 60  0000 C CNN
F 2 "biopotenciales:Cap_Array_4" H 6875 1710 60  0000 C CNN
F 3 "" H 6875 1710 60  0000 C CNN
	1    6850 1675
	0    1    1    0   
$EndComp
$Comp
L CKCL44X7R1H CN3
U 1 1 56B6B3B6
P 7225 3800
F 0 "CN3" H 7220 4040 60  0000 C CNN
F 1 "CKCL44X7R1H" H 7250 3550 60  0000 C CNN
F 2 "biopotenciales:Cap_Array_4" H 7250 3835 60  0001 C CNN
F 3 "" H 7250 3835 60  0000 C CNN
	1    7225 3800
	0    1    1    0   
$EndComp
$Comp
L CAY16-F4_R-ARRAY RN1
U 1 1 56B6C24D
P 2350 975
F 0 "RN1" H 2350 1300 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 2375 725 60  0000 C CNN
F 2 "biopotenciales:r_cay16-4" H 2345 1015 60  0001 C CNN
F 3 "" H 2345 1015 60  0000 C CNN
	1    2350 975 
	1    0    0    -1  
$EndComp
$Comp
L CAY16-F4_R-ARRAY RN2
U 1 1 56B6C32C
P 6075 975
F 0 "RN2" H 6075 1300 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 6100 725 60  0000 C CNN
F 2 "biopotenciales:r_cay16-4" H 6070 1015 60  0000 C CNN
F 3 "" H 6070 1015 60  0000 C CNN
	1    6075 975 
	1    0    0    -1  
$EndComp
$Comp
L CAY16-F4_R-ARRAY RN3
U 1 1 56B6C6B6
P 6450 3100
F 0 "RN3" H 6450 3425 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 6475 2850 60  0000 C CNN
F 2 "biopotenciales:r_cay16-4" H 6445 3140 60  0000 C CNN
F 3 "" H 6445 3140 60  0000 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1125 2125 1125
Wire Wire Line
	700  1025 2125 1025
Wire Wire Line
	700  925  2125 925 
Wire Wire Line
	700  825  2125 825 
Wire Wire Line
	1475 1550 1475 825 
Connection ~ 1475 825 
Wire Wire Line
	1350 1550 1350 925 
Connection ~ 1350 925 
Wire Wire Line
	1200 1550 1200 1025
Connection ~ 1200 1025
Wire Wire Line
	1075 1550 1075 1125
Connection ~ 1075 1125
Wire Wire Line
	1175 2125 1175 2325
Wire Wire Line
	2575 825  3825 825 
Wire Wire Line
	2575 925  3825 925 
Wire Wire Line
	2575 1025 3825 1025
Wire Wire Line
	2575 1125 3825 1125
Wire Wire Line
	2975 1450 2975 825 
Connection ~ 2975 825 
Wire Wire Line
	3075 925  3075 1450
Connection ~ 3075 925 
Wire Wire Line
	3175 1450 3175 1025
Connection ~ 3175 1025
Wire Wire Line
	3275 1450 3275 1125
Connection ~ 3275 1125
Wire Wire Line
	2975 1900 2975 2000
Wire Wire Line
	2975 2000 3275 2000
Wire Wire Line
	3275 2000 3275 1900
Wire Wire Line
	3175 1900 3175 2000
Connection ~ 3175 2000
Wire Wire Line
	3075 1900 3075 2000
Connection ~ 3075 2000
Wire Wire Line
	3125 2050 3125 2000
Connection ~ 3125 2000
Wire Wire Line
	4425 1125 5850 1125
Wire Wire Line
	4425 1025 5850 1025
Wire Wire Line
	4425 925  5850 925 
Wire Wire Line
	4425 825  5850 825 
Wire Wire Line
	5200 1550 5200 825 
Connection ~ 5200 825 
Wire Wire Line
	5075 1550 5075 925 
Connection ~ 5075 925 
Wire Wire Line
	4925 1550 4925 1025
Connection ~ 4925 1025
Wire Wire Line
	4800 1550 4800 1125
Connection ~ 4800 1125
Wire Wire Line
	4900 2125 4900 2325
Wire Wire Line
	6300 825  7550 825 
Wire Wire Line
	6300 925  7550 925 
Wire Wire Line
	6300 1025 7550 1025
Wire Wire Line
	6300 1125 7550 1125
Wire Wire Line
	6700 1450 6700 825 
Connection ~ 6700 825 
Wire Wire Line
	6800 925  6800 1450
Connection ~ 6800 925 
Wire Wire Line
	6900 1450 6900 1025
Connection ~ 6900 1025
Wire Wire Line
	7000 1450 7000 1125
Connection ~ 7000 1125
Wire Wire Line
	6700 1900 6700 2000
Wire Wire Line
	6700 2000 7000 2000
Wire Wire Line
	7000 2000 7000 1900
Wire Wire Line
	6900 1900 6900 2000
Connection ~ 6900 2000
Wire Wire Line
	6800 1900 6800 2000
Connection ~ 6800 2000
Wire Wire Line
	6850 2050 6850 2000
Connection ~ 6850 2000
Wire Wire Line
	4800 2950 6225 2950
Wire Wire Line
	5575 3675 5575 2950
Connection ~ 5575 2950
Wire Wire Line
	5275 4250 5275 4450
Wire Wire Line
	6675 2950 7925 2950
Wire Wire Line
	10125 675  9525 675 
Wire Wire Line
	10125 1000 9525 1000
Wire Wire Line
	10125 1325 9525 1325
Wire Wire Line
	10125 1650 9525 1650
Wire Wire Line
	10125 1975 9525 1975
Wire Wire Line
	10125 2300 9525 2300
Wire Wire Line
	10125 2625 9525 2625
Wire Wire Line
	10125 2950 9525 2950
Wire Wire Line
	10125 3275 9525 3275
Wire Wire Line
	10000 825  9800 825 
Wire Wire Line
	9675 3425 10000 3425
Wire Wire Line
	9800 3100 10000 3100
Wire Wire Line
	9800 2775 10000 2775
Wire Wire Line
	9800 2450 10000 2450
Wire Wire Line
	9800 2125 10000 2125
Connection ~ 9800 3425
Connection ~ 9800 3100
Connection ~ 9800 2775
Connection ~ 9800 2450
Connection ~ 9800 2125
Wire Wire Line
	9800 1475 10000 1475
Connection ~ 9800 1475
Wire Wire Line
	9800 1800 10000 1800
Connection ~ 9800 1800
Wire Wire Line
	10000 1150 9800 1150
Connection ~ 9800 1150
Wire Wire Line
	9800 825  9800 3425
$Comp
L CONN_01X10 P1
U 1 1 56BBF355
P 1425 3700
F 0 "P1" H 1425 4250 50  0000 C CNN
F 1 "CONN_01X10" V 1525 3700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10" H 1425 3700 50  0001 C CNN
F 3 "" H 1425 3700 50  0000 C CNN
	1    1425 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1625 3350 1925 3350
Wire Wire Line
	1625 3450 1925 3450
Wire Wire Line
	1925 3550 1625 3550
Wire Wire Line
	1625 3650 1925 3650
Wire Wire Line
	1625 3750 1925 3750
Wire Wire Line
	1625 3850 1925 3850
Wire Wire Line
	1625 3950 1925 3950
Wire Wire Line
	1625 4050 1925 4050
Wire Wire Line
	1625 4150 1925 4150
$Comp
L GNDA #PWR1
U 1 1 56BC08B3
P 1925 3250
F 0 "#PWR1" H 1925 3000 50  0001 C CNN
F 1 "GNDA" V 1925 3000 50  0000 C CNN
F 2 "" H 1925 3250 50  0000 C CNN
F 3 "" H 1925 3250 50  0000 C CNN
	1    1925 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1925 3250 1625 3250
Wire Wire Line
	7375 4025 7375 4175
Wire Wire Line
	7375 3575 7375 2950
Connection ~ 7375 2950
$EndSCHEMATC
