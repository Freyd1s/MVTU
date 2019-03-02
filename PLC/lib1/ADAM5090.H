//----------------------------------------------------------------
//Revised History:
//	None
//Current Ver: A1.10
//----------------------------------------------------------------

//1999-11-02

#define ADAM5090 	0x1f
#define UseTimer 	0x01

//Define Return Constant
#define FALSE   0
#define TRUE    !FALSE

//Register Offset Address
//Standard Register
#define	THR_90	9
#define	RHR_90	9
#define IER_90	10
#define	FCR_90	11
#define	ISR_90	11
#define	LCR_90	12
#define	MCR_90	13
#define	LSR_90	14
#define	MSR_90	15
#define	SPR_90	7
//Additional Standard Register
#define	DLL_90	9
#define	DLM_90	10

//954 Mode Specific Register

#define ASR_90	9
#define RFL	12	//Read The Number Of Chars In The Receiver FIFO
#define TFL	13	//Read The Number Of Chars In The Tranmitter FIFO
#define	ICR_90	14
//Index Control Register
#define	ACR		0
#define	CPR		1
#define	TCR		2
#define	TTL		4
#define	RTL		5
#define	FCL		6
#define	FCH		7
#define	ID1		8	//Fixed Value : 0x16
#define	ID2		9	//Fixed Value : 0xC9    16C954
#define	ID3		10	//Fixed Value : 0x54
#define	REV		11
#define	CSR		12


//IER Register Bit
#define	Int_Modem	0x08
#define Int_RxStat	0x04
#define	Int_THRE	0x02
#define	Int_RxRDY	0x01

//FCR Register Bit
#define	Flush_THR	0x04
#define	Flush_RHR	0x02
#define	FIFO_en		0x01

//LCR Register Bit
#define	DLAB		0x80
#define	Tx_Break	0x40

//MCR Register Bit
#define Flow_Ctrl	0x20
#define	Loop_Back_90	0x10
#define	OUT2_90		0x08
#define OUT1_90		0x04
#define	RTS_90		0x02
#define	DTR_90		0x01

//LSR Register Bit
#define ALLERRS		0x9E
#define	Data_Err	0x80
#define Tx_Empty	0x40
#define THR_Empty	0x20
#define Rx_Break	0x10
#define	Fram_Err	0x08
#define Parity_Err	0x04
#define OverRun_Err	0x02
#define RxRDY		0x01

//MSR Register Bit
#define DCD		0x80
#define RI		0x40
#define DSR		0x20
#define CTS		0x10
#define D_DCD		0x08
#define D_RI		0x04
#define D_DSR		0x02
#define D_CTS		0x01

//PORT_NUM Definition
#define PORT01	01
#define port01	01
#define PORT02	02
#define port02	02
#define	PORT03	03
#define port03	03
#define	PORT04	04
#define port04	04
#define PORT11	11
#define port11	11
#define PORT12	12
#define port12	12
#define	PORT13	13
#define port13	13
#define	PORT14	14
#define port14	14
#define PORT21	11
#define port21	21
#define PORT22	22
#define port22	22
#define	PORT23	23
#define port23	23
#define	PORT24	24
#define port24	24
#define PORT31	31
#define port31	31
#define PORT32	32
#define port32	32
#define	PORT33	33
#define port33	33
#define	PORT34	34
#define port34	34
#define PORT41	41
#define port41	41
#define PORT42	42
#define port42	42
#define	PORT43	43
#define port43	43
#define	PORT44	44
#define port44	44
#define PORT51	51
#define port51	51
#define PORT52	52
#define port52	52
#define	PORT53	53
#define port53	53
#define	PORT54	54
#define port54	54
#define PORT61	61
#define port61	61
#define PORT62	62
#define port62	62
#define	PORT63	63
#define port63	63
#define	PORT64	64
#define port64	64
#define PORT71	71
#define port71	71
#define PORT72	72
#define port72	72
#define	PORT73	73
#define port73	73
#define	PORT74	74
#define port74	74

//Command Decode Address
#define MODULE_ID	0x01
#define PORT_SEL	0x01
#define PORT_INT	0x02

//1999-11-04 Nick
//Reserved for when the UART down then CPU can
//use this command to reset(hardware reset) the UART
//outportb(base+0x03,XX)	XX:Any Value
#define UART_RST	0x03
//1999-11-04 Nick

//1999-11-09 Nick
#define SLOT_NO		8
#define PORT_NO		4
//1999-11-09 Nick

//Extern Global Variable
extern unsigned long Installed_PORT_Flag;
extern int  Int_Flag;
extern int  Addr[SLOT_NO];

extern int  slot(int);
extern int  port(int);
extern unsigned long  port_mask(int);
extern int  par_chk(int);
extern void port_select(int);

extern int  port_install(int);
extern int  port_deinstalled(int);
extern void port_reset(int);
extern void reset_slot(int);

extern int  port_carrier(int);
extern void port_clear_local_loopback(int);
extern void port_set_local_loopback(int);
extern int  port_get_modem_status(int);
extern void port_set_break(int);
extern void port_clear_break(int);
extern void port_raise_dtr(int);
extern void port_lower_dtr(int);
extern void port_raise_rts(int);
extern void port_lower_rts(int);

extern void port_disable_fifo(int);
extern int  port_enable_fifo(int);
extern int  port_read_scratch_register(int,int);
extern int  port_write_scratch_register(int,int,int);
extern int  port_get_line_status(int);
extern int  port_set_line_params(int,int);
extern void port_set_parity(int,int,int);
extern void port_set_format(int,int,int,int);
extern void port_set_speed(int,long);
extern void port_set_int(int,int);

extern char port_rx(int);
extern void port_tx(int,char);
extern void port_tx_string(int,char *);
extern int  port_RFIFO(int);
extern int  port_TFIFO(int);
extern int  port_tx_empty(int);
extern int  port_rx_ready(int);
extern int  port_rx_error(int);
extern void port_flush_rx(int portno);//arthur.hsu
extern void port_flush_tx(int portno);

extern int  which_has_been_installed(void);
extern int  port_get_int_status(int);
extern int  port_get_modem_control_status(int);
extern int  port_set_modem_control_params(int,int);


//Modem I/O 1999-12-17 Nick
extern void modem_command_90(int,char *);
extern void modem_initial_90(int);
extern void modem_handup_90(int);
extern void modem_autoanswer_90(int);
extern void modem_command_state_90(int);
extern void modem_dial_90(int,char *);
//Modem I/O 1999-12-17 Nick

void Ver_5090(char *vstr);	//Version

//Global Variables
extern int  Addr[SLOT_NO];
extern int  Int_Flag;
extern int  now_port,now_base,now_portno;

#if UseTimer==1
	///////////////////////////////////////////////
	#define TIMER1VECT	0x12
	#define EOI_REG		0xFF22
	#define TIMER1_CTRL_REG 0xFF5E
	#define TIMER1_MAXA_REG	0xFF5A
	#define TIMER1_MAXB_REG	0xFF5C
	#define TIMER1_CNT_REG	0xFF58
	#define IN_SER_REG	0xFF2C
	#define MASK_REG	0xFF28
	#define MAX_TIMER	10

	extern void TimerSetVector(void (far interrupt *)());
	extern void far interrupt Timer_IRQ_90(void);
	extern int  Timer_Init_90(void);
	extern int  Timer_Set_90(unsigned int);
	extern void Timer_Reset_90(int);
	extern int  Timer_Stop_90(void);
	///////////////////////////////////////////////
	extern int  Timer_Flag;
	extern int  Timer_MAX_NO;
	extern int  Timer_MAX_CNT[MAX_TIMER];
	extern int  Timer_CNT[MAX_TIMER];
	extern int  Timer_ARRIVER_CNT[MAX_TIMER];
	extern void interrupt (*old_ISR)();

#endif
