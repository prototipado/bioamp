/*
 * Drv_ADS1299.c
 *
 *  Created on: 2/11/2015
 *      Author: alumno
 */

#include "Drv_ADS1299.h"
#include "Drv_GPIO.h"
#include "Drv_SSP.h"
#include "Drv_Devices.h"
#include "chip.h"

/**
 * @brief Indicates if the ADS1299 is running
 */
static bool isRunning = FALSE; //static to be private of this file

/**
 * @brief Array to hold current channel settings
 */
uint8_t channelSettings[16][6];

/**
 * @brief Default values for channel settings
 */
uint8_t defaultChannelSettings[6];

/**
 * @brief Array used to control on/off of impedance measure for P and N side of each channel
 */
uint8_t leadOffSettings[16][2];

/**
 * @brief
 */
uint8_t sampleCounter = 0;

/**
 * @brief
 */
bool firstDataPacket = FALSE;

/**
 * @brief Flag to indicate if the Slave Board is present
 */
bool slavePresent = FALSE;

/**
 * @brief Array of flags to keep track of SRB2 usage
 */
bool useSRB2[16];

/**
 * @brief  Flag used to keep track if we are using SRB1 in the Master Board
 */
bool boardUseSRB1 = FALSE;

/**
 * @brief Flag used to keep track if we are using SRB1 in the Slave Board
 */
bool slaveUseSRB1 = FALSE;

/**
 * @brief Flags array used to remember if we were included in Bias before channel power down
 */
bool useInBias[16];

/**
 * @brief Total number of channels
 */
uint8_t numChannels = 0;

/**
 * @brief Array used when reading channel data 
 */
uint32_t boardChannelData[8];

/**
 * @brief Array used to store the last data reading
 */
uint32_t lastBoardChannelData[8];

/**
 * @brief 
 */
uint32_t meanBoardChannelData[8];

/**
 * @brief Variable used to hold the status register
 */
uint32_t boardStat = 0;      
     
 /**
 * @brief Variable used to hold the status register of salve board
 */
uint32_t slaveStat = 0;

/**
 * @brief Array used when reading channel data from slave board
 */
 uint32_t slaveChannelData[8];
 
  /**
 * @brief Array used to store the last data from slave board
 */
 uint32_t lastSlaveChannelData[8];
 
  /**
 * @brief 
 */
 uint32_t meanSlaveChannelData[8];
 
 /**
 * @brief 
 */
uint8_t boardChannelDataRaw[24];

/**
 * @brief 
 */
uint8_t lastBoardDataRaw[24];

/**
 * @brief 
 */
uint8_t meanBoardDataRaw[24];

/**
 * @brief 
 */
uint8_t slaveChannelDataRaw[24];
 
 /**
 * @brief 
 */
uint8_t lastSlaveDataRaw[24];
 
 /**
 * @brief 
 */
uint8_t meanSlaveDataRaw[24];
 
 /**
 * @brief Array used to mirror register data
 */ 
uint8_t regData[24];


/**
 * @brief Configure pines connected to the ADS and the ADS itself
 */
void Drv_ADS1299_initialize()
{
	//configure Board ADS chip select pin as output
	Drv_GPIO_setPinDir(BOARD_ADS_PORT, BOARD_ADS_PIN, TRUE);
	Drv_GPIO_setPinState(BOARD_ADS_PORT, BOARD_ADS_PIN, TRUE); //set HIGH

	//configure Slave ADS chip select pin as output
	Drv_GPIO_setPinDir(SLAVE_ADS_PORT, SLAVE_ADS_PIN, TRUE);
	Drv_GPIO_setPinState(SLAVE_ADS_PORT, SLAVE_ADS_PIN, TRUE); //set HIGH

	//configure ADS Reset pin as output

	Drv_GPIO_setPinDir(ADS_RST_PORT, ADS_RST_PIN, TRUE);
	Drv_GPIO_setPinState(ADS_RST_PORT, ADS_RST_PIN, TRUE); //set LOW: reset the ADS

	//configure ADS Start pin as output
	Drv_GPIO_setPinDir(ADS_START_PORT, ADS_START_PIN, TRUE);
	Drv_GPIO_setPinState(ADS_START_PORT, ADS_START_PIN, FALSE); //set LOW: don't start the ADS


	//configure ADS Data Ready pin as input
    Drv_GPIO_setPinDir(ADS_DRDY_PORT, ADS_DRDY_PIN, FALSE);

	Drv_SSP_init();
	Drv_SSP_setup();

	Drv_ADS1299_initialize_ads(); // hard reset ADS, set pin directions


}

/**
 * @brief Hard Reset ADS and power up sequence
 */
void Drv_ADS1299_initialize_ads()
{
	
	delayMs(0, 50);
	Drv_GPIO_setPinState(ADS_RST_PORT, ADS_RST_PIN, FALSE); //set LOW: reset pin connected to both ADSs
	delayUs(0, 4); //toggle reset pin
	Drv_GPIO_setPinState(ADS_RST_PORT, ADS_RST_PIN, TRUE); //set HIGH
	delayUs(0, 20); //recommended to wait 18 Tclk before using device (aprox. 8uS)
	
	//initilize the data ready chip select and reset pins
	
	Drv_ADS1299_resetADS(BOARD_ADS); //reset the on-board ADS registers and stop DataContinousMode
	delayMs(0,20);
	
	Drv_ADS1299_WREG(CONFIG1, 0xB0 | SAMPLE_RATE_2kHZ, BOARD_ADS); //tell on-board ADS to output its clk, set the data rate to 2kHzSPS
	Drv_ADS1299_WREG(LOFF, 0x02 , BOARD_ADS);

	delayMs(0, 40);
	Drv_ADS1299_resetADS(SLAVE_ADS); //software reset slave module if present
	delayMs(0, 10);
	
	slavePresent = Drv_ADS1299_smellSlave(); //check to see if daisy module is present
	
	if(!slavePresent)
	{
		Drv_ADS1299_WREG(CONFIG1, 0x90 | SAMPLE_RATE_2kHZ, BOARD_ADS); //Turn off clk output if no slave present
		numChannels = 8; //expect up to 8 ADS channels
	}
	else
	{
		//Drv_ADS1299_WREG(CONFIG1, 0xB0 | SAMPLE_RATE_250HZ, BOARD_ADS); //tell on-board ADS to output its clk, set the data rate to 250SPS
		Drv_ADS1299_WREG(CONFIG1, 0x90 | SAMPLE_RATE_1kHZ, SLAVE_ADS);//Slow down sample rate for 16 channels
		numChannels = 16; //expect up to 16 ADS channels
	}

    // DEFAULT CHANNEL SETTINGS FOR ADS
    defaultChannelSettings[POWER_DOWN] = NO;        // on = NO, off = YES
    defaultChannelSettings[GAIN_SET] = ADS_GAIN24;     // Gain setting
    defaultChannelSettings[INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    defaultChannelSettings[BIAS_SET] = YES;    // add this channel to bias generation
    defaultChannelSettings[SRB2_SET] = YES;       // connect this P side to SRB2
    defaultChannelSettings[SRB1_SET] = NO;        // don't use SRB1

    uint8_t i,j = 0; //loops counters
    for(i=0; i<numChannels; i++)
    {
    	for(j=0; j<6; j++)
    	{
    		channelSettings[i][j] = defaultChannelSettings[j];  // assign default settings
        }

    	useInBias[i] = TRUE;    // keeping track of Bias Generation
    	useSRB2[i] = TRUE;      // keeping track of SRB2 inclusion
    }
    // USE IF YOU WANT SPECIFIC CHANNEL SETTINGS
    // CHANNEL 1
/*    channelSettings[0][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[0][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[0][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[0][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[0][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[0][SRB1_SET] = NO;        // don't use SRB1

    // CHANGE DEFAULT CHANNEL SETTINGS FOR LIRINS USE
    // CHANNEL 1
    channelSettings[1][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[1][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[1][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[1][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[1][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[1][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 2
    channelSettings[2][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[2][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[2][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[2][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[2][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[2][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 3
    channelSettings[3][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[3][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[3][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[3][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[3][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[3][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 4
    channelSettings[4][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[4][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[4][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[4][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[4][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[4][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 5
    channelSettings[5][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[5][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[5][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[5][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[5][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[5][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 6
    channelSettings[6][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[6][GAIN_SET] = ADS_GAIN24;     // Gain setting
    channelSettings[6][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[6][BIAS_SET] = YES;    // add this channel to bias generation
    channelSettings[6][SRB2_SET] = YES;       // connect this P side to SRB2
    channelSettings[6][SRB1_SET] = NO;        // don't use SRB1

    // CHANNEL 7
    channelSettings[7][POWER_DOWN] = NO;        // on = NO, off = YES
    channelSettings[7][GAIN_SET] = ADS_GAIN08;     // Gain setting
    channelSettings[7][INPUT_TYPE_SET] = ADSINPUT_NORMAL;// input muxer setting
    channelSettings[7][BIAS_SET] = NO;    // add this channel to bias generation
    channelSettings[7][SRB2_SET] = NO;       // connect this P side to SRB2
    channelSettings[7][SRB1_SET] = NO;        // don't use SRB1
*/
    //******************************************************************************//

    boardUseSRB1 = slaveUseSRB1 = FALSE;

    Drv_ADS1299_writeAllChannelSettings(); // write settings to the on-board and on-daisy ADS if present

     Drv_ADS1299_WREG(CONFIG3,0b11101100,BOTH_ADS); // enable internal reference drive and etc.
    delayMs(0, 1);

    //TODO: leadOffSettings
    for(i=0; i<numChannels; i++)
    {  // turn off the impedance measure signal
    	leadOffSettings[i][PCHAN] = OFF;
    	leadOffSettings[i][NCHAN] = OFF;
    }
    //TODO: verbosity = false;      // when verbosity is true, there will be Serial feedback
    firstDataPacket = TRUE;
}

/**
 * @brief Stop data acquisition
 */
void Drv_ADS1299_stopStreaming()
{
	 Drv_ADS1299_stopADS();
}

/**
 * @brief Start data acquisition
 */
void Drv_ADS1299_startStreaming()
{
	Drv_ADS1299_startADS();
}

/**
 * @brief Start continuous data acquisition
 */
void Drv_ADS1299_startADS()
{
	sampleCounter = 0;
	firstDataPacket = TRUE;
	Drv_ADS1299_RDATAC(BOTH_ADS); // enter Read Data Continuous mode
	delayMs(0,1);
	Drv_ADS1299_START(BOTH_ADS);  // start the data acquisition
	delayMs(0,1);
	isRunning = TRUE;
}

/**
 * @brief Stop continuous data acquisition
 */
void Drv_ADS1299_stopADS()
{
	Drv_ADS1299_STOP(BOTH_ADS);     // stop the data acquisition
	delayMs(0,1);
	Drv_ADS1299_SDATAC(BOTH_ADS);   // stop Read Data Continuous mode to communicate with ADS
	delayMs(0,1);
	isRunning = FALSE;
}

/**
 * @brief SPI chip select method
 * @param SS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_csLow(uint8_t SS)
{
// select an SPI slave to talk to
  switch(SS){
    case BOARD_ADS:
    	//TODO:init SPI
    	Drv_GPIO_setPinState(BOARD_ADS_PORT, BOARD_ADS_PIN, FALSE); //assert LOW the chip select pin of Master ADS
        break;
    case SLAVE_ADS:
    	//TODO: init SPI
    	Drv_GPIO_setPinState(SLAVE_ADS_PORT, SLAVE_ADS_PIN, FALSE); //assert LOW the chip select pin of Slave ADS
        break;
    case BOTH_ADS:
    	//TODO: init SPI
    	Drv_GPIO_setPinState(BOARD_ADS_PORT, BOARD_ADS_PIN, FALSE); //assert LOW the chip select pin of Master ADS
    	Drv_GPIO_setPinState(SLAVE_ADS_PORT, SLAVE_ADS_PIN, FALSE); //assert LOW the chip select pin of Slave ADS
    	break;
    default: break;
  }
}

/**
 * @brief SPI chip de-select
 * @param SS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_csHigh(uint8_t SS)
{ // deselect SPI slave
  switch(SS){
	case BOARD_ADS:
		Drv_GPIO_setPinState(BOARD_ADS_PORT, BOARD_ADS_PIN, TRUE); //assert HIGH the chip select pin of Master ADS
		//TODO: reconfigure SPI
		break;
	case SLAVE_ADS:
		Drv_GPIO_setPinState(SLAVE_ADS_PORT, SLAVE_ADS_PIN, TRUE); //assert HIGH the chip select pin of Slave ADS
		//TODO: reconfigure SPI
		break;
	case BOTH_ADS:
		Drv_GPIO_setPinState(BOARD_ADS_PORT, BOARD_ADS_PIN, TRUE); //assert HIGH the chip select pin of Master ADS
		Drv_GPIO_setPinState(SLAVE_ADS_PORT, SLAVE_ADS_PIN, TRUE); //assert HIGH the chip select pin of Slave ADS
		//TODO: reconfigure SPI
		break;
	default: break;
  }
}

/**
 * @brief SPI communication method
 * @param _data Byte to transfer
 * @return Byte received from SPI target 
 */
uint8_t Drv_ADS1299_xfer(uint8_t _data)
{
	 uint8_t inByte;
	 //transmit and receive byte by SPI
	 //

	 inByte = spi_rw(_data);
	//inByte = Drv_SSP_transferByte(_data);

	 return inByte;
}

/**
 * @brief Get out of low power mode
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_WAKEUP(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_WAKEUP);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
	
	delayUs(0, 3); //must wait 4 tCLK cycles before sending another command (see Datasheet, pag 35)
}

/**
 * @brief Go into low power mode
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_STANDBY(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_STANDBY);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
}

/**
 * @brief Set all register values to default
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_RESET(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_RESET);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
	delayUs(0, 12); //must wait 18 tCLK cycles to execute this command (see Datasheet, pag 35)
}

/**
 * @brief Start data acquisition
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_START(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_START);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
}

/**
 * @brief Stop data acquisition
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_STOP(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_STOP); 

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
}

/**
 * @brief Go into read data continuous mode
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_RDATAC(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_RDATAC);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
	
	delayUs(0, 3);
}

/**
 * @brief Get out of read data continuous mode
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_SDATAC(uint8_t targetSS)
{
	Drv_ADS1299_csLow(targetSS);
	Drv_ADS1299_xfer(_SDATAC);

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS);
	
	delayUs(0, 10); //must wait 4 tCLK cycles before sending another command (see Datasheet, pag 35)
}

/**
 * @brief Read data one-shot
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_RDATA(uint8_t targetSS)
{
	uint8_t inByte;
	Drv_ADS1299_csLow(targetSS); //open SPI
	Drv_ADS1299_xfer(_RDATA); //send the RDATA command
	
	uint8_t i,j = 0; //loop counters
	
	for(i=0; i<3; i++) // read in the new channel data
	{
		inByte = Drv_ADS1299_xfer(0x00);
		boardStat = (boardStat<<8) | inByte; //read status register (1100 + LOFF_STATP + LOFF_STATN + GPIO[7:4])			
	}
	
	if(targetSS == BOARD_ADS)
	{
		for(i=0; i<8; i++)
		{
			for(j=0; j<3; j++)
			{
				inByte = Drv_ADS1299_xfer(0x00);
				boardChannelData[i] = (boardChannelData[i]<<8) | inByte;
			}
		}
		
		for(i=0; i<8; i++)
		{
			if(bitRead(boardChannelData[i],23) == 1)  // convert 3 byte 2's compliment to 4 byte 2's compliment
			{
				boardChannelData[i] |= 0xFF000000;
			}
			else
			{
				boardChannelData[i] |= 0x00FFFFFF;
			}
		}
	}
	else
	{
		for(i=0; i<8; i++)
		{
			for(j=0; j<3; j++)
			{
				inByte = Drv_ADS1299_xfer(0x00);
				slaveChannelData[i] = (slaveChannelData[i]<<8) | inByte;
			}
		}
		
		for(i=0; i<8; i++)
		{
			if(bitRead(slaveChannelData[i],23) == 1)  // convert 3 byte 2's compliment to 4 byte 2's compliment
			{
				slaveChannelData[i] |= 0xFF000000;
			}
			else
			{
				slaveChannelData[i] |= 0x00FFFFFF;
			}
		}
	}
	
	Drv_ADS1299_csHigh(targetSS); //close SPI
}

/**
 * @brief Read one ADS register
 * @param _address Register address to read
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 * @return Requested register value
 */
uint8_t Drv_ADS1299_RREG(uint8_t _address, uint8_t targetSS) //  reads ONE register at _address
{
	uint8_t opcode1 = _address + 0x20; //  RREG expects 001rrrrr where rrrrr = _address
	
	Drv_ADS1299_csLow(targetSS); //open SPI
	Drv_ADS1299_xfer(opcode1); //send opcode1
	Drv_ADS1299_xfer(0x00); //send opcode2: 0x00 to read only the register located at _address
	
	regData[_address] = Drv_ADS1299_xfer(0x00); //  update mirror location with returned byte
	
	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS); //close SPI
	
	return regData[_address]; //return requested register value
}

/**
 * @brief  Read multiple ADS registers
 * @param _address Register address to read
 * @param _numRegistersMinusOne Number of registers to read minus one
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_RREGS(uint8_t _address, uint8_t _numRegistersMinusOne, uint8_t targetSS)
{
	uint8_t opcode1 = _address + 0x20; //  RREG expects 001rrrrr where rrrrr = _address
	
	Drv_ADS1299_csLow(targetSS); //open SPI
	Drv_ADS1299_xfer(opcode1); //send opcode1
	Drv_ADS1299_xfer(_numRegistersMinusOne); //send opcode2: number of register to read minus one
	
	uint8_t i = 0; //loop counter
	for(i=0;i<=_numRegistersMinusOne;i++)
	{
		regData[_address + i] = Drv_ADS1299_xfer(0x00); //  update mirror location with returned byte
	}
	
	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS); //close SPI
}

/**
 * @brief Write one ADS register
 * @param _address Register address to write
 * @param _value Byte to write in register
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_WREG(uint8_t _address,uint8_t _value, uint8_t targetSS)
{
	uint8_t opcode1 = _address + 0x40; //  WREG expects 010rrrrr where rrrrr = _address
	
	Drv_ADS1299_csLow(targetSS); //open SPI
	Drv_ADS1299_xfer(opcode1); //send opcode1
	Drv_ADS1299_xfer(0x00); //send opcode2: 0x00 to write only the register located at _address
	Drv_ADS1299_xfer(_value); //write the value to the register

	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS); //close SPI
	
	regData[_address] = _value; //  update mirror location with returned byte
}

/**
 * @brief Write multiple ADS registers
 * @param _address Register address to write
 * @param _numRegistersMinusOne Number of registers to write minus one
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_WREGS(uint8_t _address, uint8_t _numRegistersMinusOne, uint8_t targetSS)
{
	uint8_t opcode1 = _address + 0x40; //  WREG expects 010rrrrr where rrrrr = _address
	
	Drv_ADS1299_csLow(targetSS); //open SPI
	Drv_ADS1299_xfer(opcode1); //send opcode1
	Drv_ADS1299_xfer(_numRegistersMinusOne); //send opcode2: number of register to write minus one
	
	uint8_t i = 0; //loop counter
	for(i=_address; i<=(_address + _numRegistersMinusOne); i++)
	{
		Drv_ADS1299_xfer(regData[i]); //write to the registers
	}
	
	delayUs(0, 10); // After the serial communication is finished, always wait four or more tCLK cycles before taking CS high
	Drv_ADS1299_csHigh(targetSS); //close SPI
}

/**
 * @brief Write settings of only one specific channel
 * @param N Number of the channel to set (1-16)
 */
void Drv_ADS1299_writeOneChannelSettings(uint8_t N)
{
	uint8_t setting, startChan, endChan, targetSS;

	if(N < 9)
	{   // channels 1-8 on board
		targetSS = BOARD_ADS; startChan = 0; endChan = 8;
	}
	else
	{      // channels 9-16 on daisy module
		if(!slavePresent) { return; }
		targetSS = SLAVE_ADS; startChan = 8; endChan = 16;
	}

	// function accepts channel 1-16, must be 0 indexed to work with array
	N = Drv_ADS1299_constrain(N-1,startChan,endChan-1);  //subtracts 1 so that we're counting from 0, not 1

	// first, disable any data collection
	Drv_ADS1299_SDATAC(targetSS); // exit Read Data Continuous mode to communicate with ADS
	delayMs(0, 1);

	setting = 0x00;

	if(channelSettings[N][POWER_DOWN] == YES)
	{
		setting |= 0x80;
	}

	setting |= channelSettings[N][GAIN_SET]; // gain
	setting |= channelSettings[N][INPUT_TYPE_SET]; // input code

	if(channelSettings[N][SRB2_SET] == YES)
	{
		setting |= 0x08; // close this SRB2 switch
		useSRB2[N] = TRUE;  // keep track of SRB2 usage
	}
	else
	{
		useSRB2[N] = FALSE;
	}

	Drv_ADS1299_WREG(CH1SET+(N-startChan), setting, targetSS);  // write this channel's register settings

	// add or remove from inclusion in BIAS generation
	setting = Drv_ADS1299_RREG(BIAS_SENSP,targetSS);       //get the current P bias settings

	if(channelSettings[N][BIAS_SET] == YES)
	{
		useInBias[N] = TRUE;
		bitSet(setting,N-startChan);    //set this channel's bit to add it to the bias generation
	}
	else
	{
		useInBias[N] = FALSE;
		bitClear(setting,N-startChan);  // clear this channel's bit to remove from bias generation
	}

	Drv_ADS1299_WREG(BIAS_SENSP,setting,targetSS); //send the modified byte back to the ADS
	delayMs(0,1);

	setting = Drv_ADS1299_RREG(BIAS_SENSN,targetSS);       //get the current N bias settings

	if(channelSettings[N][BIAS_SET] == YES)
	{
		bitSet(setting,N-startChan);    //set this channel's bit to add it to the bias generation
	}
	else
	{
		bitClear(setting,N-startChan);  // clear this channel's bit to remove from bias generation
	}

	Drv_ADS1299_WREG(BIAS_SENSN,setting,targetSS); //send the modified byte back to the ADS
	delayMs(0, 1);

	// if SRB1 is closed or open for one channel, it will be the same for all channels

	uint8_t i = 0;//variable of for loops
	if(channelSettings[N][SRB1_SET] == YES)
	{
		for(i=startChan; i<endChan; i++)
		{
			channelSettings[i][SRB1_SET] = YES;
		}

		if(targetSS == BOARD_ADS) boardUseSRB1 = true;
		if(targetSS == SLAVE_ADS) slaveUseSRB1 = true;

		setting = 0x20;     // close SRB1 swtich
	}
	else//(channelSettings[N][SRB1_SET] == NO)
	{
		for(i=startChan; i<endChan; i++)
		{
			channelSettings[i][SRB1_SET] = NO;
		}

		if(targetSS == BOARD_ADS) boardUseSRB1 = false;
		if(targetSS == SLAVE_ADS) slaveUseSRB1 = false;

		setting = 0x00;     // open SRB1 switch
	}

	Drv_ADS1299_WREG(MISC1,setting,targetSS); //write register
}

/**
 * @brief Write settings of all channels
 */
void Drv_ADS1299_writeAllChannelSettings()
{
	uint8_t channel = 0;

	for(channel=1;channel<17;channel++)
	{
		Drv_ADS1299_writeOneChannelSettings(channel); //reuse this function to set each channel settings
	}
}

/**
 * @brief Set all channels with the default values
 */
void Drv_ADS1299_setChannelsToDefault()
{
	uint8_t i,j = 0; //loops variable

	for(i=0; i<numChannels; i++)
	{
		for(j=0; j<6; j++)
		{
			channelSettings[i][j] = defaultChannelSettings[j];
	    }

		useInBias[i] = TRUE;    // keeping track of Bias Generation

		useSRB2[i] = TRUE;      // keeping track of SRB2 inclusion
	}

	boardUseSRB1 = slaveUseSRB1 = FALSE;

	Drv_ADS1299_writeAllChannelSettings();       // write settings to on-board ADS

	//TODO: Impedance settings
	//for(i=0; i<numChannels; i++)
	//{   // turn off the impedance measure signal
	//    leadOffSettings[i][PCHAN] = OFF;
	//    leadOffSettings[i][NCHAN] = OFF;
	//}
	//  changeChannelLeadOffDetect(); // write settings to all ADS


	Drv_ADS1299_WREG(MISC1,0x00,BOARD_ADS);  // open SRB1 switch on-board
	if(slavePresent){ Drv_ADS1299_WREG(MISC1,0x00,SLAVE_ADS); } // open SRB1 switch on-daisy
}

/**
 * @brief Activate specific channel N
 * @param N Number of the channel to activate (1-16)
 */
void Drv_ADS1299_activateChannel(uint8_t N)
{
	uint8_t setting, startChan, endChan, targetSS;

	if(N < 9)
	{
		targetSS = BOARD_ADS; startChan = 0; endChan = 8;
	}
	else
	{
		if(!slavePresent) { return; }
		targetSS = SLAVE_ADS; startChan = 8; endChan = 16;
	}

	N = Drv_ADS1299_constrain(N-1,startChan,endChan-1);  // 0-7 or 8-15

	Drv_ADS1299_SDATAC(targetSS);  // exit Read Data Continuous mode to communicate with ADS

	setting = 0x00;
	//TODO:  channelSettings[N][POWER_DOWN] = NO; // keep track of channel on/off in this array  REMOVE?
	setting |= channelSettings[N][GAIN_SET]; // gain
	setting |= channelSettings[N][INPUT_TYPE_SET]; // input code

	if(useSRB2[N] == TRUE)
	{
		channelSettings[N][SRB2_SET] = YES;
		bitSet(setting,3);
	}
	else
	{
		channelSettings[N][SRB2_SET] = NO;
	}

	Drv_ADS1299_WREG(CH1SET+(N-startChan),setting,targetSS);

	// add or remove from inclusion in BIAS generation
	if(useInBias[N])
	{
		channelSettings[N][BIAS_SET] = YES;
	}
	else
	{
		channelSettings[N][BIAS_SET] = NO;
	}

	setting = Drv_ADS1299_RREG(BIAS_SENSP,targetSS);//get the current P bias settings

	if(channelSettings[N][BIAS_SET] == YES)
	{
		bitSet(setting,N-startChan);    //set this channel's bit to add it to the bias generation
		useInBias[N] = TRUE;
	}
	else
	{
		bitClear(setting,N-startChan);  // clear this channel's bit to remove from bias generation
		useInBias[N] = FALSE;
	}

	Drv_ADS1299_WREG(BIAS_SENSP,setting,targetSS); //send the modified byte back to the ADS
	delayMs(0, 1);

	setting = Drv_ADS1299_RREG(BIAS_SENSN,targetSS);       //get the current N bias settings

	if(channelSettings[N][BIAS_SET] == YES)
	{
		bitSet(setting,N-startChan);    //set this channel's bit to add it to the bias generation
	}
	else
	{
		bitClear(setting,N-startChan);  // clear this channel's bit to remove from bias generation
	}

	delayMs(0, 1);
    Drv_ADS1299_WREG(BIAS_SENSN,setting,targetSS); //send the modified byte back to the ADS
    delayMs(0, 1);

	setting = 0x00;
	if(targetSS == BOARD_ADS && boardUseSRB1 == TRUE) setting = 0x20;
	if(targetSS == SLAVE_ADS && slaveUseSRB1 == TRUE) setting = 0x20;
	Drv_ADS1299_WREG(MISC1,setting,targetSS);     // close all SRB1 switches
}

/**
 * @brief De-activate specific channel N
 * @param N Number of the channel to de-activate (1-16)
 */
void Drv_ADS1299_deactivateChannel(uint8_t N)
{
	uint8_t setting, startChan, endChan, targetSS;

	if(N < 9)
	{
		targetSS = BOARD_ADS; startChan = 0; endChan = 8;
	}
	else
	{
		if(!slavePresent) { return; }
		targetSS = SLAVE_ADS; startChan = 8; endChan = 16;
	}

	Drv_ADS1299_SDATAC(targetSS); // exit Read Data Continuous mode to communicate with ADS
	delayMs(0, 1);

	N = Drv_ADS1299_constrain(N-1,startChan,endChan-1);  //subtracts 1 so that we're counting from 0, not 1

	setting = Drv_ADS1299_RREG(CH1SET+(N-startChan),targetSS); // get the current channel settings
	delayMs(0, 1);

	bitSet(setting,7);     // set bit7 to shut down channel
	bitClear(setting,3);   // clear bit3 to disclude from SRB2 if used

    Drv_ADS1299_WREG(CH1SET+(N-startChan),setting,targetSS); // write the new value to disable the channel
    delayMs(0, 1);

	//remove the channel from the bias generation...
	setting = Drv_ADS1299_RREG(BIAS_SENSP,targetSS); //get the current bias settings
	delayMs(0, 1);
	bitClear(setting,N-startChan);                  //clear this channel's bit to remove from bias generation

	Drv_ADS1299_WREG(BIAS_SENSP,setting,targetSS); //send the modified byte back to the ADS
	delayMs(0, 1);

	setting = Drv_ADS1299_RREG(BIAS_SENSN,targetSS); //get the current bias settings
	delayMs(0, 1);
	bitClear(setting,N-startChan);                  //clear this channel's bit to remove from bias generation

	Drv_ADS1299_WREG(BIAS_SENSN,setting,targetSS); //send the modified byte back to the ADS
	delayMs(0, 1);

	//TODO: Impedance settings
	//leadOffSettings[N][0] = leadOffSettings[N][1] = NO;
	//changeChannelLeadOffDetect(N+1);
}


/**
 * @brief Constrains a number to be within a range.
 * @param num Number to constrain
 * @param min Lower limit
 * @param max Upper limit
 * @return New number between the limits
 */
uint8_t Drv_ADS1299_constrain(uint8_t num, uint8_t min, uint8_t max)
{
	uint8_t out = num;

	if(num<min)
	{
		out = min;
	}
	else if(num>max)
	{
		out = max;
	}

	return out;
}

/**
 * @brief Query to see if data is available from the ADS1299
 * @return TRUE is data is available, FALSE otherwise
 */
bool Drv_ADS1299_isDataAvailable()
{
	return (!(Drv_GPIO_getPinState(ADS_DRDY_PORT, ADS_DRDY_PIN)));
}

/**
 * @brief Return the ID of the AFE device
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 * @return ID of the AFE device
 */
uint8_t Drv_ADS1299_getDeviceID(uint8_t targetSS)
{
	uint8_t data = Drv_ADS1299_RREG(ID_REG, targetSS);
	return data;
}

/**
 * @brief Function called to receive new data from the ADS1299
 */
void Drv_ADS1299_updateChannelData()
{
	Drv_ADS1299_updateBoardData();
	
	if(slavePresent)
	{
		Drv_ADS1299_updateSlaveData();
	}
}

/**
 * @brief Function called to receive new data from the master board
 */
 void Drv_ADS1299_updateBoardData()
 {
	 uint8_t inByte;
	 uint8_t byteCounter = 0;
	 
	 /* Tx buffer */
	  static uint8_t Tx_Buf[24];
	  /* Rx buffer */
	  static uint8_t Rx_Buf[24];

	 int8_t i,j = 0; //loop counters
	 
	 if(slavePresent && !firstDataPacket)
	 {
		 for(i=0; i<8; i++) // shift and average the byte arrays
		 {
			 lastBoardChannelData[i] = boardChannelData[i]; // remember the last samples
		 }
	 }
	 
	Drv_ADS1299_csLow(BOARD_ADS); //open SPI
	
	for(i=0; i<3; i++)
	{
		inByte = Drv_ADS1299_xfer(0x00); //  read status register (1100 + LOFF_STATP + LOFF_STATN + GPIO[7:4])
		boardStat = (boardStat << 8) | inByte;
	}
	
//	Drv_SSP_transferMultiplBytes(Tx_Buf,Rx_Buf,24);


	for(i=0; i<8; i++) //  read 24 bits of channel data in 8 3 byte chunks
	{
		for(j=0; j<3; j++)
		{
			inByte = Drv_ADS1299_xfer(0x00);
			boardChannelDataRaw[byteCounter] = inByte; //store raw data
			byteCounter++;
			boardChannelData[i] = (boardChannelData[i]<<8) | inByte; //store 32 bits data
		}
	}
	
	Drv_ADS1299_csHigh(BOARD_ADS); //close SPI
	
	//need to convert 24bits to 32bits if using the filter
	for(i=0; i<8; i++)// convert 3 byte 2's compliment to 4 byte 2's compliment 
	{
		if(bitRead(boardChannelData[i],23) == 1)
		{
			boardChannelData[i] |= 0xFF000000;
		}
		else
		{
			boardChannelData[i] |= 0x00FFFFFF;	
		}
	}
	
	if(slavePresent && !firstDataPacket)
	{
		byteCounter = 0;
		
		for(i=0; i<8; i++) // take the average of this and the last sample
		{
			meanBoardChannelData[i] = (lastBoardChannelData[i] + boardChannelData[i])/2;
		}
		
		for(i=0; i<8; i++) // place the average values in the meanRaw array
		{
			for(j=2; j>=0; j--)
			{
				meanBoardDataRaw[byteCounter] = (meanBoardChannelData[i] >> (j*8)) & 0xFF;
				byteCounter++;
			}
		}
	}
	
	if(firstDataPacket == TRUE)
	{
		firstDataPacket = FALSE;
	}

 }

/**
 * @brief Function called to receive new data from the slave board
 */
void Drv_ADS1299_updateSlaveData()
{
	uint8_t inByte;
    uint8_t byteCounter = 0;
	
	int8_t i,j = 0; //loop counters
    
    if(slavePresent && !firstDataPacket)
	{
      for(i=0; i<8; i++)
	  {  // shift and average the byte arrays
        lastSlaveChannelData[i] = slaveChannelData[i]; // remember the last samples
      }
    }

    Drv_ADS1299_csLow(SLAVE_ADS);       //  open SPI
    
	for(i=0; i<3; i++)
	{ 
      inByte = Drv_ADS1299_xfer(0x00);    //  read status register (1100 + LOFF_STATP + LOFF_STATN + GPIO[7:4])
      slaveStat = (slaveStat << 8) | inByte;
    }
	
    for(i = 0; i<8; i++)
	{
      for(j=0; j<3; j++)
	  {   //  read 24 bits of channel data in 8 3 byte chunks
        inByte = Drv_ADS1299_xfer(0x00);
        slaveChannelDataRaw[byteCounter] = inByte;  // raw data goes here
        byteCounter++;
        slaveChannelData[i] = (slaveChannelData[i]<<8) | inByte; // int data goes here
      }
    }
	
    Drv_ADS1299_csHigh(SLAVE_ADS);        //  close SPI
	
  // need to convert 24bit to 32bit
  for(i=0; i<8; i++) // convert 3 byte 2's compliment to 4 byte 2's compliment 
  {     
    if(bitRead(slaveChannelData[i],23) == 1)
	{ 
      slaveChannelData[i] |= 0xFF000000;
    }
	else
	{
      slaveChannelData[i] &= 0x00FFFFFF;
    }
  }
  
  if(slavePresent && !firstDataPacket)
  {
    byteCounter = 0;
    
	for(i=0; i<8; i++) // average this sample with the last sample
	{   
      meanSlaveChannelData[i] = (lastSlaveChannelData[i] + slaveChannelData[i])/2;
    }
	
    for(i=0; i<8; i++) // place the average values in the meanRaw array
	{  
      for(j=2; j>=0; j--)
	  {
        meanSlaveDataRaw[byteCounter] = (meanSlaveChannelData[i] >> (j*8)) & 0xFF;
        byteCounter++;
      }
    }   
  }  
    
  if(firstDataPacket == TRUE)
  {
	  firstDataPacket = FALSE;
  }
  
} 

/**
 * @brief Configure the test signals that can be inernally generated by the ADS1299
 * @param amplitudCode Amplitude of the test signal: ADSTESTSIG_NOCHANGE, ADSTESTSIG_AMP_1X, ADSTESTSIG_AMP_2X 
 * @param freqCode Frequence of the test signal: ADSTESTSIG_NOCHANGE, ADSTESTSIG_PULSE_SLOW, ADSTESTSIG_PULSE_FAST
 */
void Drv_ADS1299_configureInternalTestSignal(uint8_t amplitudeCode, uint8_t freqCode)
{
	uint8_t setting, targetSS;
	uint8_t i = 0; //loop counter
	
	for(i=0; i<2; i++)
	{
		if(i==0)
		{
			targetSS = BOARD_ADS;
		}
		else if(i==1)
		{
			if(slavePresent == FALSE)
			{
				return;
			}
			targetSS = SLAVE_ADS;
		}
		
		if(amplitudeCode == ADSTESTSIG_NOCHANGE) 
		{
			amplitudeCode = (Drv_ADS1299_RREG(CONFIG2,targetSS) & (0b00000100));
		}
		
		if(freqCode == ADSTESTSIG_NOCHANGE)
		{
			freqCode = (Drv_ADS1299_RREG(CONFIG2,targetSS) & (0b00000011));
		}
		
		freqCode &= 0b00000011;  		//only the last two bits are used
		amplitudeCode &= 0b00000100;  	//only this bit is used
		setting = 0b11010000 | freqCode | amplitudeCode;  //compose the code 
		
		Drv_ADS1299_WREG(CONFIG2, setting, targetSS);
		delayMs(0, 1);
	}
}

/**
 * @brief Change the source of signal connected to the inputs of the ADS1299
 * @param inputCode Input types
 */
void Drv_ADS1299_changeInputType(uint8_t inputCode)
{
	uint8_t i = 0; //loop counter
	for(i=0; i<numChannels; i++)
	{
		channelSettings[i][INPUT_TYPE_SET] = inputCode;
	}
	
	Drv_ADS1299_writeAllChannelSettings();
}

/**
 * @brief Return an array with ADS1299 registers data
 * @param *regArray Pointer to an array with 24 elements to store ADS registers values
 */
void Drv_ADS1299_getRegistersData(uint8_t *regArray)
{
	uint8_t i = 0; //loop counter

	for(i=0; i<24; i++) //there are 24 registers
	{
		regArray[i] = regData[i];
	}
}

/**
 * @brief To know if the Slave Board is present
 * @return HIGH if Slave Board is present, LOW if not
 */
bool Drv_ADS1299_getSlavePresent()
{
	return slavePresent;
}

/**
 * @brief Return an array with the 6 values of default channel settings
 * @param *defChanSettings Pointer to an array with 6 elements to store Default Channel Settings
 */
void Drv_ADS1299_getDefaultChannelSettings(uint8_t *defChanSettings)
{
	uint8_t i = 0; //loop counter

	for(i=0; i<6; i++)
	{
		defChanSettings[i] = defaultChannelSettings[i]; //there are 6 values
	}
}

/**
 * @brief Change the lead off detect settings for specified channel
 * @param N Number of the channel to de-activate (1-16)
 */
void Drv_ADS1299_changeOneChannelLeadOffDetect(uint8_t N)
{
	uint8_t startChan, endChan, targetSS;

	if(N < 9)
	{   // channels 1-8 on board
		targetSS = BOARD_ADS; startChan = 0; endChan = 8;
	}
	else
	{      // channels 9-16 on daisy module
		if(!slavePresent) { return; }
		targetSS = SLAVE_ADS; startChan = 8; endChan = 16;
	}

	// function accepts channel 1-16, must be 0 indexed to work with array
	N = Drv_ADS1299_constrain(N, startChan, endChan-1);  //subtracts 1 so that we're counting from 0, not 1
	
	// first, disable any data collection
	Drv_ADS1299_SDATAC(targetSS); // exit Read Data Continuous mode to communicate with ADS
	delayMs(0, 1);
	
	uint8_t P_setting = Drv_ADS1299_RREG(LOFF_SENSP, targetSS);
	uint8_t N_setting = Drv_ADS1299_RREG(LOFF_SENSN, targetSS);
	
	if(leadOffSettings[N][PCHAN] == ON)
	{
		bitSet(P_setting, N-startChan);
	}
	else
	{
		bitClear(P_setting, N-startChan);
	}
	
	if(leadOffSettings[N][NCHAN] == ON)
	{
		bitSet(N_setting, N-startChan);
	}
	else
	{
		bitClear(N_setting, N-startChan);
	}
	
	Drv_ADS1299_WREG(LOFF_SENSP, P_setting, targetSS);
	Drv_ADS1299_WREG(LOFF_SENSN, N_setting, targetSS);
}

/**
 * @brief Change the lead off detect settings for all channels
 */
void Drv_ADS1299_changeAllChannelLeadOffDetect()
{
	uint8_t channel = 0;

	for(channel=1;channel<17;channel++)
	{
		Drv_ADS1299_changeOneChannelLeadOffDetect(channel); //reuse this function to set each channel settings
	}
}

/**
 * @brief Check if Slave Board is present
 * @return HIGH if Slave board is present, LOW if not
 */
bool Drv_ADS1299_smellSlave()
{
	bool isSlave = FALSE;
	uint8_t setting = Drv_ADS1299_RREG(ID_REG, SLAVE_ADS); //try to read the product ID
	
	if(setting == ADS_ID) //ADS1299 product ID
	{
		isSlave = TRUE;
	}
	
	return isSlave;
}

/**
 * @brief Get master GPIO state
 * @return GPIO state
 */
uint8_t Drv_ADS1299_getGPIO()
{
	uint8_t gpio = 0;
	gpio = Drv_ADS1299_RREG(GPIO, BOARD_ADS);
	gpio = (gpio & 0b11110000)>>4;
	return gpio;
}



/**
 * @brief Stop Slave ADS and remove link
 */
void Drv_ADS1299_removeSlave()
{
	if(slavePresent)
	{
		Drv_ADS1299_SDATAC(SLAVE_ADS); //stop slave ADS
		Drv_ADS1299_RESET(SLAVE_ADS);
		Drv_ADS1299_STANDBY(SLAVE_ADS);
		
		slavePresent = FALSE;
	}
}

/**
 * @brief Configure CLK output and detect Slave board
 */
void Drv_ADS1299_attachSlave()
{
	Drv_ADS1299_WREG(CONFIG1, 0XB3, BOARD_ADS); //tell on-board ADS to output the clk, set the data rate to 2000SPS
	delayMs(0, 40);

	Drv_ADS1299_resetADS(SLAVE_ADS); // software reset slave module if present
	delayMs(0, 10);
	
	slavePresent = Drv_ADS1299_smellSlave();
	
	if(!slavePresent)
	{
		Drv_ADS1299_WREG(CONFIG1, 0x93, BOARD_ADS); //turn off clk output if no daisy present, set the data rate to 2000SPS
		numChannels = 8; //expect up to 8 ADS channels
	}
	else
	{
		numChannels = 16; //expect up to 16 ADS channels 
	}
} 

/**
 * @brief Reset all the ADS1299 settings. Stops all data acquisition
 * @param targetSS SPI target to talk to: BOARD_ADS, SLAVE_ADS or BOTH_ADS
 */
void Drv_ADS1299_resetADS(uint8_t targetSS)
{
	uint8_t startChan, stopChan;
	
	if(targetSS == BOARD_ADS)
	{
		startChan = 1; stopChan = 8;
	}
	else if(targetSS == SLAVE_ADS)
	{
		startChan = 9; stopChan = 16;
	}
	
	Drv_ADS1299_RESET(targetSS); //send RESET command to default all registers
	Drv_ADS1299_SDATAC(targetSS); //exit Read Data Continuous mode to communicate with ADS
	delayMs(0, 100);
	
	//turn off all channels
	uint8_t chan = 0; //loop counter
	for(chan=startChan; chan<=stopChan; chan++)
	{
		Drv_ADS1299_deactivateChannel(chan);
	}
}

/**
 * @brief Function to get Channel Data 
 * @param &sampleCnt Pointer to a uint8_t variable to store Sample Count
 * @param *data Pointer to an array with 48 elements (24 of Mastar board data and 24 of Slave board data)
 */
void Drv_ADS1299_getChannelData(uint8_t *sampleCnt, uint8_t *data)
{
	*sampleCnt = sampleCounter; //copy sample counter value
	uint8_t i = 0; //loop counter 
	
	 Drv_ADS1299_updateChannelData();

	for(i=0; i<48; i++)
	{
		if (i < 24)
		{
			data[i] = boardChannelDataRaw[i];
		//	data[i] = meanBoardDataRaw[i]; 	//store master board data
		}
		else if((i > 23) && slavePresent)
		{
		//	data[i] = slaveChannelDataRaw[i];
			data[i] = slaveChannelDataRaw[i - 24]; //store slave board data
		}
		else
		{
			data[i] = 0; //store '0' if slave is not present
		}
		
	}
	
	sampleCounter++; //increment sample counter 
} 

















