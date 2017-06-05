/*
 * Drv_Devices.h
 *
 *  Created on: 6/11/2015
 *      Author: alumno
 */

#ifndef DRV_DEVICES_H_
#define DRV_DEVICES_H_


#include "lpc_types.h"

/** @defgroup Devices_Library
 *  @ingroup "Biopoteciales-LIRINS"
 *  Driver for controlling the different devices used by the application.
 *  @{
 */

/**
 * Definitions and Declarations
 */
//TODO: Estos pines está configurados para probrar con la BaseBoard. Modificar para la placa Final

#define MS_PIN			27 // M/S (Master/Slave) signal pin
#define MS_PORT			1  // M/S signal port

#define LED_R_PIN		0 // Red LED pin
#define LED_R_PORT		1 // Red LED port

#define LED_V_PIN		1 // Green LED pin
#define LED_V_PORT		1 // Green LED port


/**
 * @brief Flag to indicate if the ADS1299 is acquiring data or not
 */
extern bool is_running;

/**
 * @brief Flag to indicate if channel settings commands are being received
 */
extern bool getChannelSettings;

/**
 * @brief Mode of use: 8 or 16 channels
 */
//#define OUTPUT_NOTHING 0 //quiet
//#define OUTPUT_8_CHAN 1 //not using Slave Board
//#define OUTPUT_16_CHAN 2 //using Slave Board
extern uint8_t  outputType; //default to 8 channels

/**
 * @brief Counter to have control of the received commands
 */
extern uint8_t plusCounter;

/**
 * @brief Auxiliary byte
 */
extern uint8_t testChar;

/**
 * @brief Keep track of what channel we are loading settings for
 */
extern uint8_t currentChannelToSet;

/**
 * @brief Counter used to retrieve channel settings from serial port
 */
extern uint8_t channelSettingsCounter;

/**
 * @brief Counter used to retrieve lead off settings from serial port
 */
extern uint8_t leadOffSettingsCounter;

/**
 * @brief Flag to indicate if lead off settings commands are being received
 */
extern bool getLeadOffSettings;

/**
 * @brief Flag to indicate if the board is Master (HIGH state) or Slave (LOW state)
 */
extern bool isMaster;


/**
 * @brief Function for receiving new commands
 */
void Drv_Devices_eventSerial();

/**
 * @brief Function for interpreting commands
 * @param token Command to be decoded and interpreted
 */
void Drv_Devices_getCommands(uint8_t token);

/**
 * @brief Stop data acquisition
 * @return HIGH if the device is running, LOW if not
 */
bool Drv_Devices_stopRunning();

/**
 * @brief Start data acquisition
 * @param OUT_TYPE Define if quiet or how many channels are active:  OUTPUT_NOTHING, OUTPUT_8_CHAN, OUTPUT_16_CHAN
 * @return HIGH if the device is running, LOW if not
 */
bool Drv_Devices_startRunning(int OUT_TYPE);


/**
* @description: This is a function that can be called multiple times, this is
*                 what we refer to as a `soft reset`. You will hear/see this
*                 many times.
*/
void Drv_Devices_boardReset(void);


/**
 * @brief Start the system from scratch, send initial message and get the board ready to get commands
 */
void Drv_Devices_startFromScratch();

/**
 * @brief Send characters to shake hands with the controlling program
 */
void Drv_Devices_sendEOT();

/**
 * @brief Call init and start functions of the different peripherals of the uC
 */
void Drv_Devices_startDevices();

/**
 * @brief Retrieve parameters and execute channel settings
 * @param parameter Setting parameter received as command: CHAN_NUM, POWER_DOWN, GAIN_SET, INPUT_TYPE_SET, BIAS_SET, SRB2_SET, SRB1_SET
 */
void Drv_Devices_loadChannelSettings(uint8_t parameter);

/**
 * @brief Convert channel number from character to number
 * @param n Character defining channel: "1-8", "Q-I"
 * @return Channel number
 */
uint8_t Drv_Devices_getChannelNumber(uint8_t n);

/**
 * @brief Stop acquisition, set the channels and re-start acquisition
 * @param channel Channel number
 */
void Drv_Devices_writeChannelSettings_maintainRunningState(uint8_t channel);

/**
 * @brief Update sampling frequency
 * @param freq Sampling frequency
 */
void Drv_Devices_updateFrequency(uint8_t freq);


/**
 * @brief Set all channels to the default settings
 */
void Drv_Devices_setChannelsToDefaultSettings();

/**
 * @brief Activate or De-activate channel maintaining running state
 * @param channel Channel number
 * @param start Channel desired state: TRUE (1) to activate channel, FALSE (0) to de-activate channel
 */
void Drv_Devices_changeChannelState_maintainRunningState(uint8_t channel, uint8_t start);

/**
 * @brief Set test inputs to all channels
 * @param inputCode Input types
 * @param amplitudCode Amplitude of the test signal: ADSTESTSIG_NOCHANGE, ADSTESTSIG_AMP_1X, ADSTESTSIG_AMP_2X 
 * @param freqCode Frequence of the test signal: ADSTESTSIG_NOCHANGE, ADSTESTSIG_PULSE_SLOW, ADSTESTSIG_PULSE_FAST
 */
 void Drv_Devices_activateAllChannelsToTestCondition(uint8_t testInputCode, uint8_t amplitudeCode, uint8_t freqCode);

 /**
  * @brief Print the current state of all ADS1299 registers
  */
 void Drv_Devices_printRegisters();
 
  /**
 * @brief To get and send by UART the name of a specific ADS1299 register
 * @param regNumber Number of register in decimal (0-23)
 */
 void Drv_Devices_printRegisterName(uint8_t regNumber);

 /**
  * @brief Print the current Default Channel Settings
  */
 void Drv_Devices_printDefaultChannelSettings();

 /**
  * @brief Change lead off detect settings and re-start device
  * @param channel Channel number
  */
 void Drv_Devices_changeChannelLeadOffDetect_maintainRunningState(uint8_t channel);

 /**
 * @brief Retrieve parameters and execute channel settings
 * @param parameter Setting parameter received as command: PCHAN, NCHAN
 */
void Drv_Devices_loadLeadOffSettings(uint8_t parameter);

/**
 * @brief Determines if the board is Master or Slave and set a flag
 * @return HIGH if the board is Master, LOW if the board is Slave
 */
bool Drv_Devices_isMaster();

/**
 * @brief Return the state of the isMaster flag
 * @return HIGH if the board is Master, LOW if the board is Slave
 */
 bool Drv_Devices_getIsMaster();
 
 /**
  * @brief Return the state of the is_running flag
  * @return TRUE if the board is running, FALSE if the board is not acquiring data
  */
 bool Drv_Devices_getIsRunning();

 /**
  * @brief Send via UART the data acquired by the ADS
  */
  void Drv_Devices_sendChannelData();

  /**
   * @brief Start the system as Salve. Configure I/O pins
   */
  void Drv_Devices_startAsSlave();

 /**
  * @brief	Handle interrupt from SysTick timer
  * @note Define what to do when the SysTick interrupt is called
  */
  void SysTick_Handler(void);


  /**
   * @brief	Print menu
   * @note
   */

   void Drv_Devices_printMenu(void);

  /**
   * @brief
   * @note
   */
  void delayMs(uint8_t timer_num, uint32_t delayInMs);
  void delayUs(uint8_t timer_num, uint32_t delayInUs);

  /**
   * @}
   */

#endif /* DRV_DEVICES_H_ */
