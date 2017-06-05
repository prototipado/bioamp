/*
 * Drv_GPIO.h
 *
 *  Created on: 13/11/2015
 *      Author: alumno
 */

#ifndef DRV_GPIO_H_
#define DRV_GPIO_H_

#include "lpc_types.h"

/** @defgroup GPIO_Library
 *  @ingroup "Biopoteciales-LIRINS"
 *  Driver for controlling GPIO ports.
 *  @{
 */

//Declarations and definitions
#define GPIO_PORT0 0
#define GPIO_PORT1 1
#define GPIO_PORT2 2
#define GPIO_PORT3 3

/**
 * @brief Initialize GPIO port
 */
void Drv_GPIO_init();

/**
 * @brief De-Initialize GPIO port
 */
void Drv_GPIO_deInit();

/**
 * @brief Set a GPIO pin state
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @param state: TRUE for HIGH, FALSE for LOW
 */
void Drv_GPIO_setPinState(uint8_t port, uint8_t pin, bool state);

/**
 * @brief Get a GPIO pin state
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @return TRUE if the GPIO is HIGH, FALSE if LOW
 */
bool Drv_GPIO_getPinState(uint8_t port, uint8_t pin);

/**
 * @brief Set GPIO direction for a single GPIO pin
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @param output: TRUE for OUTPUT, FALSE for INPUT
 */
void Drv_GPIO_setPinDir(uint8_t port, uint8_t pin, bool output);

/**
 * @brief Get GPIO direction for a single GPIO pin
 * @param port Number of GPIO port 
 * @param pin Number of GPIO pin
 * @return TRUE in the GPIO is an OUTPUT, FALSE if INPUT
 */
bool Drv_GPIO_getPinDir(uint8_t port, uint8_t pin);

/**
 * @brief Toggle an individual GPIO output to the opposite state
 * @param port Number of GPIO port
 * @param pin Number of GPIO pin
 */
void Drv_GPIO_setPinToggle(uint8_t port, uint8_t pin);

/**
 * @}
 */


#endif /* DRV_GPIO_H_ */
