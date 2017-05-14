/****************************BioAmp Project*************************************************************

Copyright 2017 - Laboratorio de Prototipado Electronico y 3D - FIUNER

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/*
===============================================================================
 Initial Authors : 
		   Juan Ignacio Cerrudo (juanicerrudo@gmail.com) - Developer
		   Agustin Solano (asolano@gmail.com) - Developer
                   Eduardo Filomena (efilomena@bioingenieria.edu.ar) - Requirements Definition
		   Juan Manuel Reta (jmreta@ingenieria.edu.ar ) - Project Manager

 Version     : v1.0.0
 Description : main definition
===============================================================================
*/

#ifndef DRV_UART_H_
#define DRV_UART_H_

//#include "board.h"
#include "lpc_types.h"

/** @defgroup UART_Library
 *  @ingroup "Biopoteciales-LIRINS"
 *  Driver for controlling the Serial UART.
 *  @{
 */

/**
 * Definitions
 */

//TODO: for "Biopotenciales LIRINS" project, change the UART to LPC_UART0
#define UART_SELECTION 	LPC_UART0  //TODO: el placa utiliza la UART0
#define IRQ_SELECTION 	UART0_IRQn
#define HANDLER_NAME 	UART0_IRQHandler

//#define BAUD_RATE	115200
#define BAUD_RATE	921600
/* Transmit and receive ring buffer sizes */
#define UART_SRB_SIZE 128	/* Send */
#define UART_RRB_SIZE 32	/* Receive */

/* Transmit and receive ring buffers */
//STATIC RINGBUFF_T txring, rxring;




/** @brief UART de-initialization
 */
void Drv_UART_DeInit ();

/** @brief UART initial setup and initialization
 */
void Drv_UART_setup();

/**
 * @brief Ring Buffers initialization
 */
void Drv_UART_RBinit();

/**
 * @brief	UART 0 interrupt handler using ring buffers
 * @return	Nothing
 */
void HANDLER_NAME(void);

/**
 * @brief Send data by UART
 * @param data[] Array of data to be sent
 * @param numByte Number of bytes to send by UART 
 */
void Drv_UART_Send(uint8_t data[], int numBytes);

/**
 * @brief Receive data by UART with Ring Buffer
 */
int Drv_UART_ReceiveRB(uint8_t data[], int bytes);

/**
 * @brief Read one byte
 * @return Received byte
 */
uint8_t Drv_UART_ReadByte();

/**
 * @brief Indicates if there is new data to be read
 * @return TRUE if there is new byte at UART buffer, FALSE if not
 */
bool Drv_UART_available();

/**
 * @}
 */

#endif /* DRV_UART_H_ */
