#include "cgiadap.h"

typedef int bool;
#define	TRUE		0x01
#define	FALSE		0x00

bool Http_Server_Reg(char * Reg_Name);
int far Callback(HTTP_PARAMS far* psParams);