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
LIBS:biopotenciales
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "BioAmp-FIUNER-Lab. de Prototipado"
Date "2017-05-19"
Rev "1.1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CAY16-F4_R-ARRAY RN1
U 1 1 56BC55FF
P 3400 1200
F 0 "RN1" H 3400 1525 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 3425 950 60  0000 C CNN
F 2 "bioamp_db:r_cay16-4" H 3395 1240 60  0001 C CNN
F 3 "" H 3395 1240 60  0000 C CNN
	1    3400 1200
	1    0    0    -1  
$EndComp
$Comp
L CKCL44X7R1H CN1
U 1 1 56BC574E
P 4500 1850
F 0 "CN1" H 4495 2090 60  0000 C CNN
F 1 "CKCL44X7R1H" H 4525 1600 60  0000 C CNN
F 2 "bioamp_db:Cap_Array_4" H 4525 1885 60  0001 C CNN
F 3 "" H 4525 1885 60  0000 C CNN
	1    4500 1850
	0    1    1    0   
$EndComp
$Comp
L TPD4E1B06 U1
U 1 1 56BC5856
P 2175 1950
F 0 "U1" H 2175 2350 60  0000 C CNN
F 1 "TPD4E1B06" H 2200 1575 60  0000 C CNN
F 2 "bioamp_db:TSOP-6_2x1.25mm_Pitch0.65mm" H 2175 1950 60  0001 C CNN
F 3 "" H 2175 1950 60  0000 C CNN
	1    2175 1950
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR01
U 1 1 56BC627F
P 4500 2250
F 0 "#PWR01" H 4500 2000 50  0001 C CNN
F 1 "GNDA" H 4500 2100 50  0000 C CNN
F 2 "" H 4500 2250 50  0000 C CNN
F 3 "" H 4500 2250 50  0000 C CNN
	1    4500 2250
	1    0    0    -1  
$EndComp
$Comp
L CAY16-F4_R-ARRAY RN2
U 1 1 56BC65CE
P 3425 2825
F 0 "RN2" H 3425 3150 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 3450 2575 60  0000 C CNN
F 2 "bioamp_db:r_cay16-4" H 3420 2865 60  0001 C CNN
F 3 "" H 3420 2865 60  0000 C CNN
	1    3425 2825
	1    0    0    -1  
$EndComp
$Comp
L CKCL44X7R1H CN2
U 1 1 56BC65D4
P 4525 3475
F 0 "CN2" H 4520 3715 60  0000 C CNN
F 1 "CKCL44X7R1H" H 4550 3225 60  0000 C CNN
F 2 "bioamp_db:Cap_Array_4" H 4550 3510 60  0001 C CNN
F 3 "" H 4550 3510 60  0000 C CNN
	1    4525 3475
	0    1    1    0   
$EndComp
$Comp
L TPD4E1B06 U2
U 1 1 56BC65DA
P 2200 3575
F 0 "U2" H 2200 3975 60  0000 C CNN
F 1 "TPD4E1B06" H 2225 3200 60  0000 C CNN
F 2 "bioamp_db:TSOP-6_2x1.25mm_Pitch0.65mm" H 2200 3575 60  0001 C CNN
F 3 "" H 2200 3575 60  0000 C CNN
	1    2200 3575
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR02
U 1 1 56BC65F9
P 4525 3875
F 0 "#PWR02" H 4525 3625 50  0001 C CNN
F 1 "GNDA" H 4525 3725 50  0000 C CNN
F 2 "" H 4525 3875 50  0000 C CNN
F 3 "" H 4525 3875 50  0000 C CNN
	1    4525 3875
	1    0    0    -1  
$EndComp
$Comp
L CAY16-F4_R-ARRAY RN3
U 1 1 56BC66BF
P 3425 4475
F 0 "RN3" H 3425 4800 60  0000 C CNN
F 1 "CAY16-F4_R-ARRAY" H 3450 4225 60  0000 C CNN
F 2 "bioamp_db:r_cay16-4" H 3420 4515 60  0001 C CNN
F 3 "" H 3420 4515 60  0000 C CNN
	1    3425 4475
	1    0    0    -1  
$EndComp
$Comp
L CKCL44X7R1H CN3
U 1 1 56BC66C5
P 4525 5125
F 0 "CN3" H 4520 5365 60  0000 C CNN
F 1 "CKCL44X7R1H" H 4550 4875 60  0000 C CNN
F 2 "bioamp_db:Cap_Array_4" H 4550 5160 60  0001 C CNN
F 3 "" H 4550 5160 60  0000 C CNN
	1    4525 5125
	0    1    1    0   
$EndComp
$Comp
L TPD4E1B06 U3
U 1 1 56BC66CB
P 2200 5225
F 0 "U3" H 2200 5625 60  0000 C CNN
F 1 "TPD4E1B06" H 2225 4850 60  0000 C CNN
F 2 "bioamp_db:TSOP-6_2x1.25mm_Pitch0.65mm" H 2200 5225 60  0001 C CNN
F 3 "" H 2200 5225 60  0000 C CNN
	1    2200 5225
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR03
U 1 1 56BC66EA
P 4525 5525
F 0 "#PWR03" H 4525 5275 50  0001 C CNN
F 1 "GNDA" H 4525 5375 50  0000 C CNN
F 2 "" H 4525 5525 50  0000 C CNN
F 3 "" H 4525 5525 50  0000 C CNN
	1    4525 5525
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR04
U 1 1 56BC6985
P 2100 5725
F 0 "#PWR04" H 2100 5475 50  0001 C CNN
F 1 "GNDA" H 2100 5575 50  0000 C CNN
F 2 "" H 2100 5725 50  0000 C CNN
F 3 "" H 2100 5725 50  0000 C CNN
	1    2100 5725
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR05
U 1 1 56BC6B78
P 2100 4075
F 0 "#PWR05" H 2100 3825 50  0001 C CNN
F 1 "GNDA" H 2100 3925 50  0000 C CNN
F 2 "" H 2100 4075 50  0000 C CNN
F 3 "" H 2100 4075 50  0000 C CNN
	1    2100 4075
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR06
U 1 1 56BC6D93
P 2075 2425
F 0 "#PWR06" H 2075 2175 50  0001 C CNN
F 1 "GNDA" H 2075 2275 50  0000 C CNN
F 2 "" H 2075 2425 50  0000 C CNN
F 3 "" H 2075 2425 50  0000 C CNN
	1    2075 2425
	1    0    0    -1  
$EndComp
Text Label 1350 1050 0    60   ~ 0
IN6-
Text Label 1350 1150 0    60   ~ 0
IN6+
Text Label 1350 1250 0    60   ~ 0
IN5-
Text Label 1350 1375 0    60   ~ 0
IN5+
Text Label 1375 2675 0    60   ~ 0
IN4-
Text Label 1375 2775 0    60   ~ 0
IN4+
Text Label 1375 2875 0    60   ~ 0
IN3-
Text Label 1375 3000 0    60   ~ 0
IN3+
Text Label 1375 4325 0    60   ~ 0
RL_DRV
$Comp
L CONN_01X10 P1
U 1 1 56BC736F
P 8175 2825
F 0 "P1" H 8175 3375 50  0000 C CNN
F 1 "CONN_01X10" V 8275 2825 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10" H 8175 2825 50  0001 C CNN
F 3 "" H 8175 2825 50  0000 C CNN
	1    8175 2825
	1    0    0    1   
$EndComp
$Comp
L GNDA #PWR07
U 1 1 56BC7C1A
P 7850 2375
F 0 "#PWR07" H 7850 2125 50  0001 C CNN
F 1 "GNDA" V 7850 2125 50  0000 C CNN
F 2 "" H 7850 2375 50  0000 C CNN
F 3 "" H 7850 2375 50  0000 C CNN
	1    7850 2375
	0    1    1    0   
$EndComp
$Comp
L Jack_Touch-Proof J2
U 1 1 56BC8346
P 10375 1175
F 0 "J2" H 10570 1135 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 925 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 1175 60  0001 C CNN
F 3 "" H 10375 1175 60  0000 C CNN
	1    10375 1175
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J3
U 1 1 56BC83B7
P 10375 1600
F 0 "J3" H 10570 1560 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 1350 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 1600 60  0001 C CNN
F 3 "" H 10375 1600 60  0000 C CNN
	1    10375 1600
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J4
U 1 1 56BC8520
P 10375 2025
F 0 "J4" H 10570 1985 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 1775 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 2025 60  0001 C CNN
F 3 "" H 10375 2025 60  0000 C CNN
	1    10375 2025
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J5
U 1 1 56BC855D
P 10375 2450
F 0 "J5" H 10570 2410 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 2200 60  0000 C CNN
F 2 "" H 10375 2450 60  0000 C CNN
F 3 "" H 10375 2450 60  0000 C CNN
	1    10375 2450
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J6
U 1 1 56BC8750
P 10375 2900
F 0 "J6" H 10570 2860 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 2650 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 2900 60  0001 C CNN
F 3 "" H 10375 2900 60  0000 C CNN
	1    10375 2900
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J7
U 1 1 56BC8756
P 10375 3325
F 0 "J7" H 10570 3285 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 3075 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 3325 60  0001 C CNN
F 3 "" H 10375 3325 60  0000 C CNN
	1    10375 3325
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J8
U 1 1 56BC875C
P 10375 3750
F 0 "J8" H 10570 3710 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 3500 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 3750 60  0001 C CNN
F 3 "" H 10375 3750 60  0000 C CNN
	1    10375 3750
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J9
U 1 1 56BC8762
P 10375 4175
F 0 "J9" H 10570 4135 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10375 3925 60  0000 C CNN
F 2 "bioamp_db:Jack_TouchProof_1.5mm" H 10375 4175 60  0001 C CNN
F 3 "" H 10375 4175 60  0000 C CNN
	1    10375 4175
	1    0    0    -1  
$EndComp
$Comp
L Jack_Touch-Proof J10
U 1 1 56BC877C
P 10400 4875
F 0 "J10" H 10650 4825 60  0000 C CNN
F 1 "Jack_Touch-Proof" H 10400 4625 60  0000 C CNN
F 2 "" H 10400 4875 60  0000 C CNN
F 3 "" H 10400 4875 60  0000 C CNN
	1    10400 4875
	1    0    0    -1  
$EndComp
Wire Wire Line
	3175 1050 1350 1050
Wire Wire Line
	3175 1150 1350 1150
Wire Wire Line
	3175 1250 1350 1250
Wire Wire Line
	3175 1350 3175 1375
Wire Wire Line
	3175 1375 1350 1375
Wire Wire Line
	1975 1650 1975 1375
Connection ~ 1975 1375
Wire Wire Line
	2100 1650 2100 1250
Connection ~ 2100 1250
Wire Wire Line
	2250 1650 2250 1150
Connection ~ 2250 1150
Wire Wire Line
	2375 1650 2375 1050
Connection ~ 2375 1050
Wire Wire Line
	3625 1050 6575 1050
Wire Wire Line
	3625 1150 6450 1150
Wire Wire Line
	3625 1250 6300 1250
Wire Wire Line
	3625 1350 6150 1350
Wire Wire Line
	4350 2075 4350 2200
Wire Wire Line
	4350 2200 4650 2200
Wire Wire Line
	4500 2200 4500 2250
Wire Wire Line
	4650 2200 4650 2075
Connection ~ 4500 2200
Wire Wire Line
	4550 2075 4550 2200
Connection ~ 4550 2200
Wire Wire Line
	4450 2075 4450 2200
Connection ~ 4450 2200
Wire Wire Line
	3200 2675 1375 2675
Wire Wire Line
	3200 2775 1375 2775
Wire Wire Line
	3200 2875 1375 2875
Wire Wire Line
	3200 2975 3200 3000
Wire Wire Line
	3200 3000 1375 3000
Wire Wire Line
	2000 3275 2000 3000
Connection ~ 2000 3000
Wire Wire Line
	2125 3275 2125 2875
Connection ~ 2125 2875
Wire Wire Line
	2275 3275 2275 2775
Connection ~ 2275 2775
Wire Wire Line
	2400 3275 2400 2675
Connection ~ 2400 2675
Wire Wire Line
	3650 2675 6025 2675
Wire Wire Line
	3650 2775 5900 2775
Wire Wire Line
	3650 2875 5825 2875
Wire Wire Line
	3650 2975 5625 2975
Wire Wire Line
	4375 3700 4375 3825
Wire Wire Line
	4375 3825 4675 3825
Wire Wire Line
	4525 3825 4525 3875
Wire Wire Line
	4675 3825 4675 3700
Connection ~ 4525 3825
Wire Wire Line
	4575 3700 4575 3825
Connection ~ 4575 3825
Wire Wire Line
	4475 3700 4475 3825
Connection ~ 4475 3825
Wire Wire Line
	3200 4325 1375 4325
Wire Wire Line
	3200 4625 3200 4650
Wire Wire Line
	2400 4925 2400 4325
Connection ~ 2400 4325
Wire Wire Line
	3650 4325 5275 4325
Wire Wire Line
	4675 4900 4675 4325
Connection ~ 4675 4325
Wire Wire Line
	4375 5350 4375 5475
Wire Wire Line
	4375 5475 4675 5475
Wire Wire Line
	4525 5475 4525 5525
Wire Wire Line
	4675 5475 4675 5350
Connection ~ 4525 5475
Wire Wire Line
	4575 5350 4575 5475
Connection ~ 4575 5475
Wire Wire Line
	4475 5350 4475 5475
Connection ~ 4475 5475
Wire Wire Line
	2100 5500 2100 5725
Wire Wire Line
	2100 3850 2100 4075
Wire Wire Line
	2075 2425 2075 2225
Wire Wire Line
	7975 2475 6575 2475
Wire Wire Line
	6575 2475 6575 1050
Wire Wire Line
	7975 2575 6450 2575
Wire Wire Line
	6450 2575 6450 1150
Wire Wire Line
	7975 2675 6300 2675
Wire Wire Line
	6300 2675 6300 1250
Wire Wire Line
	7975 2775 6150 2775
Wire Wire Line
	6150 2775 6150 1350
Wire Wire Line
	7975 2875 6025 2875
Wire Wire Line
	6025 2875 6025 2675
Wire Wire Line
	7975 2975 5900 2975
Wire Wire Line
	5900 2975 5900 2775
Wire Wire Line
	7975 3075 5825 3075
Wire Wire Line
	5825 3075 5825 2875
Wire Wire Line
	5625 3175 7975 3175
Wire Wire Line
	5625 2975 5625 3175
Wire Wire Line
	7975 3275 5275 3275
Wire Wire Line
	5275 3275 5275 4325
Wire Wire Line
	7975 2375 7850 2375
Wire Wire Line
	10150 1175 9500 1175
Wire Wire Line
	10150 1600 9500 1600
Wire Wire Line
	10150 2025 9500 2025
Wire Wire Line
	9500 2450 10150 2450
Wire Wire Line
	10150 2900 9500 2900
Wire Wire Line
	10150 3325 9500 3325
Wire Wire Line
	10150 3750 9500 3750
Wire Wire Line
	10150 4175 9500 4175
Wire Wire Line
	10175 4875 9500 4875
Wire Wire Line
	10025 1325 9725 1325
Wire Wire Line
	9725 1325 9725 5200
Wire Wire Line
	10050 5025 9725 5025
Connection ~ 9725 5025
Wire Wire Line
	10025 4325 9725 4325
Connection ~ 9725 4325
Wire Wire Line
	10025 3900 9725 3900
Connection ~ 9725 3900
Wire Wire Line
	10025 3475 9725 3475
Connection ~ 9725 3475
Wire Wire Line
	10025 3050 9725 3050
Connection ~ 9725 3050
Wire Wire Line
	10025 2600 9725 2600
Connection ~ 9725 2600
Wire Wire Line
	10025 2175 9725 2175
Connection ~ 9725 2175
Wire Wire Line
	10025 1750 9725 1750
Connection ~ 9725 1750
$Comp
L GNDA #PWR08
U 1 1 56BCA8CE
P 9725 5200
F 0 "#PWR08" H 9725 4950 50  0001 C CNN
F 1 "GNDA" H 9725 5050 50  0000 C CNN
F 2 "" H 9725 5200 50  0000 C CNN
F 3 "" H 9725 5200 50  0000 C CNN
	1    9725 5200
	1    0    0    -1  
$EndComp
Text Label 9500 1175 0    60   ~ 0
IN6-
Text Label 9500 1600 0    60   ~ 0
IN6+
Text Label 9500 2025 0    60   ~ 0
IN5-
Text Label 9500 2450 0    60   ~ 0
IN5+
Text Label 9500 2900 0    60   ~ 0
IN4-
Text Label 9500 3325 0    60   ~ 0
IN4+
Text Label 9500 3750 0    60   ~ 0
IN3-
Text Label 9500 4175 0    60   ~ 0
IN3+
Text Label 9500 4875 0    60   ~ 0
RL_DRV
Wire Wire Line
	4650 1625 4650 1350
Connection ~ 4650 1350
Wire Wire Line
	4550 1625 4550 1250
Connection ~ 4550 1250
Wire Wire Line
	4450 1625 4450 1150
Connection ~ 4450 1150
Wire Wire Line
	4350 1625 4350 1050
Connection ~ 4350 1050
Wire Wire Line
	4675 3250 4675 2975
Connection ~ 4675 2975
Wire Wire Line
	4575 3250 4575 2875
Connection ~ 4575 2875
Wire Wire Line
	4475 3250 4475 2775
Connection ~ 4475 2775
Wire Wire Line
	4375 3250 4375 2675
Connection ~ 4375 2675
$EndSCHEMATC
