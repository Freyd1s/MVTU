/*---------------------------------------------------- */
//Revised History of Utility.Lib:
//      V1.02   Modify timer tick to meet sntp time resolution
/*---------------------------------------------------- */
#include "socket.h"

#define DefaultNTPPort 123

#ifndef ADAMVARS
typedef int bool;
typedef char CHAR;
typedef short SHORT;
typedef int INT;
typedef long LONG;
typedef unsigned char UCHAR;
typedef unsigned short USHORT;
typedef unsigned int UINT;
typedef unsigned long ULONG;

typedef unsigned long INT32;
typedef unsigned short INT16;
#endif



//The Time Structure
typedef struct AdamTime
{
    WORD wYear;
    WORD wMonth;
    WORD wDay;
    WORD wDayOfWeek;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
    WORD wMicroseconds;
}AdamTime;

typedef struct CNtpTimePacket
{
    DWORD m_dwInteger;
    DWORD m_dwFractional;
}CNtpTimePacket;

typedef struct NtpBasicInfo
{
    BYTE m_LiVnMode;
    BYTE m_Stratum;
    CHAR m_Poll;
    CHAR m_Precision;
    LONG m_RootDelay;
    LONG m_RootDispersion;
    CHAR m_ReferenceID[4];
    struct CNtpTimePacket m_ReferenceTimestamp;
    struct CNtpTimePacket m_OriginateTimestamp;
    struct CNtpTimePacket m_ReceiveTimestamp;
    struct CNtpTimePacket m_TransmitTimestamp;
}NtpBasicInfo;

/*--Response Packet from NTP Server---*/
typedef struct NtpServerRespPKT
{
    ULONG m_nLeapIndicator;
    ULONG m_nStratum; 
    
    struct CNtpTimePacket     m_OriginateTime;    
    struct CNtpTimePacket     m_ReceiveTime;      
    struct CNtpTimePacket     m_TransmitTime;     
    struct CNtpTimePacket     m_DestinationTime;  
    double m_RoundTripDelay;   
    double m_LocalClockOffset; 
}NtpServerRespPKT;


CHAR SNTP_Init(CHAR *TimeZone);
//Description:
//      Initialize needed resource of SNTP. This function only be called one time
//      before program starts. DO NOT call this function before everytime you call
//      GetServerTime().
//Argument:
//      TimeZone        USA Pacific: (PST8PDT); Taiwan: (UCT-8); Singapore: (UCT-8);
//                      China: (CST-8); Germany: (MEZ-1MESZ); Japan: (JST)
//                      These timezone is provided for reference purpose.                        
//Return Value:
//      On success, return 0
//      On error, return -1


CHAR GetServerTime(CHAR* i_ucServer, WORD i_usPort, NtpServerRespPKT *Resp, INT WaitMilliSec);
//Description:
//      Get NTP server time.
//Argument:
//      i_ucServer      IP Address
//      i_usPort        Server Port;  Default NTP port is 123(DefaultNTPPort).
//      Resp            Response packet from NTP server.       
//      WaitMilliSec    Timeout
//Return Value:
//      On success, return 0
//      On error, return -1
//		Timeout Error, return -2

void Convert2TimeStruct(AdamTime *TStruct, CNtpTimePacket *A);
//Description:
//      Convert the UDP/TIME representation to AdamTime structure
//Argument:
//      TStruct      AdamTime Structure
//      A        CNTPTimePacket Structure                  
//Return Value:
//      None

void Ver_SNTP(char *vstr);
//Description:
//      SNTP library version.
