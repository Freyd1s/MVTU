//  $Id: HTAPIC.H 1.10 2004/01/22 15:49:32 johnb Exp $
//
//  *** DO NOT REMOVE THE FOLLOWING NOTICE ***
//
//  Copyright (c) 1999-2003 Datalight, Inc.
//  All Rights Reserved
//
//  Datalight, Inc. is a Washington corporation located at:
//
//  21520 30th Dr SE, Suite 110,          Tel: +1.425.951.8086
//  Bothell, WA  98021                    Fax: +1.425.951.8094
//  USA                                   Http://www.datalight.com
//
//  This software, including without limitation all source code and
//  documentation, is the confidential, trade secret property of
//  Datalight, Inc., and is protected under the copyright laws of
//  the United States and other jurisdictions.  Portions of the
//  software may also be subject to one or more the following US
//  patents: US#5860082, US#6260156.
//
//  In addition to civil penalties for infringement of copyright
//  under applicable U.S. law, 17 U.S.C. 1204 provides criminal
//  penalties for violation of (a) the restrictions on circumvention
//  of copyright protection systems found in 17 U.S.C. 1201 and
//  (b) the protections for the integrity of copyright management
//  information found in 17 U.S.C. 1202.
//
//  U.S. Government Restricted Rights.  Use, duplication,
//  reproduction, or transfer of this commercial product and
//  accompanying documentation is restricted in accordance with
//  FAR 12.212 and DFARS 227.7202 and by a License Agreement.
//
//  IN ADDITION TO COPYRIGHT AND PATENT LAW, THIS SOFTWARE IS
//  PROTECTED UNDER A SOURCE CODE AGREEMENT, NON-DISCLOSURE
//  AGREEMENT (NDA), OR SIMILAR BINDING CONTRACT BETWEEN DATALIGHT,
//  INC. AND THE LICENSEE ("BINDING AGREEMENT").  YOUR RIGHT, IF ANY,
//  TO COPY, PUBLISH, MODIFY OR OTHERWISE USE THE SOFTWARE,IS SUBJECT
//  TO THE TERMS AND CONDITIONS OF THE BINDING AGREEMENT, AND BY
//  USING THE SOFTWARE IN ANY MANNER, IN WHOLE OR IN PART, YOU AGREE
//  TO BE BOUND BY THE TERMS OF THE BINDING AGREEMENT.  CONTACT
//  DATALIGHT, INC. AT THE ADDRESS SET FORTH ABOVE IF YOU OBTAINED
//  THIS SOFTWARE IN ERROR.
//
/*
	$DOCFILE:HTAPIC.H

	Copyright (C) 1999-2001 Datalight, Inc.
	All Rights Reserved

	HTTP API header file

	$DOCHISTORY:

	2003-11-29	gvn  implement RET_GET
	2003-05-19	gvn  add status returns
	2001-05-11	GPvN cleanup
	2000-05-18	GVvN first version
 */

//api functions (set in AH when api called)
#define APIF_REGISTER	0
#define APIF_DEREGISTER	1
#define APIF_GETDATA		2
#define APIF_SENDDATA	3
#define APIF_SENDFILE	4
#define APIF_GETVERSION	5
#define APIF_GETSTATUS	6

// flags
#define F_OVERLAP		1	//indicates multiple requests at a time
#define F_ENV			2	//indicates environment headers will be provided with upcalls

/* Error return code
	Note that the NEGATED value will be returned on error
*/
#define NONE			0	/* No error */
#define NO_ERR			0	/* No error */
#define OK				0	/* No error */
#define CON_EXISTS	1	/* Connection already exists */
#define NO_CONN		2	/* Connection does not exist */
#define CON_CLOS		3	/* Connection closing */
#define NO_SPACE		4	/* No memory */
#define WOULDBLK		5	/* Would block */
#define NOPROTO		6	/* Protocol or mode not supported */
#define INVALID		7	/* Invalid arguments */
#define BUFSHORT		8	/* Buffer too short for data */
#define BADFILENAME	9	/* cant open file */
#define NO_USER		11 /* User doesnt exist */
#define ERR_DUPL	 	10 /* duplicate name (name already exists) */
#define RE_ENTER		27	/* Re-entry of Inet */
#define NO_API			50	/* API not loaded or invalid api call */


// http request types
#define RQ_NONE	0		// unknown
#define RQ_GET  	1     // get
#define RQ_POST	2		// post
#define RQ_CGI		3		// cgi
#define RQ_REMCON	4		// remote console
#define RQ_PUT    5     // put

// callback:
// parameters
typedef struct HTTP_PARAMS_S
{
	int iReason;
	int iHandle;		//handle for request
	long dwUserID;   	//user defined ID (set at register)
	long dwSessionID; //per connection ID, set at any upcall by user
	int iValue;
	long lContentLen;
	char far *szQuery;
	char far* far* ppEnv;		//the environment (headers, ip address, etc)
	int iEnvSize;     //number of entries in environment
} HTTP_PARAMS;

// function
// int (far *pfCallback)(HTTP_PARAMS far *psHttpParams);

// return values:
#define RET_OK 	0	//give me more upcalls
#define RET_DONE  1	//done, dont want any more data
#define RET_GET	2	//done CGI function, handle as normal GET
#define RET_ERR	-1	//I experienced an error

// status return bits
#define RETS_SENDING		0x100
#define RETS_RECEIVING 	0x200
// cgi
// reasons (iReason one of)
#define R_NEWREQ	0	//new request
#define R_INDATA	1	//may read data
#define R_OUTDATA	2 	//may transmit data
#define R_ENDDATA 3	//end of stream reached
#define R_CLOSED	4	//connection closed

