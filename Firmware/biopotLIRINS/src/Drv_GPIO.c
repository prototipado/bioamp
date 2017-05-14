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


#include "Drv_GPIO.h"
#include "chip.h"

/**
 * @brief Initialize GPIO port
 */
void Drv_GPIO_init()
{
	Chip_GPIO_Init(LPC_GPIO);

	SystemCoreClockUpdate();
	/* Enable and setup SysTick Timer at a periodic rate */
	SysTick_Config(SystemCoreClock / 10);
}

/**
 * @brief De-Initialize GPIO port
 */
void Drv_GPIO_deInit()
{
	Chip_GPIO_DeInit(LPC_GPIO);
}

/**
 * @brief Set a GPIO pin state
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @param state TRUE for HIGH, FALSE for LOW
 */
void Drv_GPIO_setPinState(uint8_t port, uint8_t pin, bool state)
{
	Chip_GPIO_SetPinState(LPC_GPIO, port, pin, state);
}

/**
 * @brief Get a GPIO pin state
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @return TRUE if the GPIO is HIGH, FALSE if LOW
 */
bool Drv_GPIO_getPinState(uint8_t port, uint8_t pin)
{
	return Chip_GPIO_GetPinState(LPC_GPIO, port, pin);
}

/**
 * @brief Set GPIO direction for a single GPIO pin
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @param output: TRUE for OUTPUT, FALSE for INPUT
 */
void Drv_GPIO_setPinDir(uint8_t port, uint8_t pin, bool output)
{
	Chip_GPIO_SetPinDIR(LPC_GPIO, port, pin, output);
}

/**
 * @brief Get GPIO direction for a single GPIO pin
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @return TRUE in the GPIO is an OUTPUT, FALSE if INPUT
 */
bool Drv_GPIO_getPinDir(uint8_t port, uint8_t pin)
{
	return Chip_GPIO_GetPinDIR(LPC_GPIO, port, pin);
}

/**
 * @brief Toggle an individual GPIO output to the opposite state
 * @param port Number of GPIO port
 * @param pin Number of GPIO pin
 */
void Drv_GPIO_setPinToggle(uint8_t port, uint8_t pin)
{
	Chip_GPIO_SetPinToggle(LPC_GPIO, port, pin);
}









