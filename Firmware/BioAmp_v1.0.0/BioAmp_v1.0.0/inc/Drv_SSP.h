/*
 * Drv_SSP.h
 *
 *  Created on: 17/11/2015
 *      Author: alumno
 */

#ifndef SRC_DRV_SSP_H_
#define SRC_DRV_SSP_H_

#include "lpc_types.h"

/** @defgroup SSP_Library
 *  @ingroup "Biopoteciales-LIRINS"
 *  Driver for controlling the Synchronous Serial Port.
 *  @{
 */

//Definitions and Declarations
#define LPC_SSP LPC_SSP0 //define which SSP module to use

/**
 * @brief Init the SSP module
 */
void Drv_SSP_init();

/**
 * @brief De-Init the SSP module
 */
void Drv_SSP_deInit();

/**
 * @brief Configuration of format and data of the SSP module
 */
void Drv_SSP_setup();

/**
 * @brief Send and Receive a byte via SSP
 * @param to_send Byte to be sent
 * @return Received byte 
 */
uint8_t Drv_SSP_transferByte(uint8_t to_send);


uint8_t spi_rw( uint8_t out );
/**
 * @}
 */

void Drv_SSP_transferMultiplBytes(uint8_t* to_send, uint8_t* to_recive, uint8_t length);

#endif /* SRC_DRV_SSP_H_ */
