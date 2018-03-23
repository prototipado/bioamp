/*
===============================================================================
 Name        : biopotLIRINS.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/

#include "string.h"
#include "Drv_Devices.h"
#include "Drv_GPIO.h"
#include "Definitions_ADS1299.h"
#include "Drv_ADS1299.h"

#include <cr_section_macros.h>

// TODO: insert other include files here

// TODO: insert other definitions and declarations here


/** @defgroup Application_Layer
 *  @ingroup BioAmp
 *  Main function with the application.
 *  @{
 */


int main(void) {


	Drv_Devices_startDevices();

	bool master = Drv_Devices_isMaster();


	if(master == TRUE) //If the board is Master, can get commands via UART
	{
		delayMs(0, 200); // stall to let Slave to configure itself
		Drv_Devices_startFromScratch();
		Drv_GPIO_setPinState(LED_R_PORT, LED_R_PIN, FALSE); //set LOW
		Drv_GPIO_setPinState(LED_V_PORT, LED_V_PIN, TRUE); //set HIGH


		while(1)
		{
			Drv_Devices_sendChannelData(); // send data when is available

			Drv_Devices_eventSerial(); //receive commands
		}
	}
	else //If the board is Slave, can't get commands via UART
	{
		Drv_GPIO_setPinState(LED_R_PORT, LED_V_PIN, FALSE); //set LOW
		Drv_GPIO_setPinState(LED_V_PORT, LED_R_PIN, TRUE); //set HIGH

		Drv_Devices_startAsSlave();

		while(1){}
	}


    return 0 ;
}

/**
 * @}
 */
