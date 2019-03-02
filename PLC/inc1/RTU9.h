//----------------------------------------------------------------
//Revised History:
//	None
//Current Ver: A1.10
//----------------------------------------------------------------
typedef int bool;
#define FALSE   0
#define TRUE    !FALSE

#define false   0
#define true    !false

#define D5           0x05    /* 5 Data bits */
#define D6           0x06    /* 6 Data bits */
#define D7           0x07    /* 7 Data bits */
#define D8           0x08    /* 8 Data bits */

#define S1           0x01    /* 1 Stop bit */
#define S2           0x02    /* 2 Stop bits */

#define NO_P       0x00    /* No parity */
#define ODD_P      0x01    /* Odd parity */
#define EVEN_P     0x02    /* Even parity */

//error code
#define InvalidResponse			91
#define Com_InitOrMode_Err		92
#define COMTimeOut				93

int Error_Code();
//install slot
//return :
//			0x00	first time install and install OK !
//			0x04	not first time install and install OK !
//			0x05	error portno
//			0x06	Not/No ADAM5090 Module in this slot
//			0x07	Rx Buffer Create Error
int Modbus_5090_Init(int Port, unsigned long iBaud, int iParity, int iFormat, int iStopBits);
int Modbus_5090_Release(int Port);

bool A5090_RTU_ForceMultiCoils(int iPort,
							int Slave_Addr,
							int CoilIndex,
							int TotalPoint,
							int TotalByte,
							unsigned char szData[]);
bool A5090_RTU_ForceSingleCoil(int iPort,
							 int i_iAddr,
							 int i_iCoilIndex,
							 int i_iData);
bool A5090_RTU_PresetMultiRegs(int iPort,
						 	 int i_iAddr, 
						 	 int i_iStartReg,
						 	 int i_iTotalReg,
						 	 int i_iTotalByte,
						 	 unsigned char i_szData[]);
bool A5090_RTU_PresetSingleReg(int iPort,
						 	 int i_iAddr,
						 	 int i_iRegIndex,
						 	 int i_iData);
bool A5090_RTU_ReadCoilStatus(int iPort,
						   int i_iAddr, 
						   int i_iStartIndex,
						   int i_iTotalPoint,
						   int *o_iTotalByte, 			//notice: order different
						   unsigned char o_szData[]);
bool A5090_RTU_ReadHoldingRegs(int iPort,
							 int i_iAddr, 
							 int i_iStartIndex,
							 int i_iTotalPoint,
							 int *o_iTotalByte,
							 unsigned char o_szData[]);
bool A5090_RTU_ReadInputRegs(int iPort,
						   int i_iAddr, 
						   int i_iStartIndex,
						   int i_iTotalPoint,
						   int *o_iTotalByte,
						   unsigned char o_szData[]);
bool A5090_RTU_ReadInputStatus(int iPort,
							 int i_iAddr, 
							 int i_iStartIndex,
							 int i_iTotalPoint,
						   	 int *o_iTotalByte,
						   	 unsigned char o_szData[]);