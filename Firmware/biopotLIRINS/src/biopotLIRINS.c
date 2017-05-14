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

#include "string.h"
#include "Drv_Devices.h"
#include "Drv_GPIO.h"
#include "Definitions_ADS1299.h"
#include "Drv_ADS1299.h"

#include <cr_section_macros.h>

// TODO: insert other include files here

// TODO: insert other definitions and declarations here


/** @defgroup Application_Layer
 *  @ingroup "Biopoteciales-LIRINS"
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


		while(1)
		{
			Drv_Devices_sendChannelData(); // send data when is available

			Drv_Devices_eventSerial(); //receive commands
		}
	}
	else //If the board is Slave, can't get commands via UART
	{
		Drv_Devices_startAsSlave();

		while(1){}
	}


    return 0 ;
}

/**
 * @}
 */
