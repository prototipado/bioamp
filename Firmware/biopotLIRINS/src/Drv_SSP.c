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

#include "Drv_SSP.h"
#include "chip.h"
/**
 * @brief Init the SSP module
 */
void Drv_SSP_init()
{
	//TODO: modificar la siguiente línea cuando se modifique la board layer
	//Board_SSP_Init(LPC_SSP);
	Chip_SSP_Init(LPC_SSP); //select which of the modules to initialize
}

/**
 * @brief De-Init the SSP module
 */
void Drv_SSP_deInit()
{
	Chip_SSP_DeInit(LPC_SSP); //select which of the modules to de-initialize
}

/**
 * @brief Configuration of format and data of the SSP module
 */
void Drv_SSP_setup()
{
	static SSP_ConfigFormat ssp_format;
	ssp_format.frameFormat = SSP_FRAMEFORMAT_SPI; //configure the module with SPI protocol
	ssp_format.bits = SSP_BITS_8; // 8 bits by frame
	ssp_format.clockMode = SSP_CLOCK_MODE1; // see Clock Modes

	Chip_SSP_SetFormat(LPC_SSP, ssp_format.bits, ssp_format.frameFormat, ssp_format.clockMode);

	Chip_SSP_Enable(LPC_SSP);

	Chip_SSP_SetMaster(LPC_SSP, 1); //set SSP module as Master

//	uint32_t clk = Chip_Clock_GetPCLKDiv(SYSCTL_PCLK_SSP0);
	Chip_Clock_SetPCLKDiv(SYSCTL_PCLK_SSP0,1);
//	clk = Chip_Clock_GetPCLKDiv(SYSCTL_PCLK_SSP0)

	Chip_SSP_SetBitRate(LPC_SSP, 16000000); //set bit rate
	//LPC_SSP->CR0 = 0x0077;

}


/**
 * @brief Send and Receive a byte via SSP
 * @param to_send Byte to be sent
 * @return Received byte 
 */
uint8_t Drv_SSP_transferByte(uint8_t to_send)
{
	uint8_t ssp_tx_buf = to_send; //buffer of data to be sent
	uint8_t ssp_rx_buf = 0; //buffer of received data

	Chip_SSP_DATA_SETUP_T ssp_xf;
	ssp_xf.length = 1; //transfer one byte
	ssp_xf.rx_cnt = 0;
	ssp_xf.rx_data = &ssp_rx_buf;
	ssp_xf.tx_cnt = 0;
	ssp_xf.tx_data = &ssp_tx_buf;

	Chip_SSP_RWFrames_Blocking(LPC_SSP, &ssp_xf);

	return ssp_rx_buf;
}


/**
 * @brief Faster way to transfer a single a byte via SSP
 * @param out Byte to be sent
 * @return in Received byte
 */

uint8_t spi_rw( uint8_t out )
{
  uint8_t in;
  LPC_SSP0->DR = out & 0xFFFF;
  while (LPC_SSP0->SR & 0x10 ) { ; }
  in = LPC_SSP0->DR;

  return in;
}

/**
 * @brief Send and Receive a byte via SSP
 * @param to_send Byte to be sent
 * @return Received byte
 */
void Drv_SSP_transferMultiplBytes(uint8_t* to_send, uint8_t* to_recive, uint8_t length)
{
	uint8_t* ssp_tx_buf = to_send; //buffer of data to be sent
	uint8_t* ssp_rx_buf = to_recive; //buffer of received data

	Chip_SSP_DATA_SETUP_T ssp_xf;
	ssp_xf.length = length; //transfer one byte
	ssp_xf.rx_cnt = 0;
	ssp_xf.rx_data = ssp_rx_buf;
	ssp_xf.tx_cnt = 0;
	ssp_xf.tx_data = ssp_tx_buf;

	Chip_SSP_RWFrames_Blocking(LPC_SSP, &ssp_xf);


}
