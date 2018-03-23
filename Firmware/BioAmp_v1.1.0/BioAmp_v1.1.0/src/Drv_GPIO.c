/*
 * Drv_GPIO.c
 *
 *  Created on: 13/11/2015
 *      Author: alumno
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









