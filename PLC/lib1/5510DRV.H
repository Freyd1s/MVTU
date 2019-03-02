#ifndef A5510DRVH
#define A5510DRVH
//----------------------------------------------------------------
//Revised History of Utility.Lib:
//      V2.12   Add Set5069()
//              Revise Get_BoardID()
//      V2.13   Add 5055 DI filter
//      V2.14   5080 Start_Stop_Counter() function bug fix
//      V2.15   Modify Get_BoardID() function for Adam-5090
//      V2.16   B01: Add Adam-5017UH lib
//      V2.16   B02: Modify Delay time of Adam-5017UH
//      V2.16   B03: extend Get5017UH_CyclicData() to 1024 bytes
//      A0.01   B01: new Adam-5017H 4~20mA AI value error   (This version
//                                                           only for solving 5017UH problem)
//      V2.17   B01: Add COM Port base address define
//      V2.18   B01: Plug two Adam-5017 in slot0 and slot7 error bug fix
//      V2.19   B01: Disable interrupts before programing flash
//      V2.20   B01: Creat Uti_NF.Lib for no filer version.
//      V2.21   B01: Modify Get_BoardID()
//
//Revised History of COM.Lib:
//      V1.01   B01: 1.Share IRQ of COM1 and COM4 problem fix
//                   2.Add Ver_COMLib() function for reading COM.lib version
//      V1.02   B01: Add com_tx_multiple() function.
//				B02: Add com_tx_queue_available() function.
//		V1.03	B02: COM2 Lib rewrite.
//		V1.06   B06: New COM Library=>Add SIO_XX function calls to replace old COM API
//
//Revised History of HIO.Lib:
//      V1.11   B01: 1.Adam-5017UH Channel Mask bug fix.
//                   2.Add Ver_HIOLib() function for reading HIO.lib version
//      V1.13   B01: Creat HIO_NF.Lib version for no filter version.
//      V1.14   B01: Creat Adam-5081 library.
//      V1.15   B01: Creat Set/Get AO range code library.
//Revised History of LAI.Lib:
//      V1.10   B01: 1.Add 5018P Library
//      V1.11   B01: Creat Set AI range code library.
//----------------------------------------------------------------
#include <io.h>
#include <dos.h>
#include <stdio.h>
#include <stdlib.h>

typedef int bool;               //arthur.hsu    03-16-2005

/*----Add for new COM Port API----- Arthur Add   July, 2007*/
#ifndef ADAMVARS
#define ADAMVARS
typedef char CHAR;
typedef short SHORT;
typedef int INT;
typedef long LONG;
typedef unsigned char UCHAR;
typedef unsigned short USHORT;
typedef unsigned int UINT;
typedef unsigned long ULONG;

typedef unsigned short WORD;
typedef ULONG DWORD;
typedef UCHAR BYTE;
#endif

#define FALSE   0 				//Arthur modify		July, 2007
#define TRUE    1				//Arthur modify		July, 2007
#define false   0
#define true    1

/* ------------------------------------------------------------------ */
/*  Module ID number Definitions                      */
/* ------------------------------------------------------------------ */
#define ADAM5017_ID     0x04
#define ADAM5018_ID     0x05
#define ADAM5080_ID     0x06
#define ADAM5013A_ID    0x08
#define ADAM5013B_ID    0x09
#define ADAM5017H_ID    0x0C
#define ADAM5018H_ID    0x0D
#define ADAM5018P_ID    0x38	//For ADAM-5017P and ADAM_5018P
#define ADAM5052_ID     0x0F
#define ADAM5050_ID     0x10
#define ADAM5051_ID     0x11
#define ADAM5055_ID     0x15
#define ADAM5056_ID     0x12
#define ADAM5068_ID     0x13
#define ADAM5069_ID     0x69
#define ADAM5060_ID     0x14
#define ADAM5024_ID     0x18
//#define   ADAM5080_ID     0x1E
#define ADAM5090_ID     0x1F
#define ADAM5017UH_ID	0x17
#define ADAM5081_ID     0x81

/* ------------------------------------------------------------------ */
/*  Module Variables Definitions                      */
/* ------------------------------------------------------------------ */
#define ABit        0x00
#define AByte       0x01
#define AWord       0x02

/* ------------------------------------------------------------------ */
/*  LED light Definitions                         */
/* ------------------------------------------------------------------ */
#define PWR 1
#define RUN 2
#define COMM    3

/* ------------------------------------------------------------------ */
/*  RTC timer Definitions                         */
/* ------------------------------------------------------------------ */
#define RTC_alarm_sec   0x01
#define RTC_alarm_min   0x03
#define RTC_alarm_hour  0x05
#define RTC_sec     0x00
#define RTC_min     0x02
#define RTC_hour    0x04
#define RTC_week    0x06
#define RTC_day     0x07
#define RTC_month   0x08
#define RTC_year    0x09
#define RTC_REG_A   0x0A
#define RTC_REG_B   0x0B
#define RTC_REG_C   0x0C
#define RTC_REG_D   0x0D

/* ------------------------------------------------------------------ */
/*  New COM Port API Definitions                              */
/* ------------------------------------------------------------------ */
#define Block_Mode				0x01
#define UnBlock_Mode			0x02
#define Clear_RXBuffer			0x01
#define Clear_TXBuffer			0x02
#define RaiseSignal				0x01
#define LowerSignal				0x02
#define Signal_RTS				0x01
#define Signal_DTR				0x02
/* ------------------------------------------------------------------ */
/*  UART Definitions                              */
/* ------------------------------------------------------------------ */
#define TXBUFF      0   /* Transmit buffer register */
#define RXBUFF      0   /* Receive buffer register */
#define DLLSB       0   /* Divisor latch LS byte */
#define DLMSB       1   /* Divisor latch MS byte */
#define IER     1   /* Interrupt enable register */
#define IIR     2   /* Interrupt ID register */
#define LCR     3   /* Line control register */
#define MCR     4   /* Modem control register */
#define LSR     5   /* Line status register */
#define MSR     6   /* Modem status register */

/*------------------------------------------------------*/
/*  Modem control register bits             */
/*------------------------------------------------------*/
#define DTR     0x01    /* Data terminal ready */
#define RTS     0x02    /* Request to send */
#define OUT1        0x04    /* Output #1 */
#define OUT2        0x08    /* Output #2 */
#define LPBK        0x10    /* Loopback mode bit */

/*------------------------------------------------------*/
/*  Modem status register bits              */
/*------------------------------------------------------*/
#define DCTS        0x01    /* Delta clear to send */
#define DDSR        0x02    /* Delta data set ready */
#define TERI        0x04    /* Trailing edge ring indicator */
#define DRLSD       0x08    /* Delta Rx line signal detect */
#define CTS     0x10    /* Clear to send */
#define DSR     0x20    /* Data set ready */
#define RI      0x40    /* Ring indicator */
#define RLSD        0x80    /* Receive line signal detect */

/*------------------------------------------------------*/
/*  Line control register bits              */
/*------------------------------------------------------*/
#define DATA5       0x00    /* 5 Data bits */
#define DATA6       0x01    /* 6 Data bits */
#define DATA7       0x02    /* 7 Data bits */
#define DATA8       0x03    /* 8 Data bits */

#define STOP1       0x00    /* 1 Stop bit */
#define STOP2       0x04    /* 2 Stop bits */

#define NO_PARITY   0x00    /* No parity */
#define ODD_PARITY  0x08    /* Odd parity */
#define EVEN_PARITY 0x18    /* Even parity */
#define ONE_PARITY  0x28    /* Parity bit = 1 */
#define ZERO_PARITY 0x38    /* Parity bit = 0 */

/*------------------------------------------------------*/
/*  Line status register bits               */
/*------------------------------------------------------*/
#define RDR     0x01    /* Receive data ready */
#define ERRS        0x1E    /* All the error bits */
#define TXR     0x20    /* Transmitter ready */

/*------------------------------------------------------*/
/*  Interrupt enable register bits          */
/*------------------------------------------------------*/
#define DR      0x01    /* Data ready */
#define THRE        0x02    /* Tx buffer empty */
#define RLS     0x04    /* Receive line status */

/* --------------------------------------------------------*/
/*    * Handshaking I/O                */
/* --------------------------------------------------------*/
/* Values for the RX FIFO triggerlevel             */
#define FIFO_1      0x00
#define FIFO_4      0x40
#define FIFO_8      0x80
#define FIFO_14     0xC0

/* Values for com_set_line_params()  (can be combined with |)*/
#define LP_5BITS    0x00
#define LP_6BITS    0x01
#define LP_7BITS    0x02
#define LP_8BITS    0x03
#define LP_1STOP    0x00
#define LP_2STOP    0x04
#define LP_NO_PARITY    0x00
#define LP_ODD_PARITY   0x08
#define LP_EVEN_PARITY  0x18
#define LP_MARK_PARITY  0x28
#define LP_SPACE_PARITY 0x38

/* Values for line status test*/
#define LS_DR       0x01        /* data ready                 */
#define LS_OE       0x02        /* overrun error              */
#define LS_PE       0x04        /* parity error               */
#define LS_FE       0x08        /* framing error              */
#define LS_BI       0x10        /* break indicator            */
#define LS_THRE     0x20        /* transmitter holding register empty */
#define LS_TEMT     0x40        /* transmitter empty              */
#define LS_PENDING  0x80        /* error pending in FIFO (16550+ only)*/

/* Values for modem status test*/
#define MS_DELTA_CTS    0x01
#define MS_DELTA_DSR    0x02
#define MS_TERI     0x04
#define MS_DELTA_DCD    0x08
#define MS_CTS      0x10
#define MS_DSR      0x20
#define MS_RI       0x40
#define MS_DCD      0x80

/* Values for handshaking mode*/
#define HS_NONE     0x00
#define HS_RTSCTS   0x01
#define HS_XONXOFF  0x02

/* Values for errors*/
#define UE_OK           0   /* OK                    */
#define UE_ERROR        -1  /* unspecific error condition        */
#define UE_BAD_HANDLE       -2  /* given handle has never been defined   */
#define UE_NO_HANDLES       -3  /* no free handles left (too many ports) */
#define UE_NO_FREE_MEMORY   -4  /* not enough free memory for buffers    */
#define UE_BAD_INBUF_SIZE   -5  /* illegal size given for inbuf      */
#define UE_BAD_OUTBUF_SIZE  -6  /* illegal size given for outbuf     */
#define UE_BAD_HANDSHAKING  -7  /* illegal handshaking mode specified    */
#define UE_BAD_INTLEVEL     -8  /* illegal interrupt level       */
#define UE_TIMEOUT      -9  /* any kind of timeout condition appeared*/
#define UE_BAD_FIFO     -10 /* it's a 16550 (no A), FIFO not enabled */
#define UE_BAD_HANDLER      -11 /* NULL pointer given for handler address*/

/*-------Adam-5017UH-------*/
extern int ErrCode;

#define Conf_EngineeringUnit            0x00000002
#define Conf_RawData                    0x00000004
#define Conf_Cyclic                     0x00000010
#define Conf_NonCyclic                  0x00000020
#define Conf_Filter_ON                  0x00000040
#define Conf_Filter_OFF                 0x00000080
#define Conf_Trigger                    0x00000100
#define Conf_PreTrigger                 0x00000200
#define Conf_PostTrigger                0x00000400
#define Conf_Trigger_OFF                0x00000800

#define In_Range_0_500mV                0x43
#define In_Range_0_20mA                 0x46
#define In_Range_0_10V                  0x48
#define In_Range_mi10V_10V              0x08        //mi: minus
#define In_Range_4_20mA                 0x07

#define AcqMode_Setting_Err             -1
#define DataFormat_Setting_Err          -2
#define Filter_Mode_SetErr              -5
#define TrigMode_SetErr                 -6
#define Frequency_RangeSetErr           -7
#define Over_Slot_Channel_Err           -8
#define Input_Range_Code_Err            -9
#define AcqNum_OverRange_Err            -10
#define A5017UH_FIFO_NotReady           -11
#define TriVal_OverRange_Err            -12
#define A5017UH_Cmd_Ack_Err             -13
#define Not_Start_Yet_Err               -14
#define Ch_Not_Enabled_Err              -15
#define Trig_Event_Not_Ocur_Err         -16

#define COM_already_installed	-1
#define Err_Access_COM			-2
#define No_Such_Port			-3
#define COM_Not_Installed		-4
#define Illegal_Setting			-5
#define RequestOverQueueSize	-6

/*----COM Port Base Addr Define----*/
#define COM1_BaseAddr 0x3F8
#define COM2_BaseAddr 0x2F8
#define COM4_BaseAddr 0x3E8

#define COMR					4


#define COM1                    1
#define COM2                    2
#define COM4                    COMR
#define COM_PGM					3


enum    par_code    { COM_NONE,
              COM_EVEN,
              COM_ODD,
              COM_ZERO,
              COM_ONE };


/*------ utility.lib declaration -----*/
unsigned char Get_NodeID(void);
unsigned char Get_BoardID(int Board);
void Set_SysMem(unsigned char which_byte, unsigned char data);
unsigned char Get_SysMem(unsigned char which_byte);
void Set_NVRAM_Size(unsigned char sector);
unsigned char Get_NVRAM_Size( void);
unsigned short ProgramByte( unsigned long ulAddress, unsigned char byte );

unsigned short ProgramSector( unsigned long ulAddress, unsigned char  far * SECTOR_DATA);
unsigned short EraseSector( unsigned long ulBase );
unsigned char read_mem (int memory_segment , unsigned int i);
unsigned char read_backup_ram(unsigned long index);
void write_backup_ram(unsigned long index, unsigned char    data);
unsigned char read_backup_ram_plus(unsigned  FP_SEG, unsigned int FP_OFF);              //2002/8/14 By Adam.Lin
void write_backup_ram_plus(unsigned int FP_SEG, unsigned int FP_OFF, unsigned char Data);       //2002/8/14 By Adam.Lin
unsigned char GetRTCtime(unsigned char Time);
void SetRTCtime(unsigned char Time,unsigned char data);
void WDT_enable(void);
void WDT_disable(void);
void WDT_clear(void);
void LED_init(void);
void LED_ON(int which_led);
void LED_OFF(int which_led);
extern int tmArriveCnt[100];
int Timer_Init();
int Timer_Set(unsigned int msec);
void Timer_Reset(int idx);
void Release_All();
void ADAMdelay(unsigned short msec);
void Normal_Speed_Up(void);
void High_Speed(void);
void Ver(char *vstr);
int BatteryStatus(void);
void adv_printf(char *pFormat, ...);
int A_Timer_Init(unsigned char i_mSec);
//extern void TimerIRQ(void);
int A_AiUpdate(int Board, int *channel);
void A_Init501718(int Slot);
/*------ lai.lib declaration -----*/
void Init501718(int Slot);
int AiUpdate(int Board, int *channel);
void Get501718(int Board, int Channel, void *pValue);
void Get501718_long(int Board, int Channel, void *pValue);    //2003/7/18 By Adam.Lin
void Init5013(int Slot);
void Get5013(int Board, int Channel, void *pValue);
void Get5013_long(int Board,    int Channel, void *pValue);      //2003/7/18 By Adam.Lin
void GetRange501718(int Board,int Channel,void *pValue);
void GetRange5013(int Board,int Channel,void *pValue);
void Ver_LAILib(char *vstr);
int SetRangeLAI(int bidx, int Ch, char RangCode);			//20090202

/*------ hio.lib declaration -----*/
void Get5050(int Board, int Bit, int Size, void *pValue);
void Get5051(int Board, int Bit, int Size, void *pValue);
void Get5052(int Board, int Bit, int Size, void *pValue);
void Get5055(int Board, int Bit, int Size, void *pValue);
void Init5024(int Slot, int ch0_val, int ch1_val, int ch2_val, int ch3_val);
void Set5024(void *pValue, int Board, int Channel);
void GetRange5024(int Board,int Channel,void *pValue);                        //2002/10/9 By Adam.Lin
void Set5050(void *pValue, int Board, int Bit, int Size);
void Set5055(void *pValue, int Board, int Bit, int Size);
void Set5056(void *pValue, int Board, int Bit, int Size);
void Set5060(void *pValue, int Board, int Bit, int Size);
void Set5068(void *pValue, int Board, int Bit, int Size);
void Set5069(void *pValue, int Board, int Bit, int Size);
void InitDIFilter(int iSlot, int iCh, unsigned int MIN_Lo_Width, unsigned int MIN_High_Width);      //Arthur added
int SetRange5024(int bidx, int Ch, char RangCode);			//20090202

/*------ 5081 -----*/
int Init5081(int Board);
unsigned long Get5081(int Board, int Channel);
unsigned char GetRange5081(int Board, int Channel);
int SetRange5081(int Board, int Channel, unsigned char KeyInChMode);
unsigned long GetDigitalFilter5081(int Board);
int SetDigitalFilter5081(int Board, unsigned long Value);
unsigned long GetInitCounterVal5081(int Board, int Channel);
int SetInitCounterVal5081(int Board, int Channel, unsigned long Value);
int Start_Stop_Counter5081(int Board, int Channel,	int StartOrStop);
bool Get_Start_Stop_Counter_Status(int Board, int Channel);
int ReadOverflowFlag5081(int Board, int Channel);
int ClearOverflowFlag5081(int Board, int Channel);
int Clear_Counter5081(int Board, int Channel);

unsigned char ClearAlarmOccurFlag81(int Board, int Channel);
unsigned char GetAlarmOccurFlag81(int Board, int Channel);
unsigned char GetLocalAlarmHiLoType81(int Board, int Channel);
unsigned char SetLocalAlarmHiLoType81(int Board, int Channel, unsigned int HiLoType);
unsigned char GetLocalAlarmEN81(int Board, int Channel);
unsigned char SetLocalAlarmEN81(int Board, int Channel, unsigned int HiLoEN);
unsigned char GetLocalAlarmMap81(int Board, int Channel);
unsigned char SetLocalAlarmMap81(int Board, int Channel, int ChMap);
unsigned long GetLocalAlarmLim5081(int Board, int Channel);
unsigned char SetLocalAlarmLim5081(int Board, int Channel, unsigned long Value);

int SetDO5081(void *pValue, int Board, int Bit, int Size);
int GetDO5081(int Board, int Bit, int Size, void *pValue);
//

extern unsigned char gFormat[8];
void Init5017H(int Slot);/* 1998-11-17*/
void Get5017H(int Board,int Channel,void *pValue);
void GetRange5017H(int Board,int Channel,void *pValue);

void Init5080(int Board);   /* 1999-11-18 */
void Get5080(int Board,int Channel,long *pValue);
void GetRange5080(int Board,void *pValue);
void SetRange5080(int Board, void *pValue); 
void ReadOverflowFlag(int Board, int Channel, void *pValue);

int  Clear_Counter(int Board,int Channel);
int  Start_Stop_Counter(int Board, int Channel, int StartOrStop);
/* StartOrStop=1 -> Start  ; StartOrStop=0 -> Stop */
int  SetInitCounterVal(int Board, int Channel, unsigned long Value);
int SetDigitalFilter(int Board, unsigned int Value);    /* 2003/10/6 01:19 PM by Adam.Lin */
int GetDigitalFilter(int Board);                        /* 2003/11/26 03:20 PM by Adam.Lin */

    //5017UH
bool Init5017UH(int Slot, unsigned long AcqMode, unsigned long DataFormat, unsigned char ChannelMask);      //arthur.hsu 03-16-2005
bool Set5017UH_Advanced_Setting(int Slot, unsigned int Acq_Num, unsigned long Freq,
                                unsigned long Trig_Mode, unsigned long FilterMode);
bool Set5017UHTriVal(int Slot, int Channel, float TriggerVal);
bool Get5017UHTriVal(int Slot, int Channel, float *TriggerVal);
bool Get5017UHSetting(int Slot, unsigned char *ChannelMask, unsigned long *Conf_Setting,
                      unsigned long *Freq, unsigned int *AcquisitionNum);
bool GetRange5017UH(int Slot, int Channel, void *pRange);
bool SetRange5017UH(int Slot, int Channel,unsigned char Range);
bool Get5017UH(int Slot, int Channel, void *pValue);
bool Get5017UH_TriData(int Slot, int Channel, int *pValue);
bool Get5017UH_CyclicData(int Slot, unsigned int *pValue);

void Ver_HIOLib(char *vstr);
/*------ comm.lib declaration -----*/
int com_install(int portnum);
void com_deinstall(void);
void com_set_speed(unsigned long speed);
void com_set_parity(enum par_code parity, int stop_bits);
void com_tx(char c);
void com_tx_string(char *s);
char com_rx(void);
int com_tx_ready(void);
int com_tx_empty(void);
int com_rx_empty(void);
void com_flush_tx();
void com_flush_rx();
int com_carrier(void);
void com_lower_dtr(void);
void com_raise_dtr(void);
void com_raise_rts(unsigned baseaddr);
void com_lower_rts(unsigned baseaddr);
void com_set_break(unsigned baseaddr);
void com_clear_break(unsigned baseaddr);
void com_set_local_loopback(unsigned baseaddr);
void com_clear_local_loopback(unsigned baseaddr);
int com_enable_fifo(unsigned baseaddr, unsigned triggerlevel);
void com_disable_fifo(unsigned baseaddr);
int com_read_scratch_register(unsigned baseaddr);
void com_write_scratch_register(unsigned baseaddr, int value);
int com_set_line_params(unsigned baseaddr, unsigned lineparams);
int com_get_line_status(unsigned baseaddr);
int com_get_modem_status(unsigned baseaddr);
void modem_command(char *cmdstr);
void modem_initial(void);
void modem_handup(void);
void modem_autoanswer(void);
void modem_command_state(void);
void modem_dial(char *telenum);
unsigned int CRC16(char *data_p, unsigned int length);
unsigned int checksum(void *buffer, int len, unsigned int seed);

int com_485_install();
void com_485_deinstall(void);
void com_485_set_speed(unsigned long speed);
void com_485_set_format(int data_length, int parity, int stop_bit);
void com_set_format(int data_length, int parity, int stop_bit);
void com_485_tx(char c);
void com_485_tx_string(char *s);
char com_485_rx(void);
int com_pgm_install();
void com_pgm_deinstall(void);
void com_pgm_set_speed(unsigned long speed);
void com_pgm_set_format(int data_length, int parity, int stop_bit);
void com_pgm_tx(char c);
void com_pgm_tx_string(char *s);
char com_pgm_rx(void);
void com_485_flush_tx();
void com_485_flush_rx();
int com_485_tx_empty(void);
int com_485_rx_empty(void);
void com_pgm_flush_tx();
void com_pgm_flush_rx();
int com_pgm_tx_empty(void);
int com_pgm_rx_empty(void);

/*---1/16/2003---------------------------------------------------*/
/*---com_232_485-------------------------------------------------*/
int com_232_485_install();
void com_232_485_deinstall();
void com_232_485_set_speed(unsigned long speed);
void com_232_485_set_parity(enum par_code parity, int stop_bits);
void com_232_485_tx(char c);
void com_232_485_tx_string(char *s);
char com_232_485_rx(void);
int com_232_485_tx_ready(void);
int com_232_485_tx_empty(void);
int com_232_485_rx_empty(void);
void com_232_485_set_format(int data_length, int parity, int stop_bit);
void com_232_485_flush_tx();
void com_232_485_flush_rx();
void Ver_COMLib(char *vstr);

int com_tx_multiple(int Port, unsigned char* data_ary, unsigned int iLen);
//com_tx_multiple() Note: program will suspend here util tx queue space is enough for sending bytes
int com_tx_queue_available(int Port);


/*------------------------------------------------------------------*/
//					New COM Port API		July, 2007				//
/*------------------------------------------------------------------*/
void Ver_COMLib(char *vstr);

CHAR SIO_Open(UCHAR i_ucPort);
//Return Value:
//      On success, return 0
//      On error, return -1
CHAR SIO_Close(UCHAR i_ucPort);
//Return Value:
//      On success, return 0
//      On error, return -1
CHAR SIO_SetState(UCHAR i_ucPort, ULONG i_ulBaudRate, UCHAR i_ucParity, UCHAR i_ucDataBits, UCHAR i_ucStopBits);
//Argument:
//      i_ulBaudRate    COM baudrate setting                            
//      i_ucParity      NO_PARITY(0x00), ODD_PARITY(0x08), EVEN_PARITY(0x18)                                    
//      i_ucDataBits    COM format setting                             
//                      Items: DATA5(0x00), DATA6(0x01), DATA7(0x02), DATA8(0x03)              
//      i_ucStopBits    COM stop bits setting                          
//                      Items: STOP1(0x00), STOP2(0x04)                            
//Return Value:
//      On success, return 0
//      On error, return -1
INT SIO_RecvBytes(UCHAR i_ucPort, UCHAR i_ucMode, UINT i_uinBytes, UCHAR * o_ucDataBuf);
//Description:
//      When Block_Mode, program will block here until nBytes data is received
//      When UnBlock_Mode, program will not block and return the total number of
//      bytes data have been received.
//Argument:
//      i_ucMode        Block_Mode(0x01), UnBlock_Mode(0x02)                            
//      i_uinBytes      number of bytes to be read                                    
//      o_ucDataBuf     Buffer for received data                          
//Return Value:
//      On success, return the number of bytes data return
//      On error, return -1
INT SIO_GetAvaiRecvBytes(UCHAR i_ucPort);
//Return Value:
//      On success, return the number of bytes data in input buffer
//      On error, return -1
INT SIO_SendBytes(UCHAR i_ucPort, UINT i_uinBytes, UCHAR * i_ucDataBuf);
//Argument:                          
//      i_uinBytes      number of bytes to be sent                                    
//      i_ucDataBuf     A buffer for data to be sent         
//Return Value:
//      On success, return the number of bytes data have been sent
//      On error, return -1
CHAR SIO_PurgeBuf(UCHAR i_ucPort, UCHAR i_ucFlag);
//Argument:                          
//      i_ucFlag    
//                  Clear_RXBuffer(0x01): Clear input buffer and receive FIFO
//                  Clear_TXBuffer(0x02): Clear output buffer and send FIFO     
//Remarks:  User can clear input buffer and output buffer together with argument Clear_RXBuffer|Clear_TXBuffer
//Return Value:
//      None
INT SIO_GetAvaiSendBuf(UCHAR i_ucPort);
//Return Value:
//      On success, return the number of remaining available bytes space in output buffer 
//      On error, return -1

UINT SIO_MakeCheckSum(UCHAR * i_ucDataBuf, UINT i_uiLen);
UINT SIO_MakeCRC16(UCHAR * i_ucDataBuf, UINT i_uiLen);
CHAR SIO_Carrier(UCHAR i_ucPort);
CHAR SIO_ClearBreak(UCHAR i_ucPort);
CHAR SIO_SetBreak(UCHAR i_ucPort);
CHAR SIO_GetLineStatus(UCHAR i_ucPort);
CHAR SIO_GetModemStatus(UCHAR i_ucPort);
CHAR SIO_LowerRaise_RTS_DTR(UCHAR i_ucPort, UCHAR i_ucL_R_Mode, UCHAR i_ucSignal);
//Description: Lower or raise the RTS/DTR signal
//Argument:                          
//      i_ucL_R_Mode    RaiseSignal(0x01), LowerSignal(0x02)
//      i_ucSignal      Signal_RTS(0x01), Signal_DTR(0x02)
//Return Value:
//      None
CHAR SIO_SetLineParams(UCHAR i_ucPort, UCHAR i_ucParams);
CHAR SIO_ModemAutoanswer(UCHAR i_ucPort);
CHAR SIO_ModemCommand(UCHAR i_ucPort, UCHAR * i_ucCmdStr);
CHAR SIO_ModemCommand_State(UCHAR i_ucPort);
CHAR SIO_ModemDial(UCHAR i_ucPort, UCHAR * i_ucTelenum);
CHAR SIO_ModemHandup(UCHAR i_ucPort);
CHAR SIO_ModemInitial(UCHAR i_ucPort);

#endif
