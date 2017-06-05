/*
 * @brief BioAmp_v1.0.0 -Sysinit file
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2013
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#include "board_api.h"
#include "chip.h"

/* The System initialization code is called prior to the application and
   initializes the board for run-time operation. Board initialization
   includes clock setup and default pin muxing configuration. */

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/


//TODO: BioAmp_v1.0.0 project pin muxing
STATIC const PINMUX_GRP_T pinmuxing[] = {
		{1, 27, IOCON_MODE_INACT | IOCON_FUNC0},	// M/S signal (GPIO funcionality)
		{0, 16, IOCON_MODE_INACT | IOCON_FUNC0},	// CS1 signal (GPIO funcionality)
		{1, 28, IOCON_MODE_INACT | IOCON_FUNC0},	// CS2 signal (GPIO funcionality)
		{2, 8, IOCON_MODE_INACT | IOCON_FUNC0},		// RESET/ signal (GPIO funcionality)
	//	{2, 8, IOCON_MODE_PULLUP | IOCON_FUNC0},
		{2, 9, IOCON_MODE_INACT | IOCON_FUNC0},		// START signal (GPIO funcionality)
		{2, 12, IOCON_MODE_INACT | IOCON_FUNC0},	// DRDY/ signal (GPIO funcionality)
		{2, 10, IOCON_MODE_INACT | IOCON_FUNC0},	// ISP signal (GPIO funcionality)
		{1, 0, IOCON_MODE_INACT | IOCON_FUNC0},		// LED_R signal (GPIO funcionality)
		{1, 1, IOCON_MODE_INACT | IOCON_FUNC0},		// LED_V signal (GPIO funcionality)
		{0, 15, IOCON_MODE_INACT | IOCON_FUNC2},	// SSP SCK signal (SCK0 funcionality)
		{0, 17, IOCON_MODE_INACT | IOCON_FUNC2},	// SSP MISO signal (MISO0 funcionality)
		{0, 18, IOCON_MODE_INACT | IOCON_FUNC2},	// SSP MOSI signal (MOSI0 funcionality)
		{0, 2, IOCON_MODE_INACT | IOCON_FUNC1},		// UART TX signal (TXD0 funcionality)
		{0, 3, IOCON_MODE_INACT | IOCON_FUNC1},		// UART RX signal (RXD0 funcionality)

		/* SSP1 pin muxing */
		{0, 7, IOCON_MODE_INACT | IOCON_FUNC2},
		{0, 6, IOCON_MODE_INACT | IOCON_FUNC2},
		{0, 8, IOCON_MODE_INACT | IOCON_FUNC2},
		{0, 9, IOCON_MODE_INACT | IOCON_FUNC2},

		/*Additional Configurations supported by the BioAmp_v1.0.0 board */

		//{2, 0, IOCON_MODE_INACT | IOCON_FUNC0},		// CS3 signal (GPIO funcionality)
		//{0, 27, IOCON_MODE_INACT | IOCON_FUNC1},		// I2C SDA signal (SDA0 funcionality)
		//{0, 28, IOCON_MODE_INACT | IOCON_FUNC1},		// I2C SCL signal (SCL0 funcionality)

		/* Configurations for LPC1769 Stick  */
		//{0,  0,   IOCON_MODE_INACT | IOCON_FUNC2},	/* TXD3 */
		//{0,  1,   IOCON_MODE_INACT | IOCON_FUNC2},	/* RXD3 */
		//{0,  22,  IOCON_MODE_INACT | IOCON_FUNC0},	/* Led 0 */
		//{0x1, 27, IOCON_MODE_INACT | IOCON_FUNC1},	/* CLKOUT */

};

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/
/* System oscillator rate and RTC oscillator rate */
const uint32_t OscRateIn = 12000000;

//TODO: not use RTC
const uint32_t RTCOscRateIn = 0;

/*****************************************************************************
 * Private functions
 ****************************************************************************/

/*****************************************************************************
 * Public functions
 ****************************************************************************/

/* Sets up system pin muxing */
void Board_SetupMuxing(void)
{
	Chip_IOCON_SetPinMuxing(LPC_IOCON, pinmuxing, sizeof(pinmuxing) / sizeof(PINMUX_GRP_T));
}

/* Setup system clocking */
void Board_SetupClocking(void)
{
	Chip_SetupXtalClocking();

	/* Setup FLASH access to 4 clocks (100MHz clock) */
	Chip_SYSCTL_SetFLASHAccess(FLASHTIM_100MHZ_CPU);

	/* Enable and setup SysTick Timer at a periodic rate */
//	SysTick_Config(SystemCoreClock / TICKRATE_HZ1);
}

/* Set up and initialize hardware prior to call to main */
void Board_SystemInit(void)
{
	Board_SetupMuxing();
	Board_SetupClocking();
}

/* Set up and initialize all required blocks and functions related to the
   board hardware */
void Board_Init(void)
{
	Chip_IOCON_Init(LPC_IOCON);

}
