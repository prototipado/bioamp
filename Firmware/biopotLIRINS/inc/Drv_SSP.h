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
