/*
 * Drv_UART.h
 *
 *  Created on: 5/11/2015
 *      Author: alumno
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
