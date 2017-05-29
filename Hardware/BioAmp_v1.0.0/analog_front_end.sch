EESchema Schematic File Version 2
LIBS:BioAmp_v1.0.0
LIBS:power
LIBS:BioAmp_v1.0.0-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title "BioAmp-FIUNER-Lab. de Prototipado"
Date "2017-05-19"
Rev "1.0.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ADS1299 U8
U 1 1 56B480B2
P 6050 3550
F 0 "U8" H 6050 5250 60  0000 C CNN
F 1 "ADS1299" H 5100 1800 60  0000 C CNN
F 2 "bioamp:LQFP-64_10x10mm_Pitch0.5mm" H 6050 4300 60  0001 C CNN
F 3 "" H 6050 4300 60  0000 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
Text HLabel 3750 2050 0    60   Input ~ 0
IN8N
Text HLabel 3750 2150 0    60   Input ~ 0
IN8P
Text HLabel 3750 2250 0    60   Input ~ 0
IN7N
Text HLabel 3750 2350 0    60   Input ~ 0
IN7P
Text HLabel 3750 2450 0    60   Input ~ 0
IN6N
Text HLabel 3750 2550 0    60   Input ~ 0
IN6P
Text HLabel 3750 2650 0    60   Input ~ 0
IN5N
Text HLabel 3750 2750 0    60   Input ~ 0
IN5P
Text HLabel 3750 2850 0    60   Input ~ 0
IN4N
Text HLabel 3750 2950 0    60   Input ~ 0
IN4P
Text HLabel 3750 3050 0    60   Input ~ 0
IN3N
Text HLabel 3750 3150 0    60   Input ~ 0
IN3P
Text HLabel 3750 3250 0    60   Input ~ 0
IN2N
Text HLabel 3750 3350 0    60   Input ~ 0
IN2P
Text HLabel 3750 3450 0    60   Input ~ 0
IN1N
Text HLabel 3750 3550 0    60   Input ~ 0
IN1P
Text HLabel 7900 5050 2    60   Input ~ 0
MOSI
Text HLabel 7900 4850 2    60   Input ~ 0
RESET/
Text HLabel 7900 4750 2    60   Output ~ 0
CLK
Text HLabel 7900 4650 2    60   Input ~ 0
START
Text HLabel 7900 4550 2    60   Input ~ 0
CS1/
Text HLabel 7900 4450 2    60   Input ~ 0
SCLK
Text HLabel 7900 4250 2    60   BiDi ~ 0
GPIO1
Text HLabel 7900 4050 2    60   BiDi ~ 0
GPIO2
Text HLabel 7900 3950 2    60   BiDi ~ 0
GPIO3
Text HLabel 7900 3850 2    60   BiDi ~ 0
GPIO4
Text HLabel 7900 3750 2    60   Output ~ 0
DRDY/
Text HLabel 7900 4150 2    60   Output ~ 0
MISO
Text HLabel 7900 2350 2    60   Output ~ 0
BIAS_INV
$Comp
L C C25
U 1 1 56B49EDA
P 3300 4350
F 0 "C25" H 3325 4450 50  0000 L CNN
F 1 "0.1uF" H 3325 4250 50  0000 L CNN
F 2 "bioamp:C_0603" H 3338 4200 50  0001 C CNN
F 3 "" H 3300 4350 50  0000 C CNN
	1    3300 4350
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 56B49F7D
P 3550 4350
F 0 "C26" H 3575 4450 50  0000 L CNN
F 1 "10uF" H 3575 4250 50  0000 L CNN
F 2 "bioamp:C_0603" H 3588 4200 50  0001 C CNN
F 3 "" H 3550 4350 50  0000 C CNN
	1    3550 4350
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 56B49F98
P 3250 5100
F 0 "C24" H 3275 5200 50  0000 L CNN
F 1 "1uF" H 3275 5000 50  0000 L CNN
F 2 "bioamp:C_0603" H 3288 4950 50  0001 C CNN
F 3 "" H 3250 5100 50  0000 C CNN
	1    3250 5100
	1    0    0    -1  
$EndComp
$Comp
L C C27
U 1 1 56B49FDD
P 3550 5100
F 0 "C27" H 3575 5200 50  0000 L CNN
F 1 "100uF" H 3575 5000 50  0000 L CNN
F 2 "bioamp:C_1206" H 3588 4950 50  0001 C CNN
F 3 "" H 3550 5100 50  0000 C CNN
	1    3550 5100
	1    0    0    -1  
$EndComp
$Comp
L C C28
U 1 1 56B4A008
P 3850 5100
F 0 "C28" H 3875 5200 50  0000 L CNN
F 1 "1uF" H 3875 5000 50  0000 L CNN
F 2 "bioamp:C_0603" H 3888 4950 50  0001 C CNN
F 3 "" H 3850 5100 50  0000 C CNN
	1    3850 5100
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR0111
U 1 1 56B4A4C3
P 3550 5350
F 0 "#PWR0111" H 3550 5100 50  0001 C CNN
F 1 "GNDA" H 3550 5200 50  0000 C CNN
F 2 "" H 3550 5350 50  0000 C CNN
F 3 "" H 3550 5350 50  0000 C CNN
	1    3550 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0112
U 1 1 56B4A55B
P 4400 5400
F 0 "#PWR0112" H 4400 5150 50  0001 C CNN
F 1 "GND" H 4400 5250 50  0000 C CNN
F 2 "" H 4400 5400 50  0000 C CNN
F 3 "" H 4400 5400 50  0000 C CNN
	1    4400 5400
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR0113
U 1 1 56B4A795
P 3550 4500
F 0 "#PWR0113" H 3550 4250 50  0001 C CNN
F 1 "GNDA" H 3550 4350 50  0000 C CNN
F 2 "" H 3550 4500 50  0000 C CNN
F 3 "" H 3550 4500 50  0000 C CNN
	1    3550 4500
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 56B34D06
P 8300 1850
F 0 "R17" V 8380 1850 50  0000 C CNN
F 1 "1M" V 8300 1850 50  0000 C CNN
F 2 "bioamp:R_0603" V 8230 1850 50  0001 C CNN
F 3 "" H 8300 1850 50  0000 C CNN
	1    8300 1850
	0    1    1    0   
$EndComp
$Comp
L C C29
U 1 1 56B34D67
P 8300 2150
F 0 "C29" V 8350 2225 50  0000 L CNN
F 1 "1nF" V 8350 1950 50  0000 L CNN
F 2 "bioamp:C_0603" H 8338 2000 50  0001 C CNN
F 3 "" H 8300 2150 50  0000 C CNN
	1    8300 2150
	0    1    1    0   
$EndComp
Text HLabel 8850 2000 2    60   BiDi ~ 0
RL_DRV
$Comp
L GNDA #PWR0114
U 1 1 56B3516C
P 8700 2450
F 0 "#PWR0114" H 8700 2200 50  0001 C CNN
F 1 "GNDA" V 8700 2250 50  0000 C CNN
F 2 "" H 8700 2450 50  0000 C CNN
F 3 "" H 8700 2450 50  0000 C CNN
	1    8700 2450
	0    -1   -1   0   
$EndComp
$Comp
L GNDA #PWR0115
U 1 1 56B35228
P 8750 2750
F 0 "#PWR0115" H 8750 2500 50  0001 C CNN
F 1 "GNDA" V 8750 2550 50  0000 C CNN
F 2 "" H 8750 2750 50  0000 C CNN
F 3 "" H 8750 2750 50  0000 C CNN
	1    8750 2750
	0    -1   -1   0   
$EndComp
$Comp
L A_VCC #PWR0116
U 1 1 56B34890
P 8000 2850
F 0 "#PWR0116" H 8000 2700 50  0001 C CNN
F 1 "A_VCC" V 8000 3100 50  0000 C CNN
F 2 "" H 8000 2850 50  0000 C CNN
F 3 "" H 8000 2850 50  0000 C CNN
	1    8000 2850
	0    1    1    0   
$EndComp
$Comp
L C C30
U 1 1 56B34C60
P 9000 3100
F 0 "C30" H 9025 3200 50  0000 L CNN
F 1 "0.1uF" H 9025 3000 50  0000 L CNN
F 2 "bioamp:C_0603" H 9038 2950 50  0001 C CNN
F 3 "" H 9000 3100 50  0000 C CNN
	1    9000 3100
	1    0    0    -1  
$EndComp
$Comp
L C C31
U 1 1 56B34C9F
P 9300 3100
F 0 "C31" H 9325 3200 50  0000 L CNN
F 1 "1uF" H 9325 3000 50  0000 L CNN
F 2 "bioamp:C_0603" H 9338 2950 50  0001 C CNN
F 3 "" H 9300 3100 50  0000 C CNN
	1    9300 3100
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR0117
U 1 1 56B34F87
P 9150 3300
F 0 "#PWR0117" H 9150 3050 50  0001 C CNN
F 1 "GNDA" H 9150 3150 50  0000 C CNN
F 2 "" H 9150 3300 50  0000 C CNN
F 3 "" H 9150 3300 50  0000 C CNN
	1    9150 3300
	1    0    0    -1  
$EndComp
Text Notes 8450 3300 0    60   ~ 0
CLK interno\n
$Comp
L D_VCC #PWR0118
U 1 1 56B355AE
P 8050 3450
F 0 "#PWR0118" H 8050 3300 50  0001 C CNN
F 1 "D_VCC" V 8050 3700 50  0000 C CNN
F 2 "" H 8050 3450 50  0000 C CNN
F 3 "" H 8050 3450 50  0000 C CNN
	1    8050 3450
	0    1    1    0   
$EndComp
Text Notes 8200 4800 0    60   ~ 0
Salida señal de CLK para placa "slave"
$Comp
L A_VCC #PWR0119
U 1 1 56B35A64
P 3700 3850
F 0 "#PWR0119" H 3700 3700 50  0001 C CNN
F 1 "A_VCC" V 3700 4100 50  0000 C CNN
F 2 "" H 3700 3850 50  0000 C CNN
F 3 "" H 3700 3850 50  0000 C CNN
	1    3700 3850
	0    -1   -1   0   
$EndComp
$Comp
L GNDA #PWR0120
U 1 1 56B35A94
P 3650 3950
F 0 "#PWR0120" H 3650 3700 50  0001 C CNN
F 1 "GNDA" V 3650 3750 50  0000 C CNN
F 2 "" H 3650 3950 50  0000 C CNN
F 3 "" H 3650 3950 50  0000 C CNN
	1    3650 3950
	0    1    1    0   
$EndComp
$Comp
L JUMPER JP1
U 1 1 56B36264
P 2600 3500
F 0 "JP1" H 2600 3650 50  0000 C CNN
F 1 "JUMPER" H 2600 3420 50  0000 C CNN
F 2 "bioamp:R_0603" H 2600 3500 50  0001 C CNN
F 3 "" H 2600 3500 50  0000 C CNN
	1    2600 3500
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP2
U 1 1 56B362B5
P 2600 3900
F 0 "JP2" H 2600 4050 50  0000 C CNN
F 1 "JUMPER" H 2600 3820 50  0000 C CNN
F 2 "bioamp:R_0603" H 2600 3900 50  0001 C CNN
F 3 "" H 2600 3900 50  0000 C CNN
	1    2600 3900
	1    0    0    -1  
$EndComp
Text HLabel 1900 3650 0    60   BiDi ~ 0
SRB
Text Label 2950 3500 0    60   ~ 0
SRB1
Text Label 2950 3900 0    60   ~ 0
SRB2
Text Notes 2100 4150 0    60   ~ 0
Señales de referencia\n
$Comp
L GND #PWR0121
U 1 1 56B3691D
P 7700 5250
F 0 "#PWR0121" H 7700 5000 50  0001 C CNN
F 1 "GND" H 7700 5100 50  0000 C CNN
F 2 "" H 7700 5250 50  0000 C CNN
F 3 "" H 7700 5250 50  0000 C CNN
	1    7700 5250
	1    0    0    -1  
$EndComp
$Comp
L D_VCC #PWR0122
U 1 1 56B369C9
P 8350 4950
F 0 "#PWR0122" H 8350 4800 50  0001 C CNN
F 1 "D_VCC" V 8350 5200 50  0000 C CNN
F 2 "" H 8350 4950 50  0000 C CNN
F 3 "" H 8350 4950 50  0000 C CNN
	1    8350 4950
	0    1    1    0   
$EndComp
Text Notes 8750 5000 0    60   ~ 0
Siempre encendido (si hay alimentación)
Wire Wire Line
	4600 2050 3750 2050
Wire Wire Line
	4600 2150 3750 2150
Wire Wire Line
	3750 2250 4600 2250
Wire Wire Line
	3750 2350 4600 2350
Wire Wire Line
	4600 3250 3750 3250
Wire Wire Line
	4600 3350 3750 3350
Wire Wire Line
	3750 3450 4600 3450
Wire Wire Line
	4600 3550 3750 3550
Wire Wire Line
	7550 5050 7900 5050
Wire Wire Line
	7550 4850 7900 4850
Wire Wire Line
	7550 4750 7900 4750
Wire Wire Line
	7550 4650 7900 4650
Wire Wire Line
	7550 4550 7900 4550
Wire Wire Line
	7550 4450 7900 4450
Wire Wire Line
	7550 4150 7900 4150
Wire Wire Line
	7550 3750 7900 3750
Wire Wire Line
	7550 2350 7900 2350
Wire Wire Line
	3300 4200 3850 4200
Connection ~ 3550 4200
Wire Wire Line
	3300 4500 3850 4500
Connection ~ 3550 4500
Wire Wire Line
	3250 4950 3250 4700
Wire Wire Line
	3250 4700 4050 4700
Wire Wire Line
	4050 4700 4050 4550
Wire Wire Line
	4050 4550 4600 4550
Wire Wire Line
	3550 4950 3550 4750
Wire Wire Line
	3550 4750 4600 4750
Wire Wire Line
	3850 4950 4600 4950
Wire Wire Line
	4600 5050 4400 5050
Wire Wire Line
	4400 5050 4400 5400
Wire Wire Line
	3850 5250 3850 5300
Wire Wire Line
	3250 5300 4100 5300
Wire Wire Line
	3250 5300 3250 5250
Wire Wire Line
	3550 5250 3550 5350
Connection ~ 3550 5300
Wire Wire Line
	4600 4350 3850 4350
Wire Wire Line
	3850 4350 3850 4200
Wire Wire Line
	4600 4450 3850 4450
Wire Wire Line
	3850 4450 3850 4500
Wire Wire Line
	8150 2150 7550 2150
Wire Wire Line
	8150 1850 8050 1850
Wire Wire Line
	8050 1850 8050 2150
Connection ~ 8050 2150
Wire Wire Line
	8450 1850 8550 1850
Wire Wire Line
	8550 1850 8550 2150
Wire Wire Line
	8550 2150 8450 2150
Wire Wire Line
	7550 2250 7750 2250
Wire Wire Line
	7750 2250 7750 2150
Connection ~ 7750 2150
Wire Wire Line
	8850 2000 8550 2000
Connection ~ 8550 2000
Wire Wire Line
	7550 2450 8700 2450
Wire Wire Line
	7550 2650 8600 2650
Wire Wire Line
	8600 2650 8600 3150
Wire Wire Line
	8600 3150 7550 3150
Wire Wire Line
	7550 2750 8750 2750
Connection ~ 8600 2750
Wire Wire Line
	7550 2550 7900 2550
Wire Wire Line
	7900 2550 7900 3050
Wire Wire Line
	7550 2850 8000 2850
Wire Wire Line
	7900 3050 7550 3050
Connection ~ 7900 2850
Wire Wire Line
	7550 2950 9300 2950
Connection ~ 9000 2950
Wire Wire Line
	9000 3250 9000 3300
Wire Wire Line
	9000 3300 9300 3300
Wire Wire Line
	9300 3300 9300 3250
Connection ~ 9150 3300
Wire Wire Line
	8050 3250 7550 3250
Wire Wire Line
	7550 3350 8075 3350
Wire Wire Line
	7550 3550 7900 3550
Wire Wire Line
	7900 3550 7900 3350
Connection ~ 7900 3350
Wire Wire Line
	8050 3450 7550 3450
Wire Wire Line
	7550 3650 8000 3650
Wire Wire Line
	8000 3650 8000 3450
Connection ~ 8000 3450
Wire Wire Line
	7900 4350 7550 4350
Wire Wire Line
	4600 3850 3700 3850
Wire Wire Line
	4600 4050 4000 4050
Wire Wire Line
	4000 3850 4000 4150
Connection ~ 4000 3850
Wire Wire Line
	4000 4150 4600 4150
Connection ~ 4000 4050
Wire Wire Line
	4600 3950 3650 3950
Wire Wire Line
	4600 4250 4300 4250
Wire Wire Line
	4300 4250 4300 3950
Connection ~ 4300 3950
Wire Wire Line
	4600 5150 4100 5150
Wire Wire Line
	4100 5150 4100 5300
Connection ~ 3850 5300
Wire Wire Line
	4600 3650 3250 3650
Wire Wire Line
	4600 3750 3250 3750
Wire Wire Line
	3250 3750 3250 3900
Wire Wire Line
	3250 3900 2900 3900
Wire Wire Line
	3250 3650 3250 3500
Wire Wire Line
	3250 3500 2900 3500
Wire Wire Line
	2300 3500 2050 3500
Wire Wire Line
	2050 3500 2050 3900
Wire Wire Line
	2050 3900 2300 3900
Wire Wire Line
	1900 3650 2050 3650
Connection ~ 2050 3650
Wire Wire Line
	7550 5150 7700 5150
Wire Wire Line
	7700 5150 7700 5250
Wire Wire Line
	8350 4950 7550 4950
Text Notes 5175 4425 0    60   Italic 0
Referencia interna 4.5V\n
$Comp
L GND #PWR0123
U 1 1 56C34EA8
P 7900 4350
F 0 "#PWR0123" H 7900 4100 50  0001 C CNN
F 1 "GND" V 7900 4175 50  0000 C CNN
F 2 "" H 7900 4350 50  0000 C CNN
F 3 "" H 7900 4350 50  0000 C CNN
	1    7900 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 3850 7550 3850
Wire Wire Line
	7550 3950 7900 3950
Wire Wire Line
	7900 4050 7550 4050
Wire Wire Line
	7900 4250 7550 4250
$Comp
L GND #PWR0124
U 1 1 56C3588B
P 8075 3350
F 0 "#PWR0124" H 8075 3100 50  0001 C CNN
F 1 "GND" V 8075 3150 50  0000 C CNN
F 2 "" H 8075 3350 50  0000 C CNN
F 3 "" H 8075 3350 50  0000 C CNN
	1    8075 3350
	0    -1   -1   0   
$EndComp
NoConn ~ 4600 4850
NoConn ~ 4600 4650
NoConn ~ 7550 2050
Wire Wire Line
	4600 3150 3750 3150
Wire Wire Line
	3750 3050 4600 3050
Wire Wire Line
	4600 2950 3750 2950
Wire Wire Line
	3750 2850 4600 2850
Wire Wire Line
	4600 2750 3750 2750
Wire Wire Line
	4600 2650 3750 2650
Wire Wire Line
	3750 2550 4600 2550
Wire Wire Line
	4600 2450 3750 2450
Text Notes 8425 3975 0    60   ~ 12
CLKSEL debe conectarse a VCC en caso de ser \nMASTER y a GND en caso de ser SLAVE. Se puede\nconectar a la misma linea de control M/S.
Text HLabel 8050 3250 2    60   Input ~ 0
M/S
$EndSCHEMATC
