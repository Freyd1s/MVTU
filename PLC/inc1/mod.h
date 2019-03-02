//-----------------------------------------------------------------------------------------
//Revised History:
//  A1.20 Revise ADAMTCP_ModServer_Update() function behavior.      2004-04-05      Arthur
//  A1.21 Revise client timeout function                            2004-07-15      Arthur
//        Modify ADAMTCP_ModServer_Create()
//        Add ADAMTCP_ModServer_Release()
//  A1.22 Extend maximum connections to 64
//  A1.23 Modify void ADAMTCP_ModServer_Release(void) and modify
//        modbus tcp function calls timeout function according to
//        socket lib select() time tick                             2005-06-05      Arthur
//  A1.24 1.Add adv_tmb_printf() function                           10-02-2005      Arthur
//        2.Read Coils bug fix                                
//        3.Add ADAMModbusTCP_Read() function
//        4.Add ADAMModbusTCP_Write() function
//	A1.26 Fix Null Pointer problem
//	A1.27 Add SetDebugMessageState() function						2007-04-25		Arthur
//Current Library Ver. A1.24
//------------------------------------------------------------------------------------------

#include "socket.h"
#define Errno errno


typedef int bool;
#define FALSE   0
#define TRUE    !FALSE
#define false   0
#define true    !false

#define HasMessage  1
#define NoMessage   0

#define iEnabled	1
#define iDisabled	0
//-----Error
#define GetHostName_Err         (-1)
#define SocketInit_Err          (-2)
#define Connect_Err             (-3)
#define TCPSend_Err             (-1)
#define TCPRecv_Err             (-2)
#define TCPTimeOut_Err          0

//-----Error Code
#define ILLEGAL_FUNC            01
#define ILLEGAL_DATA_ADDR       02
#define ILLEGAL_DATA_VALUE      03
#define SLAVE_DE_FAIL           04
#define ACKNOWLEDGE             05
#define SLAVE_DE_BUSY           06
#define NEG_ACKNOWLEDGE         07
#define MEM_PARITY_ERR          08
#define Err_InvalidModbusAddr   (-10)

//-----Server Error code
#define ModSer_Socket_Err   (-1)
#define ModSer_bind_Err     (-2)
#define ModSer_ioctl_Err    (-3)
#define ModSer_listen_Err   (-4)
#define ModSer_accept_Err   (-5)
#define Parse_Cmd_Err       (-6)

void Ver_TCP_Mod(char *vstr);   //library version

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


//Modbus TCP Client Functions
int ReturnErr_code(void);
//////////////////////////////////////////////////////////////////////////
//  Get the last error code                                             //
//                                                                      //
//  Return Value:                                                       //
//      Return the last error code                                      //
//      Items: Parse_Cmd_Err(96)                                        //
//                                                                      //
//  Parameters:                                                         //
//      No parameters                                                   //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_Connect(SOCKET * SO, char * Target_IP, int Target_Port);
//////////////////////////////////////////////////////////////////////////
//  Connect modbus tcp slave(server)                                    //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_Connect() returns TRUE if it is successful.             //
//      On an error, a negative value of the following errors will      //
//      be return.                                                      //
//          value -1: GetHostName_Err                                   //
//          value -2: SocketInit_Err                                    //
//          value -3: Connect_Err                                       //
//                                                                      //
//  Parameters:                                                         //
//      SO          A descriptor identifying a socket                   //
//      Target_IP   IP addresss of Modbus TCP slave(server)             //
//      Target_Port IP port of Modbus TCP slave(server) (standard: 502) //
//////////////////////////////////////////////////////////////////////////

bool ADAMTCP_Disconnect(SOCKET * SO);
//////////////////////////////////////////////////////////////////////////
//  Disconnect modbus tcp slave(server)                                 //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_Connect() returns TRUE if it is successful, returns     //
//      FALSE if it is unsuccessful.                                    //
//                                                                      //
//  Parameters:                                                         //
//      SO          A descriptor identifying a socket                   //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ForceMultiCoils(SOCKET * SO,
                            int WaitMilliSec,
                            int Slave_Addr,
                            int CoilIndex,
                            int TotalPoint,
                            int TotalByte,
                            unsigned char szData[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (0F Hex) Force Multiple Coils                       //
//  Forces each coil (0X reference) in a sequence of coils to either ON //
//  or OFF                                                              //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ForceMultiCoils() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ForceMultiCoils()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      CoilIndex       The start address of slave device coil address  //
//      TotalPoint      The total number of coils to be forced          //
//      TotalByte       The total bytes of the query data contents      //
//      szData          The buffer of query data contents               //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ForceSingleCoil(SOCKET * SO,
                            int WaitMilliSec,
                            int Slave_Addr,
                            int CoilIndex,
                            int Data);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (05 Hex) Force Single Coil                          //
//  Forces a single coil (0X reference) to either ON or OFF             //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ForceSingleCoil() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ForceSingleCoil()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      CoilIndex       The start address of slave device coil address  //
//      Data            The status of coil to be forced                 //
//                      Item: 0(OFF), 1(ON)                             //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_PresetMultiRegs(SOCKET * SO,
                            int WaitMilliSec,
                            int Slave_Addr,
                            int StartReg,
                            int TotalReg,
                            int TotalByte,
                            unsigned char Data[]);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (10 Hex) Preset Multiple Regs                       //
//  Presets values into a sequence of holding registers (4X references) //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_PresetMultiRegs() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_PresetMultiRegs()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      StartReg        The start address of slave device registers     //
//                      address                                         //
//      TotalReg        The total number of registers to be preset      //
//      TotalByte       The total bytes of the query data contents      //
//      Data            The buffer of query data contents               //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_PresetSingleReg(SOCKET * SO,
                            int WaitMilliSec,
                            int Slave_Addr,
                            int RegIndex,
                            int Data);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (06 Hex) Preset Single Register                     //
//  Presets a value into a single holding registers (4X references)     //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_PresetSingleReg() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_PresetSingleReg()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      RegIndex        The address of slave device registers address   //
//      Data            The 16-bit register value                       //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ReadCoilStatus(SOCKET * SO,
                           int WaitMilliSec,
                           int Slave_Addr,
                           int StartIndex,
                           int TotalPoint,
                           int * ByteCount,
                           char * wData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (01 Hex) Read Coil Status                           //
//  Reads the On/OFF status of discrete outputs (0X references, coils)  //
//  in the slave.                                                       //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ReadCoilStatus() returns TRUE if it is successful.      //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ReadCoilStatus()    //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      StartIndex      The start address of slave device coil address  //
//      TotalPoint      The total number of coils to be read            //
//      ByteCount       The total bytes of the response data contents   //
//      wData           The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ReadHoldingRegs(SOCKET * SO,
                           int WaitMilliSec,
                           int Slave_Addr,
                           int StartIndex,
                           int TotalPoint,
                           int * ByteCount,
                           char * wData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (03 Hex) Read Holding Registers                     //
//  Reads the binary contents of holding registers (4X references) in   //
//  the slave.                                                          //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ReadHoldingRegs() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ReadHoldingRegs()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      StartIndex      The start address of slave device register      //
//                      address                                         //
//      TotalPoint      The total number of registers to be read        //
//      ByteCount       The total bytes of the response data contents   //
//      wData           The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ReadInputRegs(SOCKET * SO,
                          int WaitMilliSec,
                          int Slave_Addr,
                          int StartIndex,
                          int TotalPoint,
                          int * ByteCount,
                          char * wData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (04 Hex) Read Input Registers                       //
//  Reads the binary contents of holding registers (3X references) in   //
//  the slave.                                                          //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ReadInputRegs() returns TRUE if it is successful.       //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ReadInputRegs()     //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      StartIndex      The start address of slave device register      //
//                      address                                         //
//      TotalPoint      The total number of registers to be read        //
//      ByteCount       The total bytes of the response data contents   //
//      wData           The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ReadInputStatus(SOCKET * SO,
                            int WaitMilliSec,
                            int Slave_Addr,
                            int StartIndex,
                            int TotalPoint,
                            int * ByteCount,
                            char * wData);
//////////////////////////////////////////////////////////////////////////
//  Modbus function (02 Hex) Read Input Status                          //
//  Reads the ON/OFF status of discrete inputs (1X references) in the   //
//  slave.                                                              //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ReadInputStatus() returns TRUE if it is successful.     //
//      On an error, a non-positive value of error code will be return  //
//      Item: TCPSend_Err(-1), TCPRecv_Err(-2), TCPTimeOut_Err(0)       //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMTCP_ReadInputStatus()   //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      StartIndex      The start address of slave device input address //
//      TotalPoint      The total number of inputs to be read           //
//      ByteCount       The total bytes of the response data contents   //
//      wData           The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

bool ADAMModbusTCP_Read(SOCKET * SO,
                        int WaitMilliSec,
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
//      ADAMModbusTCP_Read() returns TRUE if it is successful.          //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMModbusTCP_Read()        //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartAddr    The start address of slave device               //
//      i_iEndAddr      The end address of slave device                 //
//      i_iTotalPoint   The total number of coils/regs to be read       //
//      o_iByteOfResp   The total bytes of the response data contents   //
//      o_szResp        The buffer of response data contents            //
//////////////////////////////////////////////////////////////////////////

bool ADAMModbusTCP_Write(SOCKET * SO,
                        int WaitMilliSec,
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
//      ADAMModbusTCP_Write() returns TRUE if it is successful.         //
//      On an error, a value of FALSE will be return and the function   //
//      Error_Code() can be used to get the last error.                 //
//                                                                      //
//  Parameters:                                                         //
//      SO              A descriptor identifying a socket               //
//      WaitMilliSec    The maximum time of ADAMModbusTCP_Write()       //
//                      to wait.                                        //
//      Slave_Addr      Address ID of slave device (valid slave device  //
//                      addresses id are in the range of 0-247 decimal) //
//      i_iStartAddr    The start address of slave device               //
//      i_iEndAddr      The end address of slave device                 //
//      i_szData        The buffer of query data contents               //
//////////////////////////////////////////////////////////////////////////

//Modbus TCP Server Functions

int ADAMTCP_ModServer_Create(int Host_Port,
                             unsigned long waittimeout,
                             unsigned int numberConns,
                             unsigned char * ptr_mem,
                             int size_mem);
//////////////////////////////////////////////////////////////////////////
//  Create Modbus TCP server (Slave)                                    //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ModServer_Create() returns TRUE if it is successful.    //
//      On an error, a negative value of error code will be return      //
//      Item: ModSer_bind_Err(-2), ModSer_ioctl_Err(-3)                 //
//            ModSer_listen_Err(-4)                                     //
//                                                                      //
//  Parameters:                                                         //
//      Host_Port       IP port                                         //
//      waittimeout     The maximum time of client connection to wait.  //
//      numberConns     The maximum number of client connection.        //
//      ptr_mem         Share memory. (This share memory is used to     //
//                      allocate space for modbus coils or registers)   //
//      size_of_mem     The size of share memory                        //
//////////////////////////////////////////////////////////////////////////

int ADAMTCP_ModServer_Update(void);
//////////////////////////////////////////////////////////////////////////
//  Check if there is any message sent from client(s)                   //
//                                                                      //
//  Return Value:                                                       //
//      ADAMTCP_ModServer_Update() returns one of the following status  //
//      code to indicate current connection state.                      //
//      state               value       meanning                        //
//      HasMessage              1       Has message sent from client    //
//      NoMessage               0       No message sent from client     //
//      ModSer_accept_Err      -5       Accept client connection fail   //
//                                                                      //
//  Parameters:                                                         //
//      No parameters                                                   //
//                                                                      //
//  Remarks:                                                            //
//      The ADAMTCP_ModServer_Update() must be called periodically to   //
//      keep the server alive.                                          //
//////////////////////////////////////////////////////////////////////////

void ADAMTCP_ModServer_Release(void);
//////////////////////////////////////////////////////////////////////////
//  Release Modbus TCP slave(server)                                    //
//                                                                      //
//  Return Value:                                                       //
//      No return value                                                 //
//                                                                      //
//  Parameters:                                                         //
//      No parameters                                                   //
//////////////////////////////////////////////////////////////////////////

void adv_tmb_printf(char *pFormat, ...);
//////////////////////////////////////////////////////////////////////////
//  sends formatted output to stdin without interrupt                   //
//                                                                      //
//  Return Value:                                                       //
//      No return value.                                                //
//                                                                      //
//  Parameters:                                                         //
//      adv_tmb_printf() accepts a series of arguments                  //
//                                                                      //
//  Remarks:                                                            //
//      This function is the same as the adv_printf() in the utility.lib//
//      . This function is created to emulate the printf() function in  //
//      standard C library. The main difference between adv_tmb_printf()//
//      and printf() is that the adv_mb_printf() sends output to stdin  //
//      without interrupt.                                              //
//////////////////////////////////////////////////////////////////////////

void SetDebugMessageState(unsigned char iState);
//////////////////////////////////////////////////////////////////////////
//  Enable/Disable Debug Message										//
//                                                                      //
//  Return Value:                                                       //
//      No return value.                                                //
//                                                                      //
//  Parameters:                                                         //
//      iState iEnabled(1)/iDisabled(0) to turn-on/off debug message	//
//                                                                      //
//////////////////////////////////////////////////////////////////////////