//----------------------------------------------------------------
//Revised History:
//      A1.10   Created by Arthur.Hsu
//      A1.20   revise ADAMRTU_ModServer_Create() return type       07-27-2004 Arthur
//      A1.21   Slave&Master Co-exist problem fix                   08-30-2004 Arthur
//      A1.22   1.Read Coils bug fix                                10-02-2005 Arthur
//              2.Add adv_mb_printf() function
//              3.Add ADAMModbusRTU_Read() function
//              4.Add ADAMModbusRTU_Write() function          
//      A1.23	Modify trigger level behavior 
//
//      B1.01   Modify for ADAM-4501								//4501
//      B1.02   Add ADAM_SetCOMTimeout() & ADAM_GetCOMTimeout()		//4501
//      B1.03   Modify ADAM_MAX_MSGLEN size = 600					//4501
//
//		A1.24	1.extend receive buffer size
//              2.Add ADAM_SetCOMTimeout() & ADAM_GetCOMTimeout()
//		A1.25   Modify ADAM_MAX_MSGLEN size = 600   
//		A1.26   Integrate ADAM-4501 RTU lib with ADAM-5510 RTU lib  05-28-2008 Tim.Lin
//		A1.27   Add ModbusRtuSysDiagnostic()						08-01-2008 Tim.Lin  
//		A1.28   Support Modbus Exception Responses					10-13-2009 Tim.Lin  
//----------------------------------------------------------------
#include "dos.h"

typedef int bool;
#define FALSE   0
#define TRUE    !FALSE

#define false   0
#define true    !false

//-----COM Port
#define COM1    1
#define COM2    2
#define COM3   	3		//Only ADAM-4500 Series use COM3; ADAM-5510 Series can not use it.
#define COM4    4
#define Master  7
#define Slave   8
//--------Error Code
#define InvalidResponse             91
#define Com_InitOrMode_Err          92
#define COMTimeOut                  93
#define MbExceptionResponse         94
#define COMPortAlreadyInstalled     1
#define COMPortAccessError          2

//-----Exception Responses Error Code
#define NonExceptionResponse    0
#define ILLEGAL_FUNC            1
#define ILLEGAL_DATA_ADDR       2
#define ILLEGAL_DATA_VALUE      3
#define SLAVE_DE_FAIL           4
#define ACKNOWLEDGE             5
#define SLAVE_DE_BUSY           6
#define NEG_ACKNOWLEDGE         7
#define MEM_PARITY_ERR          8

#define Err_InvalidModbusAddr       (-10)
/*------------------------------------------------------*/
/*  Line control register bits                          */
/*------------------------------------------------------*/
#define DATA5           0x00    /* 5 Data bits */
#define DATA6           0x01    /* 6 Data bits */
#define DATA7           0x02    /* 7 Data bits */
#define DATA8           0x03    /* 8 Data bits */

#define STOP1           0x00    /* 1 Stop bit */
#define STOP2           0x04    /* 2 Stop bits */

#define NO_PARITY       0x00    /* No parity */
#define ODD_PARITY      0x08    /* Odd parity */
#define EVEN_PARITY     0x18    /* Even parity */
#define ONE_PARITY      0x28    /* Parity bit = 1 */
#define ZERO_PARITY     0x38    /* Parity bit = 0 */


//////////////////////////////////////////////////////////////////////////
//      Modbus slave(server) and master(client) architecture            //
//                                                                      //
//      ---------------------           ---------------------           //
//      |                   |   Query   |                   |           //
//      |                   |<----------|                   |           //
//      |   Modbus Slave    |           |   Modbus Master   |           //
//      |                   |  Response |                   |           //
//      |                   |---------->|                   |           //
//      ---------------------           ---------------------           //
//                                                                      //
//////////////////////////////////////////////////////////////////////////

int Modbus_COM_Init(int Port, 
                    int iMode, 
                    unsigned long iBaud, 
                    int iParity, 
                    int iFormat, 
                    int iStopBits);
//////////////////////////////////////////////////////////////////////////
//  Create COM port and set up COM port for Modbus use                  //
//                                                                      //
//  Return Value:                                                       //
//      Modbus_COM_Init() returns 0 if it is successful.                //
//      On an error, a non-zero value of the following errors will      //
//      be return.                                                      //
//          value 1: COMPortAlreadyInstalled                            //
//          value 2: COMPortAccessError                                 //
//                                                                      //
//  Parameters:                                                         //
//      Port        COM port selection                                  //
//                  Items: COM1, COM2, COM3(4500), COM4                 //
//      iMode       Modbus server or Modbus client (Master for client,  //
//                  Slave for server)                                   //
//                  Items: Master, Slave                                //
//      iBaud       COM baudrate setting                                //
//      iParity     NO_PARITY, ODD_PARITY, EVEN_PARITY, ONE_PARITY,     //
//                  ZERO_PARITY                                         //
//      iFormat     COM format setting                                  //
//                  Items: DATA5, DATA6, DATA7, DATA8                   //
//      iStopBits   COM stop bits setting                               //
//                  Items: STOP1, STOP2                                 //
//////////////////////////////////////////////////////////////////////////

void Modbus_COM_Release(int Port);
//////////////////////////////////////////////////////////////////////////
//  Release COM port used by Modbus library                             //
//                                                                      //
//  Return Value:                                                       //
//      No return value                                                 //
//                                                                      //
//  Parameters:                                                         //
//      Port        COM port selection                                  //
//                  Items: COM1, COM2, COM3(4500), COM4                 //
//////////////////////////////////////////////////////////////////////////

int Error_Code(void);
//////////////////////////////////////////////////////////////////////////
//  Get the last error code                                             //
//                                                                      //
//  Return Value:                                                       //
//      Return the last error code                                      //
//      Items: InvalidResponse(91), Com_InitOrMode_Err(92),             //
//             COMTimeOut(93), MbExceptionResponse(94)                  //
//                                                                      //
//  Parameters:                                                         //
//      No parameters                                                   //
//////////////////////////////////////////////////////////////////////////

int Error_Code_MbExcepResp(void);
//////////////////////////////////////////////////////////////////////////
//  Get the last mosbus rxception responses error code                  //
//																		//
//  When getting MbExceptionResponse(94) from Error_Code(), 			//
//	we could get the modbus exception responses code by the function.   //
//                                                                      //
//  Return Value:                                                       //
//      Return the last error code                                      //
//      Items: Exception Responses Error Code				            //
//            				                                            //
//                                                                      //
//  Parameters:                                                         //
//      No parameters                                                   //
//////////////////////////////////////////////////////////////////////////


bool ADAMRTU_ForceMultiCoils(int iPort,
                            int Slave_Addr,
                            unsigned int CoilIndex,
                            unsigned int TotalPoint,
                            unsigned int TotalByte,
                            unsigned char szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (0F Hex) Force Multiple Coils                       //
//  Forces each coil (0X reference) in a sequence of coils to either ON //
//  or OFF                                                              //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ForceMultiCoils() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort       COM port selection                                  //
//                  Items: COM1, COM2, COM3(4500), COM4                 //
//      Slave_Addr  Address ID of slave device (valid slave device      //
//                  addresses id are in the range of 0-247 decimal)     //
//      CoilIndex   The start address of slave device coil address      //
//      TotalPoint  The total number of coils to be forced              //
//      TotalByte   The total bytes of the query data contents          //
//      szData      The buffer of query data contents                   //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_ForceSingleCoil(int iPort,
                             int i_iAddr,
                             unsigned int i_iCoilIndex,
                             int i_iData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (05 Hex) Force Single Coil                          //
//  Forces a single coil (0X reference) to either ON or OFF             //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ForceSingleCoil() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iCoilIndex    The start address of slave device coil address  //
//      i_iData         The status of coil to be forced                 //
//                      Item: 0(OFF), 1(ON)                             //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_PresetMultiRegs(int iPort,
                             int i_iAddr, 
                             unsigned int i_iStartReg,
                             unsigned int i_iTotalReg,
                             unsigned int i_iTotalByte,
                             unsigned char i_szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (10 Hex) Preset Multiple Regs                       //
//  Presets values into a sequence of holding registers (4X references) //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_PresetMultiRegs() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartReg     The start address of slave device registers     //
//                      address                                         //
//      i_iTotalReg     The total number of registers to be preset      //
//      i_iTotalByte    The total bytes of the query data contents      //
//      i_szData        The buffer of query data contents               //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_PresetSingleReg(int iPort,
                             int i_iAddr,
                             unsigned int i_iRegIndex,
                             int i_iData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (06 Hex) Preset Single Register                     //
//  Presets a value into a single holding registers (4X references)     //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_PresetSingleReg() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iRegIndex     The address of slave device registers address   //
//      i_iData         The 16-bit register value                       //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_ReadCoilStatus(int iPort,
                           int i_iAddr, 
                           unsigned int i_iStartIndex,
                           unsigned int i_iTotalPoint,
                           unsigned int *o_iTotalByte, 
                           unsigned char o_szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (01 Hex) Read Coil Status                           //
//  Reads the On/OFF status of discrete outputs (0X references, coils)  //
//  in the slave.                                                       //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ReadCoilStatus() returns TRUE if it is successful.      //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartIndex   The start address of slave device coil address  //
//      i_iTotalPoint   The total number of coils to be read            //
//      o_iTotalByte    The total bytes of the response data contents   //
//      o_szData        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_ReadHoldingRegs(int iPort,
                             int i_iAddr, 
                             unsigned int i_iStartIndex,
                             unsigned int i_iTotalPoint,
                             unsigned int *o_iTotalByte,
                             unsigned char o_szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (03 Hex) Read Holding Registers                     //
//  Reads the binary contents of holding registers (4X references) in   //
//  the slave.                                                          //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ReadHoldingRegs() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartIndex   The start address of slave device register      //
//                      address                                         //
//      i_iTotalPoint   The total number of registers to be read        //
//      o_iTotalByte    The total bytes of the response data contents   //
//      o_szData        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_ReadInputRegs(int iPort,
                           int i_iAddr, 
                           unsigned int i_iStartIndex,
                           unsigned int i_iTotalPoint,
                           unsigned int *o_iTotalByte,
                           unsigned char o_szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (04 Hex) Read Input Registers                       //
//  Reads the binary contents of holding registers (3X references) in   //
//  the slave.                                                          //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ReadInputRegs() returns TRUE if it is successful.       //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartIndex   The start address of slave device register      //
//                      address                                         //
//      i_iTotalPoint   The total number of registers to be read        //
//      o_iTotalByte    The total bytes of the response data contents   //
//      o_szData        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

bool ADAMRTU_ReadInputStatus(int iPort,
                             int i_iAddr, 
                             unsigned int i_iStartIndex,
                             unsigned int i_iTotalPoint,
                             unsigned int *o_iTotalByte,
                             unsigned char o_szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (02 Hex) Read Input Status                          //
//  Reads the ON/OFF status of discrete inputs (1X references) in the   //
//  slave.                                                              //
//                                                                      //
//  Return Value:                                                       //
//      ADAMRTU_ReadInputStatus() returns TRUE if it is successful.     //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      i_iAddr         Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartIndex   The start address of slave device input address //
//      i_iTotalPoint   The total number of inputs to be read           //
//      o_iTotalByte    The total bytes of the response data contents   //
//      o_szData        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

void ADAMRTU_ModServer_Create(int slave_addr,
                              unsigned char * ptr_mem,
                              unsigned int size_of_mem);
//////////////////////////////////////////////////////////////////////////
//  Create Modbus RTU server (Slave)                                    //
//                                                                      //
//  Return Value:                                                       //
//      No return value.                                                //
//                                                                      //
//  Parameters:                                                         //
//      slave_addr      Slave device address ID (valid slave device     //
//                      addresses id are in the range of 0-247 decimal) //
//      ptr_mem         Share memory. (This share memory is used to     //
//                      allocate space for modbus coils or registers)   //
//      size_of_mem     The size of share memory                        //
//////////////////////////////////////////////////////////////////////////

bool ADAMModbusRTU_Read(int iPort,
                        int Slave_Addr,
                        unsigned long i_iStartAddr, 
                        unsigned long i_iEndAddr,
                        unsigned int *o_iByteOfResp,
                        unsigned char o_szResp[]
                       );
//////////////////////////////////////////////////////////////////////////
//  Reads the On/OFF status of 0X/1X references(coils) or the binary    //
//  contents of 3X/4X references(registers) in the slave.               //
//                                                                      //
//  Return Value:                                                       //
//      ADAMModbusRTU_Read() returns TRUE if it is successful.          //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartAddr    The start address of slave device               //
//      i_iEndAddr      The end address of slave device                 //
//      i_iTotalPoint   The total number of coils/regs to be read       //
//      o_iByteOfResp   The total bytes of the response data contents   //
//      o_szResp        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////
                       
bool ADAMModbusRTU_Write(int iPort,
                         int Slave_Addr,
                         unsigned long i_iStartAddr, 
                         unsigned long i_iEndAddr,
                         unsigned char i_szData[]
                        );
//////////////////////////////////////////////////////////////////////////
//  Presets values or Forces coils into a sequence of holding registers //
//  (4X references) or a sequence of coilds(0X references)              //
//                                                                      //
//  Return Value:                                                       //
//      ADAMModbusRTU_Write() returns TRUE if it is successful.         //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      iPort           COM port selection                              //
//                      Items: COM1, COM2, COM3(4500), COM4             //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartAddr    The start address of slave device               //
//      i_iEndAddr      The end address of slave device                 //
//      i_szData        The buffer of query data contents               //
//////////////////////////////////////////////////////////////////////////

void ADAM_SetCOMTimeout(unsigned long i_milliseconds);
//////////////////////////////////////////////////////////////////////////
//  Set COM Port Timeout value                                          //
//                                                                      //
//  Return Value:                                                       //
//      None                                                            //
//                                                                      //
//  Parameters:                                                         //
//      i_milliseconds  COM Port Timeout Value, in milliseconds         //
//                      0 means use default timeout value (2 seconds)   //
//                                                                      //
//////////////////////////////////////////////////////////////////////////

void ADAM_GetCOMTimeout(unsigned long * o_milliseconds);
//////////////////////////////////////////////////////////////////////////
//  Get COM Port Timeout value                                          //
//                                                                      //
//  Return Value:                                                       //
//      None                                                            //
//                                                                      //
//  Parameters:                                                         //
//      o_milliseconds  COM Port Timeout Value, in milliseconds         //
//                                                                      //
//////////////////////////////////////////////////////////////////////////
void Ver_RTU_Mod(char *vstr);   /*library version*/
//////////////////////////////////////////////////////////////////////////
//  Get the current library version                                     //
//                                                                      //
//  Return Value:                                                       //
//      No return value.                                                //
//                                                                      //
//  Parameters:                                                         //
//      vstr    A buffer that is used to contain the version string.    //
//                                                                      //
//  Remarks:                                                            //
//      The size of parameter vstr must be at least 10-byte long.       //
//////////////////////////////////////////////////////////////////////////

void adv_mb_printf(char *pFormat, ...);
//////////////////////////////////////////////////////////////////////////
//  sends formatted output to stdin without interrupt                   //
//                                                                      //
//  Return Value:                                                       //
//      No return value.                                                //
//                                                                      //
//  Parameters:                                                         //
//      adv_mb_printf() accepts a series of arguments                   //
//                                                                      //
//  Remarks:                                                            //
//      This function is the same as the adv_printf() in the utility.lib//
//      . This function is created to emulate the printf() function in  //
//      standard C library. The main difference between adv_mb_printf() //
//      and printf() is that the adv_mb_printf() sends output to stdin  //
//      without interrupt.                                              //
//////////////////////////////////////////////////////////////////////////

void ModbusRtuSysDiagnostic(int iReserved);
//////////////////////////////////////////////////////////////////////////
//  DESCRIPTION:                                                        //
//     Diagnose the modbusRTU system state. 						    //
//     If the system communication is failed, the UART will be restore. //
//       										                        //
//  Parameters:                                                         //
//      iReserved    The parameter is reserved in the future.		    //
//																		//
//  Remarks:                                                            //
//     This function should be called after an interval time.           //
//       															    //
//////////////////////////////////////////////////////////////////////////