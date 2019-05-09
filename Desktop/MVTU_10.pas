unit MVTU_10;

interface

uses												//���������� ���������� ��������� modbus TCP/IP client
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, buttons,
  IdTCPClient, ExtCtrls, ComCtrls, IdModbusClient, IdException, Types, Math;

const
  Cadr_Size = 31;     								//������ ������ ������ ������� - 31 �������

type
  Tfrmmain = class(TForm)
    stopbutton: TButton;
    Timer2: TTimer;
    Err_label: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    rrg1inedit: TEdit;
    rrg2out: TEdit;
    rrg1outedit: TEdit;
    rrg2outedit: TEdit;
    rrg2inedit: TEdit;
    rrg1out: TEdit;
    rrg2max: TEdit;
    rrg1max: TEdit;
    valve6button: TButton;
    rrg1okbutton: TButton;
    Archeckbox: TCheckBox;
    rrg2okbutton: TButton;
    rrg2offbutton: TButton;
    rrg1offbutton: TButton;
    NOcheckbox: TCheckBox;
    valve4button: TButton;
    Valve5button: TButton;
    Valve3button: TButton;
    valve1button: TButton;
    valve2button: TButton;
    rrgradiogroup: TRadioGroup;
    rrg2controledit: TEdit;
    rrg1controledit: TEdit;
    pressureradiogroup: TRadioGroup;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    edtIPAddress: TEdit;
    readbutton: TButton;
    ERR_Memo: TMemo;
    Panel1: TPanel;
    FV_Button: TButton;
    VV_button: TButton;
    Auto_vacuum_checkbox: TCheckBox;
    Label10: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    FV_timeedit: TEdit;
    Razgon_VV_timeedit: TEdit;
    VV_timeedit: TEdit;
    Ostanov_VV_timeedit: TEdit;
    Label5: TLabel;
    label2: TLabel;
    label3: TLabel;
    label_TMN: TLabel;
    apgedit: TEdit;
    wrgedit: TEdit;
    TMN_progressbar: TProgressBar;
    apglabel: TLabel;
    wrglabel: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    TabSheet2: TTabSheet;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    writeregedit: TEdit;
    Writebutton: TButton;
    Writedataedit: TEdit;
    Timer_Button: TButton;
    PLC_close_Button: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Auto_Produv_CheckBox: TCheckBox;
    mctPLC: TIdModBusClient;
    Left_Label: TLabel;
    Right_Label: TLabel;
    Produv_label: TLabel;
    Produv_edit: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox1: TGroupBox;
    Go_Right_Btn: TBitBtn;
    Go_Left_Btn: TBitBtn;
    Shd_stop_button: TButton;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Shd_position_Edit: TEdit;
    Shd_move_Button: TButton;
    Step_right_Btn: TBitBtn;
    Step_left_Btn: TBitBtn;
    Shd_step_edit: TEdit;
    GroupBox3: TGroupBox;
    shd_button: TButton;
    shd_edit: TEdit;
    Pgm_Rcv_memo: TMemo;
    Label15: TLabel;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    Minus_BitBtn1: TBitBtn;
    Plus_BitBtn1: TBitBtn;
    servo1_edit: TEdit;
    servo1_button: TButton;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    pressureradiogroup2: TRadioGroup;
    Label17: TLabel;
    Label24: TLabel;
    apglabel2: TLabel;
    wrglabel2: TLabel;
    apgedit2: TEdit;
    wrgedit2: TEdit;
    GroupBox6: TGroupBox;
    Minus_BitBtn2: TBitBtn;
    Plus_BitBtn2: TBitBtn;
    servo2_edit: TEdit;
    servo2_button: TButton;
    GroupBox7: TGroupBox;
    Label30: TLabel;
    Shd_scan_Edit: TEdit;
    Shd_stop_button2: TButton;
    GroupBox8: TGroupBox;
    Shd_speed_RadioGroup: TRadioGroup;
    Shd_speed_range_label: TLabel;
    Shd_speed_Label: TLabel;
    Shd_speed_edit: TEdit;
    Shd_accel_range_label: TLabel;
    Shd_accel_edit: TEdit;
    Shd_accel_Label: TLabel;
    Shd_scan_button: TButton;
    Memo6: TMemo;
    Label23: TLabel;
    Label26: TLabel;
    cvmedit2: TEdit;
    cvmlabel2: TLabel;
    Label27: TLabel;
    cvmedit: TEdit;
    cvmlabel: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Timer_2Button: TButton;
    Label33: TLabel;
    Label34: TLabel;
    produv_time_Edit: TEdit;
    Label35: TLabel;
    Panel6: TPanel;
    Label36: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Button7: TButton;
    procedure readbuttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure valve1buttonClick(Sender: TObject);
    procedure valve2buttonClick(Sender: TObject);
    procedure Valve3buttonClick(Sender: TObject);
    procedure valve4buttonClick(Sender: TObject);
    procedure Valve5buttonClick(Sender: TObject);
    procedure valve6buttonClick(Sender: TObject);
    procedure rrg2offbuttonClick(Sender: TObject);
    procedure rrg1offbuttonClick(Sender: TObject);
    procedure ArcheckboxClick(Sender: TObject);
    procedure NOcheckboxClick(Sender: TObject);
    procedure rrg2okbuttonClick(Sender: TObject);
    procedure rrg1okbuttonClick(Sender: TObject);
    procedure stopbuttonClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure rrgradiogroupClick(Sender: TObject);
    procedure pressureradiogroupClick(Sender: TObject);
    procedure FV_ButtonClick(Sender: TObject);
    procedure VV_buttonClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Err_labelClick(Sender: TObject);
    procedure Auto_vacuum_checkboxClick(Sender: TObject);
    procedure servo1_buttonClick(Sender: TObject);
    procedure WritebuttonClick(Sender: TObject);
    procedure Timer_ButtonClick(Sender: TObject);
    procedure PLC_close_ButtonClick(Sender: TObject);
    procedure shd_buttonClick(Sender: TObject);
    procedure Auto_Produv_CheckBoxClick(Sender: TObject);
    procedure Minus_BitBtn1Click(Sender: TObject);
    procedure Plus_BitBtn1Click(Sender: TObject);
    procedure Shd_stop_buttonClick(Sender: TObject);
    procedure Go_Right_BtnClick(Sender: TObject);
    procedure Go_Left_BtnClick(Sender: TObject);
    procedure Shd_speed_RadioGroupClick(Sender: TObject);
    procedure Shd_move_ButtonClick(Sender: TObject);
    procedure Step_left_BtnClick(Sender: TObject);
    procedure Step_right_BtnClick(Sender: TObject);
    procedure Shd_stop_button2Click(Sender: TObject);
    procedure Shd_scan_buttonClick(Sender: TObject);
    procedure Minus_BitBtn2Click(Sender: TObject);
    procedure Plus_BitBtn2Click(Sender: TObject);
    procedure servo2_buttonClick(Sender: TObject);
    procedure pressureradiogroup2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_2ButtonClick(Sender: TObject);
    procedure shd_home_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{	������������ ����������:
	��� - ���������� ������� ����
	��� - ����������������� �����
	��� - ������������ �����
	�� - ������������
	�� - ���������������
	�� - ������� ���������
	�� - ���������� ��������
	�� - ���������� ����������
	�� - ���������� ��������
	�� - ���������� ����������
	��� - ��������������� ���������� ����������
	TIC - ���������� ���������� ���������� �������� � �������� �������}

//========================================== ������������� ���������� ==============================================
  
  TCadr = array [0..Cadr_Size] of Word;				//���: ������ ������� ������ ������ �������

var
  frmmain: Tfrmmain;								//�����-���������
  Share_Mem: TCadr;									//������ ������ �������
  File_mem: File of Tcadr;							//������ ������ ��� ������ � ����
  Offset_cmd: byte = 21;							//����� �������� � �������� ���������� ��������, ������������
													//�������� �� ������
  
//------------------------------------------ �������� ������ ������ ���: Word --------------------------------------

//| ���������� �������� | ����� ������ ������� ��������� | ----------------------- �������� ----------------------- | 
	R_Quants,			//				1					������� ��������� ���������
						//				2					���������� ������ � TIC (������� ���)
						//				3					�������� � ���������� APG
						//				4					�������� � ���������� WRG
	R_ac_MFC1,			//				5					����� ������������� ����� ���1
	R_ac_MFC2,			//				6					����� ������������� ����� ���2
						//				7					�������� � ���������� CVM
						//				14					����� ��� �������� ������ ����� COM-����
	rg_dc,				//				16					������� �������� ��
	error_buf,			//				18					����� ������
						//				20					��������� ����� ������/������ (��� ������ ������ �� ������
						//									���������� �� 0 ��������, ������ ��� ���������� ������ �� 0)
	Cmd_Word,			//				21					����� ������� ��� ����������
	Dop_Cmd,			//				22					�������� �������
	au_MFC1,			//				23					������� ������ ������������� ����� ���1
	au_MFC2,			//				24					������� ������ ������������� ����� ���2
	au_Shd_speed,		//				25					�������� �������� ��
	au_Shd_accel,		//				26					��������� �������� ��
	rg_du, 				//				27					������� ��
	au_servo1,			//				28					��������� ������������ ��������
	au_servo2:Word;		//				29					��������� ������������ ���������������
	
//========================================== ���������� ��������� � �������� ��������� ��������� �1 ================
//
// ����� ���� | �������	--------------------------------------------------------------------------------------------
//		1		�� �������
//		2		�� �������
//		3		������ ���
//		4		���������� ���
//		5		������ ���� ����� ���1
//		6		������ ���� ����� ���2
//		7		������ ������� �������
//		8		�������� �������� ����� COM-���� 1
//------------------------------------------------------------------------------------------------------------------

//========================================== �������� ������, ���������� � �������� �22,23 =========================
//
// �������� �������� 22 | �������� �������� 23 | ��������� �������� ������ | ---��������----------------------------
//			1		 				1				FV_ButtonClick				������ �� ������
//									2				VV_ButtonClick				������ �� ������
//			2						1				FV_ButtonClick				���������� �� ������
//									2				VV_ButtonClick				���������� �� ������
//			3										rrg1okbuttonClick			������� ������� ���� ����� ���1
//													rrg1offbuttonClick			������� ���1
//			4										rrg2okbuttonClick			������� ������� ���� ����� ���2
//													rrg2offbuttonClick			������� ���2
//          5						1-6				valve1buttonClick			��������/�������� �������
//          6						0-4379			servo1_buttonClick			�������� ��������� �������������� ��������
//													Minus_BitBtn1Click			��������� �� 1 ������ �� ������� �������
//													Plus_BitBtn1Click			��������� �� 1 ������ ������ �������
//          7						0-4379			servo2_buttonClick			�������� ��������� �������������� ���������������
//													Minus_BitBtn2Click			��������� �� 1 ������ �� ������� �������
//													Plus_BitBtn2Click			��������� �� 1 ������ ������ �������
//          51						?				shd_buttonClick				��������� ������� � �������� ����� ASCII
//																				����� COM-���� ��� 
//          52						1				Go_Right_BtnClick			���������� ������� �� �� ������� �������
//									2				Go_Left_BtnClick			��������� ������� �� ������ �������
//          53										Shd_stop_buttonClick		���������� ��
//													Shd_stop_button2Click		���������� ������ ���������� ��
//          54						0-800			Shd_move_ButtonClick		����������� �� �� �������� ����������
//          55						?				Step_right_BtnClick			����������� �� �� �������� ����� ����� �� �������
//          56						?				Step_left_BtnClick			����������� �� �� �������� ����� ����� ������ �������
//          57						?				Shd_scan_buttonClick		����������� �������� �� �� �������� �������
//          58                    shd_home_ButtonClick    ������� � ��������� HOME
//          100										PLC_close_ButtonClick		���������� ������ ���������
//          10/20									Auto_vacuum_checkboxClick	���./����. �������������� �������
//          30/40									Auto_Produv_CheckBoxClick	���./����. �������������� �������� ������� �����
//          1000									stopbuttonClick				��������� ��������� �������
//------------------------------------------------------------------------------------------------------------------
//
//========================================== ���������� ������ � ������ ������ �18 =================================
//
// ������ ��������� �� ������� --------------------------------------------------------- ����� ���� � �������� -----
err_msg: array[0..5] of string =
								('������ ����������� TIC',							//				
								'���������� ��������� APG',							//				0
								'�������� ���� ����������',							//				1
								'������ ������',									//				2
								'���� ������������� �������',						//				3
								'��� ���� ��� ����������'							//				4
								);

//------------------------------------------ ��������������� ����� ��� ��������� �������� � ���������� -------------
masckon : array [0..15] of Word = (1, 2, 4, 8, 16, 32, 64, 128, 256,
512, 1024, 2048, 4096, 8192, 16384, 32768);
masckoff : array [0..15] of Word = (65534, 65533, 65531, 65527, 65519, 65503,
65471, 65407, 65279, 65023, 64511, 63487, 61439, 57343, 49151, 32767);

//------------------------------------------ ����� 1/0 -------------------------------------------------------------
Tick_Write: boolean = False;            			//������ ���� ������ ������ �� ������?
Produv_flag:boolean=false;              			//�������� ������ ������� �����?

//------------------------------------------ �������� --------------------------------------------------------------
WorkTime: word = 0;									//����� ������ ���������
Produv_time,										//����� ������ �������� ������
fv_time,											//����� ������ ������ ��
vv_time,											//����� ������ ������ ��
razgon_time,										//����� ������ ������� ���
ostanov_time: word;									//����� ������ ���������� ���
Pgm_Rcv_line: byte = 0;								//������� ����� ������ � Pgm_Rcv_memo (���� ����������� ��������, ����������
													//��� ����� COM-���� �� ����������� ��)

//------------------------------------------ ����������, ������������ ��� ��������� ��������� �� �����-����� -------										
  type valvegrid=array[1..14] of boolean;         	//���: ������ ��������� ��������� � ��������� �������:
													//1-6 ��������� �������� 1-6
													//7-8 ��������� ��� 1-2
													//9-10 �������� �� ��������� ����� � ������� ����� (AR,NO checkbox)
													//11-12 �������� ������� ���, ���
													//13-14 ������/���������� ���

//---------------------------- ��������������� ��������� ��� ��������� �����-����� � ��������� ��������� -----------
  procedure drawstream(a:valvegrid);     								//���������� ��������� ������� �������
  procedure drawvacuum(a:valvegrid);									//���������� ��������� ��������� ���������
  procedure draw() ;                     								//���������� ����������� ���������
  procedure drawlines(IM:timage; x1,y1,x2,y2,w,cl : integer) ;			//���������� �����
  procedure drawgaslines(IM:timage; x1,y1,x2,y2,w,cl :integer);			//���������� ��������� ������� �����
  procedure drawarrow(x1,y1:integer) ;									//��������� ���������
  procedure drawhvalve(IM:timage; x1,y1:integer);						//���������� ������������� �������������� �������
  procedure drawvvalve(IM:timage; x1,y1:integer);						//���������� ����������� �������������� �������
  procedure rounddraw(IM:timage; x1,y1,x2,y2,num:integer; ar:valvegrid);//���������� ��������
  procedure drawgauge(x1,y1:integer);									//���������� ������� ��������
  procedure drawPiranigauge(x1,y1:integer);								//���������� ������� �������� ������
  procedure piedraw(ugol:word);											//���������� ������� (��������� ��������)
  procedure drawflange(IM:timage);										//���������� ������� ������ ������
  procedure karuseldraw(ugol:word);										//���������� ��������� �����������������-��������
  
 //----------------------------------------- ������ ��������������� ��������� --------------------------------------
  procedure shd_speed_refresh();										//���������� ���������� au_Shd_speed
  procedure shd_accel_refresh();										//���������� ���������� au_Shd_accel
  function timeinput(t:word):string;									//������� ������� � �������� � ������ ��� �����������

implementation

var
drawarray:valvegrid;													//���������� - ������ ��������� �������

{$R *.dfm}

{======================================= ��������� ��������� �����-����� � ��������� ��������� ====================}

//--------------------------------------- ���������� ����� ---------------------------------------------------------
procedure drawlines(IM:timage; x1,y1,x2,y2,w,cl : integer);				//������ �������� �������� TImage, ���������� 
begin																	//������ � ����� �����, ������ � ���� �����
  with frmmain do
  begin
  Im.Canvas.Pen.Width:=w;
  Im.Canvas.Pen.color:=cl;
  im.Canvas.MoveTo(x1,y1);
  Im.Canvas.LineTo(x2,y2);
  end;
end;
//--------------------------------------- ���������� ��������� (->) ------------------------------------------------
procedure drawarrow(x1,y1 : integer);									//������ ���������� �������
begin
  frmmain.Image1.Canvas.Pen.Width:=2;									
  frmmain.Image1.Canvas.Pen.color:=clblack;
  frmmain.image1.Canvas.MoveTo(x1,y1);									//		__\
  frmmain.Image1.Canvas.LineTo(x1-10,y1-10);							//		  /
  frmmain.image1.Canvas.MoveTo(x1,y1);
  frmmain.Image1.Canvas.LineTo(x1-10,y1+10);
end;
//--------------------------------------- ���������� ��������������� ������� ---------------------------------------
procedure drawhvalve(IM:timage; x1,y1:integer);							//������ ���������� ������������ �������
begin
  with frmmain do
  begin
  drawlines(im,x1,y1-13,x1,y1+13,2,0);									//		 __
  drawlines(im,x1,y1-13,x1+52,y1+13,2,0);								//		|__|
  drawlines(im,x1+52,y1-13,x1+52,y1+13,2,0);							//		 ||
  drawlines(im,x1+52,y1-13,x1,y1+13,2,0);								//		|\/|
  drawlines(im,x1+22,y1-26,x1+22,y1-2,2,0);								//		|/\|
  drawlines(im,x1+30,y1-26,x1+30,y1-2,2,0);
  im.Canvas.Brush.color:=clwhite;
  im.canvas.Rectangle(x1+13,y1-52,x1+39,y1-26);
  end;
end;
//--------------------------------------- ���������� ������������� ������� -----------------------------------------
procedure drawvvalve(IM:timage; x1,y1:integer);							//������ ���������� ������������ �������
begin
  with frmmain do
  begin
  drawlines(im,x1-13,y1,x1+13,y1,2,0);									//
  drawlines(im,x1-13,y1,x1+13,y1+52,2,0);								//		 -- _|\ /|
  drawlines(im,x1-13,y1+52,x1+13,y1+52,2,0);							//		|  |_| | |
  drawlines(im,x1-13,y1+52,x1+13,y1,2,0);								//		 --  |/ \|
  drawlines(im,x1-26,y1+22,x1-2,y1+22,2,0);								//			
  drawlines(im,x1-26,y1+30,x1-2,y1+30,2,0);
  im.Canvas.Brush.color:=clwhite;
  im.canvas.Rectangle(x1-52,y1+13,x1-26,y1+39);
  end;
end;
//--------------------------------------- ���������� ������� �������� ----------------------------------------------
procedure drawgauge(x1,y1:integer);										//������ ���������� ������������ �������
begin
  with frmmain do
  begin
    drawlines(image1,x1,y1,x1,y1-13,2,0);								//			___
    image1.Canvas.Ellipse(x1-19,y1-51,x1+19,y1-13);						//		   / _ \
    drawlines(image1,x1-13,y1-38,x1+13,y1-26,2,0);						//		  |  /| |
    drawlines(image1,x1-13,y1-38,x1-6,y1-37,2,0);						//		   \___/
    drawlines(image1,x1-13,y1-38,x1-8,y1-33,2,0);						//			 |
  end;
end;
//--------------------------------------- ���������� ������� �������� ������ ---------------------------------------
procedure drawPiranigauge(x1,y1:integer);								//������ ���������� ������������ �������
begin
  with frmmain do
  begin
    drawlines(image1,x1,y1,x1,y1-13,2,0);								//			_______
    image1.Canvas.Ellipse(x1-19,y1-51,x1+19,y1-13);						//		   /   _   \
    drawlines(image1,x1,y1-18,x1,y1-22,2,0);							//		  /    _|   \
    drawlines(image1,x1,y1-22,x1-7,y1-22,2,0);							//		  |   |_    |
    drawlines(image1,x1-7,y1-22,x1-7,y1-29,2,0);						//		  \    _|   /
    drawlines(image1,x1-7,y1-29,x1,y1-29,2,0);							//		   \_______/
    drawlines(image1,x1,y1-29,x1,y1-36,2,0);							//			   |
    drawlines(image1,x1,y1-36,x1-7,y1-36,2,0);							//			   |
    drawlines(image1,x1-7,y1-36,x1-7,y1-43,2,0);
    drawlines(image1,x1-7,y1-43,x1,y1-43,2,0);
    drawlines(image1,x1,y1-43,x1,y1-47,2,0);
  end;
end;
//--------------------------------------- ���������� ��������� ������� ����� ---------------------------------------
procedure drawgaslines(IM:timage; x1,y1,x2,y2,w,cl : integer);			//������ ���������� ������ � ����� ��������,
begin																	//������� �������� � ���� ����������
  with frmmain do
  begin
  Im.Canvas.Pen.Width:=1;
  if (cl>0) and (x1<>x2) then											//���� ����������� �������������� �����
  begin
    Im.Canvas.Pen.color:=clblack;
    im.Canvas.MoveTo(x1,y1-2);											//		______
    Im.Canvas.LineTo(x2+1,y2-2);										//		 ����
    im.Canvas.MoveTo(x1+1,y1+1);										//		??????
    Im.Canvas.LineTo(x2+1,y2+1);
  end;
  if (cl>0) and (y1<>y2) then											//���� ����������� ������������ �����
  begin
    Im.Canvas.Pen.color:=clblack;
    im.Canvas.MoveTo(x1+1,y1);											//		| � |
    Im.Canvas.LineTo(x2+1,y2+1);										//		| � |
    im.Canvas.MoveTo(x1-2,y1);											//		| � |
    Im.Canvas.LineTo(x2-2,y2+1);										//		| � |
  end;
  if (cl<1) and (x1<>x2) then											//���� ������� �������������� �����
  begin
    Im.Canvas.Pen.color:=clwhite;
    im.Canvas.MoveTo(x1+1,y1-2);										//		. . . .
    Im.Canvas.LineTo(x2+1,y2-2);										//		 �����
    im.Canvas.MoveTo(x1+1,y1+1);										//		. . . .
    Im.Canvas.LineTo(x2+1,y2+1);
  end;
  if (cl<1) and (y1<>y2) then											//���� ������� ������������ �����
  begin
    Im.Canvas.Pen.color:=clwhite;
    im.Canvas.MoveTo(x1+1,y1);											//		. � .
    Im.Canvas.LineTo(x2+1,y2+1);										//		. � .
    im.Canvas.MoveTo(x1-2,y1);											//		. � .
    Im.Canvas.LineTo(x2-2,y2+1);										//		. � .
  end;																	//		. � .
  drawlines(im,x1,y1,x2,y2,w,cl);
  end;
end;
//--------------------------------------- ���������� �������� ------------------------------------------------------
procedure rounddraw(IM:timage; x1,y1,x2,y2,num:integer; ar:valvegrid);	//������ ����������, ����� ��������, 
var zvet:integer;														//������ ��������� �������
begin
  with frmmain do
  begin
  if ar[Num] then														//���� ������� �������,��
  begin
    Im.Canvas.Pen.Color:=32768;											//����������� � ������� ����
    zvet:=32768;
  end
  else																	//�����
  begin
    Im.Canvas.Pen.Color:=255;											//� ������� ����
    zvet:=255;
  end;
  Im.Canvas.ellipse(x1,y1,x2,y2);										//		 /???\
  Im.Canvas.Brush.Color:=zvet;											//		|	  |
  Im.Canvas.floodfill(x1+5,y1+5,zvet,fsborder);							//		 \___/
  end;
end;
//--------------------------------------- ���������� ������� ������ ������ -----------------------------------------
procedure drawflange(IM:timage);										//������ �������� �������� TImage
begin
    Im.Canvas.Pen.Color:=clblack;
    Im.Canvas.Brush.Color:=RGB(200,191,231);							//���������� ������������ � �����
    Im.Canvas.Chord(20,20,260,260,280,59,0,59);							//��������������� ����������	
    Im.Canvas.Brush.Color:=RGB(195,195,195);							//�� ���� ������
    Im.Canvas.Chord(20,20,260,260,0,59,280,59);
    Im.Canvas.Brush.Color:=RGB(255,201,14);
    im.Canvas.Ellipse(180,180,220,220);
    im.Canvas.Ellipse(60,180,100,220);
    im.Canvas.RoundRect(130,35,150,70,10,10);
    Im.Canvas.Brush.Color:=RGB(127,127,127);
    im.Canvas.RoundRect(134,21,146,37,0,0);
end;
//--------------------------------------- ���������� ������� (��������� ��������) ----------------------------------
procedure piedraw(ugol:word);											//������ ���� �������� ��������
var
grad:real;
x3,y3,x4,y4:word;
begin
  grad:=ugol*180/4692;      											//������� � ������� �� �������(��)
  grad:=grad/180*pi;                									//������� �� �������� � �������
  x3:=round(sin(grad+pi/4)*100);										//������� ��������� �� ������
  x3:=140+x3;                       									//���������� ����������
  y3:=round(cos(grad+pi/4)*100);
  y3:=140-y3;
  x4:=round(sin(grad-pi/4)*100);
  x4:=140+x4;
  y4:=round(cos(grad-pi/4)*100);
  y4:=140-y4;
  frmmain.Image2.Canvas.Brush.Color:=RGB(112,146,190);
  frmmain.image2.canvas.Pie(30,30,250,250,x3,y3,x4,y4);					//������ ������
  frmmain.Image2.Canvas.Brush.Color:=RGB(127,127,127);
  frmmain.Image2.canvas.Ellipse(126,126,154,154);						//������ ��� �������� ��������
end;
//--------------------------------------- ���������� ��������� �������� --------------------------------------------
procedure karuseldraw(ugol:word);										//������ ���� �������� �� (�����)
var grad:real;
x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6: word;
begin
  grad:=ugol/800*360;													// ������� � ������� �� ����� ��
  grad:=grad/180*pi;													// ������� �� �������� � �������
  with frmmain do
  begin
  x1:=140+round(85*sin(grad));											//����������� ���������� ���������� ��������
  y1:=140-round(85*cos(grad));
  x2:=140+round(85*sin(grad+pi/3));
  y2:=140-round(85*cos(grad+pi/3));
  x3:=140+round(85*sin(grad+2*pi/3));
  y3:=140-round(85*cos(grad+2*pi/3));
  x4:=140+round(85*sin(grad+pi));
  y4:=140-round(85*cos(grad+pi));
  x5:=140+round(85*sin(grad+4*pi/3));
  y5:=140-round(85*cos(grad+4*pi/3));
  x6:=140+round(85*sin(grad+5*pi/3));
  y6:=140-round(85*cos(grad+5*pi/3));
  drawlines(image3,140,140,x1,y1,3,clblack);							//			
  drawlines(image3,140,140,x2,y2,3,clblack);							//		  \  /
  drawlines(image3,140,140,x3,y3,3,clblack);							//	  	___\/___
  drawlines(image3,140,140,x4,y4,3,clblack);							//		   /\
  drawlines(image3,140,140,x5,y5,3,clblack);							//		  /  \
  drawlines(image3,140,140,x6,y6,3,clblack);							//			
  image3.Canvas.Brush.Color:=RGB(127,127,127);
  frmmain.Image3.canvas.Ellipse(126,126,154,154);						// ������ ��� �������� ��������
  image3.Canvas.pen.Width:=2;
  image3.Canvas.Brush.Color:=clred;
  frmmain.Image3.canvas.Ellipse(x1-25,y1-25,x1+25,y1+25);				// ������ ��������-��������� ���������
  image3.Canvas.Brush.Color:=RGB(112,146,190);
  frmmain.Image3.canvas.Ellipse(x2-25,y2-25,x2+25,y2+25);				// ������ ��������� ���������
  frmmain.Image3.canvas.Ellipse(x3-25,y3-25,x3+25,y3+25);
  frmmain.Image3.canvas.Ellipse(x4-25,y4-25,x4+25,y4+25);
  frmmain.Image3.canvas.Ellipse(x5-25,y5-25,x5+25,y5+25);
  frmmain.Image3.canvas.Ellipse(x6-25,y6-25,x6+25,y6+25);
  end;
end;
//--------------------------------------- ���������� ����������� ��������� ����� -----------------------------------
procedure draw();
begin
  with frmmain do
  begin
  drawlines(image1,74,160,230,160,2,0);									//������ ������� �����
  drawlines(image1,74,380,230,380,2,0);
  drawlines(image1,386,160,438,160,2,0);
  drawlines(image1,490,160,594,160,2,0);
  drawlines(image1,646,160,750,160,2,0);
  drawlines(image1,386,380,438,380,2,0);
  drawlines(image1,490,380,594,380,2,0);
  drawlines(image1,646,380,775,380,2,0);
  drawlines(image1,126,160,126,244,2,0);
  drawlines(image1,126,296,126,380,2,0);
  drawlines(image1,542,160,542,244,2,0);
  drawlines(image1,542,296,542,380,2,0);
  drawlines(image1,775,215,775,380,2,0);
  drawhvalve(image1,438,160);											//������ �������
  drawhvalve(image1,594,160);
  drawhvalve(image1,438,380);
  drawhvalve(image1,594,380);
  drawvvalve(image1,126,244);
  drawvvalve(image1,542,244);
  image1.Canvas.Brush.Color:=clwhite;
  image1.Canvas.Rectangle(230,108,386,212);								//������ ���2
  image1.Canvas.Rectangle(230,328,386,432);								//������ ���1
  image1.Canvas.Rectangle(230,83,256,109);
  image1.Canvas.Rectangle(230,303,256,329);
  Image1.Canvas.TextOut(235,113,'�������');								//��������� �������
  Image1.Canvas.TextOut(290,113,'�����');
  Image1.Canvas.TextOut(235,333,'�������');
  Image1.Canvas.TextOut(290,333,'�����');
  Image1.Canvas.TextOut(651,140,'� ��������� �����');
  Image1.Canvas.TextOut(280,303,'��� 1');
  Image1.Canvas.TextOut(280,83,'��� 2');
  
  drawlines(image1,742,105,842,105,2,0);								//������ ������
  drawlines(image1,742,110,752,110,2,0);
  drawlines(image1,832,110,842,110,2,0);
  drawlines(image1,752,110,752,210,2,0);
  drawlines(image1,832,110,832,210,2,0);
  drawlines(image1,742,210,752,210,2,0);
  drawlines(image1,832,210,842,210,2,0);
  drawlines(image1,742,215,842,215,2,0);
  drawlines(image1,832,185,884,185,2,0);
  drawlines(image1,884,185,884,380,2,0);
  drawgauge(812,105);													//������ ������ WRG
  image1.Canvas.TextOut(840,20,'�����������������');
  image1.Canvas.TextOut(840,34,'������');
  image1.Canvas.Rectangle(858,354,910,406);								//������ ���
  image1.canvas.Ellipse(871,367,897,393);
  drawlines(image1,874,380,893,380,2,0);
  drawlines(image1,878,374,878,386,2,0);
  drawlines(image1,882,374,882,386,2,0);
  drawlines(image1,886,374,886,386,2,0);
  drawlines(image1,890,374,890,386,2,0);
  drawlines(image1,910,380,962,380,2,0);
  drawhvalve(image1,962,380);											//������ �������� ������
  drawlines(image1,1014,380,1118,380,2,0);
  image1.Canvas.Rectangle(1118,354,1170,406);							//������ ���
  image1.canvas.Ellipse(1131,367,1157,393);
  drawlines(image1,1160,374,1170,380,2,0);
  drawlines(image1,1160,386,1170,380,2,0);
  drawlines(image1,1170,380,1200,380,2,0);
  drawPiranigauge(1066,380);											//������ ������ APG
  image1.Canvas.TextOut(1094,295,'������');
  image1.Canvas.TextOut(1094,309,'������');
  drawlines(image1,884,302,897,302,2,0);								//������ ������� ���������
  drawlines(image1,897,289,897,315,2,0);
  drawlines(image1,897,289,949,315,2,0);
  drawlines(image1,949,289,949,315,2,0);
  drawlines(image1,897,315,963,282,2,0);
  drawlines(image1,963,282,953,285,2,0);
  drawlines(image1,963,282,955,288,2,0);
  drawlines(image1,949,302,962,302,2,0);

  frmmain.Image2.Canvas.Pen.Width:=2;
  frmmain.Image3.Canvas.Pen.Width:=2;
  drawflange(frmmain.Image2);											// ������ ������ �� 2 �����
  drawflange(frmmain.Image3);											// ������ ������ �� 3 �����
  piedraw(0);															// ������ �������� � 0 ���������
  
   image4.Canvas.Pen.Width:=2;											// ����� ����� ��������� �������������� ��������
   image4.Canvas.Brush.Color:=RGB(200,191,231);							// �� 4 �����
   image4.canvas.Ellipse(20,20,260,260);	
  end;
end;
//--------------------------------------- ���������� ��������� ��������� ��������� ��������� -----------------------
procedure drawvacuum(a:valvegrid);										//������ ������ ��������� �������
begin
  with frmmain do
  begin
  if a[11] then															//���� ��� �������, �������� ������� ����
    image1.canvas.Brush.Color:=32768
    else
    image1.canvas.Brush.Color:=255;										//����� - �������
    image1.Canvas.FrameRect(rect(1119,355,1168,404));					//������� ������� �� ����� ��������� ������
    image1.Canvas.FrameRect(rect(1120,356,1167,403));
    drawlines(image1,1160,374,1170,380,2,0);
    drawlines(image1,1160,386,1170,380,2,0);
    if a[12] then														//���� ��� �������, �������� ������� ����
    image1.canvas.Brush.Color:=32768;
    if a[13] then														//���� ����������� ��� ����������, 
    image1.canvas.Brush.Color:=clyellow;								//�������� ������ ����
    if a[14] then
    image1.canvas.Brush.Color:=clyellow;
    if not ((a[12]) or (a[13]) or (a[14])) then							//���� ��������, �������� ������� ����
    image1.canvas.Brush.Color:=255;
    image1.Canvas.FrameRect(rect(859,355,908,404));						//������� ������� �� ����� ��������� ������ 
    image1.Canvas.FrameRect(rect(860,356,907,403));		
    rounddraw(image1,981,334,994,347,11,drawarray);						//��������� ��������� �������
    rounddraw(image1,918,275,931,288,11,drawarray);						//��������� ������� ������� ���������
    if a[11] then
    image1.Canvas.Brush.color:=clred
    else
    image1.Canvas.Brush.color:=clgreen;
    image1.Canvas.floodfill(923,280,clwhite,fsborder);					//����������� ��������� ������� ������� ���������
  end;
end;
//--------------------------------------- ���������� ��������� ��������� ������� ����� -----------------------------
procedure drawstream(a:valvegrid);										//������ ������ ��������� �������
var line1,line2,line3,line4:boolean;
begin
  line1:=false;
  line2:=false;
  line3:=false;
  line4:=false;
  with frmmain do
  begin
  Image1.canvas.Pen.Width:=2;											//������ �������� ���������
  rounddraw(image1,80,263,93,276,1,a);									//�������� � ���
  rounddraw(image1,457,114,470,127,2,a);
  rounddraw(image1,457,334,470,347,3,a);
  rounddraw(image1,496,263,509,276,4,a);
  rounddraw(image1,613,114,626,127,5,a);
  rounddraw(image1,613,334,626,347,6,a);
  rounddraw(image1,236,89,249,102,8,a);
  rounddraw(image1,236,309,249,322,7,a);

  drawgaslines(image1,74,160,228,160,2,0);								//������� �������� ������� �����
  drawgaslines(image1,74,380,228,380,2,0);
  drawgaslines(image1,385,160,436,160,2,0);								//	?
  drawgaslines(image1,490,160,592,160,2,0);								// 		?
  drawgaslines(image1,646,160,750,160,2,0);								//  		?
  drawgaslines(image1,385,380,436,380,2,0);								//	_
  drawgaslines(image1,490,380,592,380,2,0);								// 		_
  drawgaslines(image1,646,380,775,380,2,0);								//			_
  drawgaslines(image1,126,161,126,242,2,0);								//	?|
  drawgaslines(image1,126,297,126,378,2,0);								//	_|
  drawgaslines(image1,542,161,542,242,2,0);								//		   |?
  drawgaslines(image1,542,297,542,378,2,0);								//		   |_
  drawgaslines(image1,775,216,775,380,2,0);
																		//����������� � ������������ � ��� ����� ��� � ��������
  if a[9] then		{��������� ����� �� ������� ��������� ����� ������}
  begin
    drawgaslines(image1,74,160,228,160,2,65535);
    drawgaslines(image1,126,161,126,242,2,65535);
    if a[8] then		{��������� ���2}
    begin
      drawgaslines(image1,385,160,436,160,2,65535);
      if a[2] then		{��������� ������ 2}
      begin
        drawgaslines(image1,490,160,592,160,2,65535);
        drawgaslines(image1,542,161,542,242,2,65535);
        line1:=true;
        if a[5] then		{��������� ������ 5}
        begin
          drawgaslines(image1,646,160,750,160,2,65535);
          line2:=true;
        end;
        if a[4] then		{��������� ������ 4}
        begin
          drawgaslines(image1,490,380,592,380,2,65535);
          drawgaslines(image1,542,297,542,378,2,65535);
          line3:=true;
          if a[6] then		{��������� ������ 6}
          begin
            drawgaslines(image1,646,380,775,380,2,65535);
            drawgaslines(image1,775,216,775,380,2,65535);
            line4:=true;
          end;
        end;
      end;
    end;
    if a[1] then		{��������� ������ 1}
    begin
      drawgaslines(image1,74,380,228,380,2,65535);
      drawgaslines(image1,126,297,126,378,2,65535);
      if a[7] then		{��������� ��� 1}
      begin
        drawgaslines(image1,385,380,436,380,2,65535);
        if a[3] then		{��������� ������ 3}
        begin
          drawgaslines(image1,490,380,592,380,2,65535);
          drawgaslines(image1,542,297,542,378,2,65535);
          if a[6] then		{��������� ������ 6}
          drawgaslines(image1,646,380,775,380,2,65535);
          drawgaslines(image1,775,216,775,380,2,65535);
          if a[4] then		{��������� ������ 4}
          begin
            drawgaslines(image1,490,160,592,160,2,65535);
            drawgaslines(image1,542,161,542,242,2,65535);
            if a[5] then		{��������� ������ 5}
            drawgaslines(image1,646,160,750,160,2,65535);
          end;
        end;
      end;
    end;
  end;
  if a[10] then		{��������� ����� �� ������� �������� ����� N2/O2}
  begin
    drawgaslines(image1,74,380,228,380,2,16711680);
    drawgaslines(image1,126,297,126,378,2,16711680);
    if a[1] then		{��������� ������ 1}
    begin
      drawgaslines(image1,74,160,228,160,2,16711680);
      drawlines(image1,126,161,126,242,2,16711680);
      if a[8] then		{��������� ���2}
      begin
        drawgaslines(image1,385,160,436,160,2,16711680);
        if a[2] then		{��������� ������ 2}
        begin
          drawgaslines(image1,490,160,592,160,2,16711680);
          drawgaslines(image1,542,161,542,242,2,16711680);
          if a[5] then		{��������� ������ 5}
          begin
            drawgaslines(image1,646,160,750,160,2,16711680);
          end;
          if a[4] then		{��������� ������ 4}
          begin
            drawgaslines(image1,490,380,592,380,2,16711680);
            drawgaslines(image1,542,297,542,378,2,16711680);
            if a[6] then		{��������� ������ 6}
            begin
              drawgaslines(image1,646,380,775,380,2,16711680);
              drawgaslines(image1,775,216,775,380,2,16711680);
            end;
          end;
        end;
      end;
    end;
    if a[7] then		{��������� ��� 1}
    begin
      drawgaslines(image1,385,380,436,380,2,16711680);
      if a[3] then		{��������� ������ 3}
      begin
        drawgaslines(image1,490,380,592,380,2,16711680);
        drawgaslines(image1,542,297,542,378,2,16711680);
        if line3 then
        begin
          drawlines(image1,490,380,592,380,2,32768);
          drawlines(image1,542,297,542,378,2,32768);
        end;
        if a[6] then		{��������� ������ 6}
        begin
          drawgaslines(image1,646,380,775,380,2,16711680);
          drawgaslines(image1,775,216,775,380,2,16711680);
          if line4 then
          drawgaslines(image1,646,380,775,380,2,32768);
          drawgaslines(image1,775,216,775,380,2,32768);
        end;
        if a[4] then		{��������� ������ 4}
        begin
          drawgaslines(image1,490,160,592,160,2,16711680);
          drawgaslines(image1,542,161,542,242,2,16711680);
          if line1 then
          begin
            drawgaslines(image1,490,160,592,160,2,32768);
            drawgaslines(image1,542,161,542,242,2,32768);
          end;
          if a[5] then		{��������� ������ 5}
          begin                   
            drawgaslines(image1,646,160,750,160,2,16711680);
            if line2 then
            drawgaslines(image1,646,160,750,160,2,32768);
          end;
        end;
      end;
    end;
  end;
  end;
  drawarrow(74,159);													//������ ��������� � ������ ���������
  drawarrow(74,379);
end;

{======================================= ������ ��������������� ��������� � ������� ===============================}

//--------------------------------------- ������� ������� �� ������ � ������ ��:��:�� ------------------------------
function timeinput(t:word):string;										//������ ����� � ��������
var chasy, min, sek: byte;
stroka:string;
begin
   chasy := t div 3600;													//������������ ����, ������, �������
   min := (t mod 3600) div 60;
   sek := t mod 60;
   if chasy>9 then														//��������� ������ ������� ��:��:��
      stroka:=inttostr(chasy)+':'
   else
      stroka:='0'+inttostr(chasy)+':';
   if min>9 then
      stroka:=stroka+inttostr(min)+':'
   else
      stroka:=stroka+'0'+inttostr(min)+':';
   if sek>9 then
      stroka:=stroka+inttostr(sek)
   else
      stroka:=stroka+'0'+inttostr(sek);
   result:=stroka;
end;
//--------------------------------------- ���������� ���������� au_Shd_speed ---------------------------------------
procedure shd_speed_refresh();
var per:word; per2:real;
begin
with frmmain do
begin
per2:=strtofloat(Shd_speed_edit.Text);									//���������� �������� �� ���� "�������� ��"
if Shd_speed_RadioGroup.ItemIndex=0 then								//���� ������� ��. ���. ��/���
per2:=per2*800/60;                         								//��������� �� ��/��� � ���/��� (1 ��. = 800 �����)
if Shd_speed_RadioGroup.ItemIndex=1 then								//���� ������� ��. ���. ��/���
per2:=per2*800;                         								//��������� �� ��/��� � ���/���
per:=round(per2);                            							//��������� �� �����
if per>20000 then per:=20000;											//����������� ���������� (�� �����. ����������� ��)
if per<1 then per:=1;													//������������ ���������
au_Shd_speed:=per;														//��������� ���������� ����������
if Shd_speed_RadioGroup.ItemIndex=2 then per2:=per;						//������� � ��������� ���
if Shd_speed_RadioGroup.ItemIndex=1 then per2:=per/800;
if Shd_speed_RadioGroup.ItemIndex=0 then per2:=per*60/800;
Shd_speed_edit.Text:=floattostr(per2);									//��������� �������� ���� "�������� ��"
end;
end;
//--------------------------------------- ���������� ���������� au_Shd_accel ---------------------------------------
procedure shd_accel_refresh();
var per:word; per2:real;
begin
with frmmain do
begin
per2:=strtofloat(Shd_accel_edit.Text);									//���������� �������� �� ���� "��������� ��"
if Shd_speed_RadioGroup.ItemIndex=0 then								//���� ������� ��. ���. ��/���
per2:=per2*800/60;														//��������� �� ��/��� � ���/��� (1 ��. = 800 �����)
if Shd_speed_RadioGroup.ItemIndex=1 then								//���� ������� ��. ���. ��/���
per2:=per2*800;                         								//��������� �� ��/��� � ���/���
per:=round(per2);														//��������� �� �����
if per>3000 then per:=3000;												//����������� ���������� (�� �����. ����������� ��)
if per<1 then per:=1;													//������������ ���������
au_Shd_accel:=per;														//��������� ���������� ����������
if Shd_speed_RadioGroup.ItemIndex=2 then per2:=per;						//������� � ��������� ���
if Shd_speed_RadioGroup.ItemIndex=1 then per2:=per/800;
if Shd_speed_RadioGroup.ItemIndex=0 then per2:=per*60/800;
Shd_accel_edit.Text:=floattostr(per2);									//��������� �������� ���� "��������� ��"
end;
end;

{======================================== �������� ��������� ======================================================}

//--------------------------------------- ��������� ������� ��������� ----------------------------------------------

procedure TfrmMain.FormCreate(Sender: TObject);
var
i:integer;
str:string;
myYear, myMonth, myDay: word;
begin
frmmain.Top:=150;														//������������� ��������� ���� ����������
frmmain.Left:=300;
frmmain.Width:=1317;
frmmain.Height:=858;
draw;
for i := 1 to 14 do														//�������� ������ ��������� (��� �������� ���������)
drawarray[i]:=false;
frmmain.Archeckbox.Checked:=true;										//������������� �� ��������� �������������
frmmain.NOcheckbox.Checked:=true;										//��������� ���� � ���������
drawstream(drawarray);													//������������ ��������� ������� �����
drawvacuum(drawarray);													//������������ ��������� ��������� ���������
frmmain.Err_label.Visible:=false;										//������ ���������� ���� ������
frmmain.Left_Label.Visible:=false;										//������� �������/���������� ���
frmmain.Right_Label.Visible:=false;
frmmain.Produv_label.Visible:=false;									//���� ��������� �������� ������ ������� �����
frmmain.Produv_edit.Visible:=false;
frmmain.rrgradiogroup.itemindex:=2;										//���������� �� ��������� ��������� �������
frmmain.pressureradiogroup.itemindex:=2;								//��������� TRadioGroup
frmmain.Shd_speed_RadioGroup.ItemIndex:=2;
au_MFC1:=0;																//�������������� ���������� ��
au_MFC2:=0;
au_servo1:=0;
au_servo2:=0;
au_Shd_speed:=200;
au_Shd_accel:=200;
error_buf:=0;
frmmain.VV_button.Enabled:=false;										//������ �� ������� ������ ����������
frmmain.Timer2.Enabled:=false;											//��������� ������ ������ ���������
frmmain.Timer_2Button.Enabled:=false;									//������ ���������� ������ ��������� ������ ���������
mctPLC.Host := edtIPAddress.Text;										//������������� IP ����� ���: 172.16.11.228

																		// ������������� ����� ������ �������� ������ ���������
DecodeDate(Date, myYear, myMonth, myDay);								//���������� ������� ����
str:='C:\Users\NanoElion\Desktop\����\�������\'+inttostr(myMonth)+'.'+inttostr(myYear);
if not DirectoryExists(str) then										//���� ����� � ������ �������� ������ � ���� �� ����������
if not createdir(str) then												//������� �����
showmessage('������ ��� �������� �����');
AssignFile(file_mem, str+'\'+inttostr(myDay)+'.ini');					//����������� ���������� � ����� � ������ �������� ��� � �����
if not fileexists(str+'\'+inttostr(myDay)+'.ini') then					//���� ���� � ��� �� ��� ������, �� �������
begin
Rewrite(file_mem);
Closefile(file_mem);
end;
end;

//--------------------------------------- ��������� ������������ ������� ��������� ---------------------------------

//������ �������� �� ����������. ��������� ���������� Tick_Write ������ � ������ �������� ��� ���������� ����������
//��������� ������ ������ � ������� � �� ��������� (���� ������), ������ ������ ������������� ������ � ������ ������
//����������� ������, ���������� ��� �� ����������(���� ������), � ����� ������ �������� �20 (���������, ��� ���
//���������� ���� ������), ������� ��� ������� ��������� ���������� �������.

procedure TfrmMain.Timer2Timer(Sender: TObject);
var per,per2: real;
i: integer;
smb:char;
str:string;
data: array of word;
begin

//======================================= ��������� ����� ������ ===================================================
if not Tick_Write then													//���� �� ���� ������ (���� ������)
 begin																	//������ ����� ������
  WorkTime := WorkTime + 1;												//����������� ������� ����� ������
  try																	//���������� �������� �������� � �������� 30 ����
    if mctPLC.ReadHoldingRegisters(0, 30, Share_Mem) then
      begin																//���� ���������, ��������� ����������
		R_Quants := Share_Mem[1];
//--------------------------------------- ��������� ����������� ----------------------------------------------------
//��������� ������������ �������
        if (R_Quants and masckon[1])<> 0 then							//���� ������� �������
          begin
             drawarray[11]:=true;										//��������� ������ ���������
             frmmain.FV_timeedit.text:=timeinput(Worktime-fv_time);		//���������� ����� ��������
			 if (WorkTime-fv_time>120) and (WorkTime-fv_time<300) then	//���� ����� ���� ����� �������
				if (Share_Mem[28] and masckon[7])<>0 then				//������ 2 ������
				if (Share_Mem[28] and masckon[8])<>0 then				//������ 3 ������
				if (Share_Mem[28] and masckon[10])<>0 then				//������ 5 ������
				if (Share_Mem[28] and masckon[11])<>0 then				//������ 6 ������
					Produv_flag:=true;									//������� ��� ������� ����� ��������
          end
          else															//���� ������� �� �������
          begin
             drawarray[11]:=false;										//��������� ������ ���������
             Produv_flag:=false;										//������� ��� ������ �� ��������
			 fv_time:=Worktime+1;										//�������� ����� ������ ��� ���������� �����
          end;

//��������� ��������������� �������
        if (R_Quants and masckon[2])<> 0 then							//���� ������� �������
          begin
             drawarray[12]:=true;										//��������� ������ ���������
             frmmain.VV_timeedit.text:=timeinput(Worktime-vv_time);		//���������� ����� ��������
          end
          else															//���� ������� �� �������
          begin
             drawarray[12]:=false;										//��������� ������ ���������
			 vv_time:=Worktime+1;										//�������� ����� ������ ��� ���������� �����
          end;

//��������� ��������������� �������
        if (R_Quants and masckon[3])<> 0 then							//���� ��� �����������
          begin
             drawarray[13]:=true;										//��������� ������ ���������
             frmmain.Right_Label.Visible:=true;							//���������� ��������� ��������� �������� ���
             frmmain.Razgon_VV_timeedit.text:=timeinput(Worktime-razgon_time);	//���������� ����� ��������
          end
          else
          begin
             drawarray[13]:=false;										//��������� ������ ���������
             frmmain.Right_Label.Visible:=false;						//������� ��������� ��������� �������� ���
			 razgon_time:=Worktime+1;									//�������� ����� ������ ��� ���������� �����
          end;

//��������� ��������������� �������
        if (R_Quants and masckon[4])<> 0 then							//���� ��� ����������
          begin
             drawarray[14]:=true;										//��������� ������ ���������
             frmmain.Left_Label.Visible:=true;							//���������� ��������� ��������� �������� ���
             frmmain.ostanov_VV_timeedit.text:=timeinput(Worktime-ostanov_time);	//���������� ����� ��������
          end
          else
          begin
             drawarray[14]:=false;										//��������� ������ ���������
             frmmain.Left_Label.Visible:=false;							//������� ��������� ��������� �������� ���
			 ostanov_time:=Worktime+1;									//�������� ����� ������ ��� ���������� �����
          end;

//��������� ������� ������� �������
        if (R_Quants and masckon[7])<> 0 then							//���� ������� �������
          begin
             frmmain.Produv_label.Visible:=true;						//���������� ���� ��������� ��������
             frmmain.Produv_edit.Visible:=true;
             frmmain.Produv_edit.text:=timeinput(Worktime-Produv_time);	//���������� ����� ��������
             if (Worktime-Produv_time)>290 then Produv_flag:=true;		//������� ��� ������ ��������
          end
          else
          begin
             frmmain.Produv_label.Visible:=false;						//�������� ���� ��������� ��������
             frmmain.Produv_edit.Visible:=false;
             Produv_time:=Worktime+1;									//�������� ����� ������ ��� ���������� ����� 
          end;
//--------------------------------------- ����� ��������� ����������� ----------------------------------------------

//--------------------------------------- ��������� ��������� ------------------------------------------------------

//����������� ������ �� ������ �� �������
        if (((R_Quants and masckon[4])<> 0)								//���� ������� ��� ��� ����������
        or ((R_Quants and masckon[2])<> 0))
        then frmmain.FV_button.Enabled:=false							//������ �������� ���
        else
        frmmain.FV_button.Enabled:=true;

//����������� ������ �� ������ �� �������
		if ((((R_Quants and masckon[1])<> 0) and (Share_Mem[4]<2720) and	//���� ������� �� �����, �������� ���� ����������,
		((WorkTime-fv_time)>300) and ((R_Quants and masckon[7]) = 0)) or	//������ 5 ����� ������� � ������� ������� �� �������
		((R_Quants and masckon[2])<> 0)) then								//��� �� ������� ��� ����
			frmmain.VV_button.Enabled:=true									//��������� ���������/���������� ������
		else
			frmmain.VV_button.Enabled:=false;
			
//����������� ���������� ���������� ������� �����
		if (R_Quants and masckon[7])<> 0 then								//���� ������� ������� �������
			begin
			frmmain.valve1button.enabled:=false;							//��������� �������� �������� � ���
			frmmain.valve2button.enabled:=false;							//���������� ������ ������� �����
			frmmain.valve3button.enabled:=false;
			frmmain.valve4button.enabled:=false;
			frmmain.valve5button.enabled:=false;
			frmmain.valve6button.enabled:=false;
			frmmain.rrg1okbutton.Enabled:=false;
			frmmain.rrg1offbutton.Enabled:=false;
			frmmain.rrg2okbutton.Enabled:=false;
			frmmain.rrg2offbutton.Enabled:=false;
			end
		else
			begin
			frmmain.valve1button.enabled:=true;
			frmmain.valve2button.enabled:=true;
			frmmain.valve3button.enabled:=true;
			frmmain.valve4button.enabled:=true;
			frmmain.valve5button.enabled:=true;
			frmmain.valve6button.enabled:=true;
			frmmain.rrg1okbutton.Enabled:=true;
			frmmain.rrg1offbutton.Enabled:=true;
			frmmain.rrg2okbutton.Enabled:=true;
			frmmain.rrg2offbutton.Enabled:=true;
		end;

// �������� ���
		if (((R_Quants and masckon[4])<> 0)								//���� ������ ��� ��� ����������
		or ((R_Quants and masckon[2])<> 0)) then
			frmmain.TMN_progressbar.position:=Trunc(share_mem[2]*2.7/100)	//��������� ����� ������� (2.7 - �� � ��������)
		else frmmain.TMN_progressbar.position:=0; //����� 0

//���������� �������� APG:
		per:= Power(10, (Share_Mem[3]*0.002766)-6);						//��������� � �� � � �������� � ����
		if per > 1000 then per := 1000;									//���� ������ ���������, �� ���������
		if per < 0.001 then per := 0.001;								//���� ������ 0,001 (������ �������), �� ������
		case pressureradiogroup.ItemIndex of							//��������� ��������� �� ���� � ��������� �������������
			0: per:=per;												//���� ������� ����
			1: per:=100*per;											//���� ������� ��
			2: per:=per/1.333;											//���� ������� ����
		end;
		apgedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//������ �������� �� �����
		apgedit2.Text := FloatToStrF(per, ffExponent, 2, 1);
													//Power - ���. � �������, 0.0027 - ������� � ��(��. ADAM manual appendix B)
													//2.766- �������� ��� �������� � �� ��� ������������� � TIC
													//floattostrF : 2 - ����� ���� � ��������, 1 - ����� ���� � �������

//���������� �������� WRG:
		per := Power(10, (Share_Mem[4]*1.5*0.002766)-12);				//��������� � �� � � �������� � ����
		if per > 1000 then per := 1000;									//���� ������ ���������, �� ���������
		case pressureradiogroup.ItemIndex of							//��������� ��������� �� ���� � ��������� �������������
			0: per:=per;												//���� ������� ����
			1: per:=100*per;											//���� ������� ��
			2: per:=per/1.333;											//���� ������� ����
		end;
		wrgedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//������ �������� �� �����
		wrgedit2.Text := FloatToStrF(per, ffExponent, 2, 1);

//���������� �������� CVM:
		per := Power(10, (Share_Mem[7]*0.0027)-4.875);					//��������� � �� � � �������� � ����
		if per > 1000 then per := 1000;									//���� ������ ���������, �� ���������
		case pressureradiogroup.ItemIndex of							//��������� ��������� �� ���� � ��������� �������������
			0: per:=per;												//���� ������� ����
			1: per:=100*per;											//���� ������� ��
			2: per:=per/1.333;											//���� ������� ����
		end;
		cvmedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//������ �������� �� �����
		cvmedit2.Text := FloatToStrF(per, ffExponent, 2, 1);

//���������� ����� ���1
		if (R_Quants and masckon[5])<> 0 then							//���� ������� ������� �������
			R_ac_MFC1 := Share_Mem[5]									//�� ��������� ����������
		else															//�����	����������� 0
			R_ac_MFC1 :=0;
		per2:=round(R_ac_MFC1*2.7);										//������� � �� � ����������
		case rrgradiogroup.ItemIndex of									//��������� �� �� � ��������� ���
			0: per:=per2;												//���� ������� ��
			1: per:=per2/250;											//���� ������� sccm (5� = 20 sccm)
			2: per:=per2*0.06048/250;									//���� ������� �/��� (������� ����� ��� N2)
		end;															//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);											//��������� �� 2 ������ ����� �������
		rrg1controledit.Text:=floattostr(per);							//������� �������� ������ �� �����
		
//���������� ����� ���2
		if (R_Quants and masckon[6])<> 0 then							//���� ������� ������� �������
			R_ac_MFC2 := Share_Mem[6]									//�� ��������� ����������
		else															//����� ����������� 0
			R_ac_MFC2 :=0;
		per2:=round(R_ac_MFC2*2.7);										//������� � �� � ����������
		case rrgradiogroup.ItemIndex of									//��������� �� �� � ��������� ���
			0: per:=per2;												//���� ������� ��
			1: per:=per2/50;											//���� ������� sccm (5� = 100 sccm)
			2: per:=per2*0.06048/50;									//���� ������� �/��� (������� ����� ��� N2)
		end;															//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);											//��������� �� 2 ������ ����� �������
		rrg2controledit.Text:=floattostr(per);							//������� �������� ������ �� �����

//����� ���������� ����������		
		memo1.Lines.Add(floattostr(Share_Mem[3]));						//������� ��������� �� � ����������
		memo2.Lines.Add(floattostr(Share_Mem[4]));
		memo3.Lines.Add(floattostr(Share_Mem[5]));
		memo4.Lines.Add(floattostr(Share_Mem[6]));
		memo5.Lines.Add(floattostr(Share_Mem[2]));
		memo6.Lines.Add(floattostr(Share_Mem[7]));
		memo1.Lines.Add(' ');
		memo2.Lines.Add(' ');
		memo3.Lines.Add(' ');
		memo4.Lines.Add(' ');
		memo5.Lines.Add(' ');
		memo6.Lines.Add(' ');

//���������� ������� �������� ������������ ��, ��� ������� ������ COM-�����
		if (Share_Mem[14] = 10) or (Share_Mem[14] = 13) then smb:=' '	//���� ���������� ������ ����� ������,�� ' '
		else smb:=Chr(Share_Mem[14]);									//����� ���������� ������ �� ��� ���� ASCII
		str:=Pgm_Rcv_memo.Lines[Pgm_Rcv_line];							//��������� ������� ������
		str:=str+smb;													//��������� ������ � ������
		if length(str)>10 then											//���� ����� ������ ������ 10
			begin
			Pgm_Rcv_memo.lines.add(smb);								//����� ������ ���������� �� ��������� ������
			Pgm_Rcv_line:=Pgm_Rcv_line+1;								//����������� ������� ���-�� �����
			end
		else
			Pgm_Rcv_memo.lines[Pgm_Rcv_line]:=str;						//����� ��������� ������ � ����� ��������

//���������� �������� ��, ��, �� �������������
		rg_dc := Share_Mem[16];
		rg_du := Share_Mem[28];		
		au_servo1:= Share_Mem[29];
		au_servo2:= Share_Mem[30];

//������������� ��������� ��������� �� �����-�����
		if (R_Quants and masckon[5])<> 0 then drawarray[7]:=true		//��������� ������ ���������
		else drawarray[7]:=false;										//� ������������ � ����������
		if (R_Quants and masckon[6])<> 0 then drawarray[8]:=true		//����� ���
		else drawarray[8]:=false;
		for i:=0 to 5 do
		if (rg_du and masckon[i+5])<>0 then								//��������� ������ ���������
			drawarray[i+1]:=true										//� ������������ � ����������
		else															//�������� ������� �����
			drawarray[i+1]:=false;
		drawstream(drawarray);											//������������� ��������� ��������� ������� �����
		drawvacuum(drawarray);											//������������� ���������� ��������� ���������
		drawflange(image2);												//��������� ����� ������������
		piedraw(au_servo1);												//��������

//��������� ������
		if ((not rg_dc) and masckon[0]) <> 0 then						//���� ������� ������ �� ������ � TIC
		Share_Mem[18]:=(Share_Mem[18] or masckon[0])					//���������� 1 � 1 ��� �������� ������
		else Share_Mem[18]:=(Share_Mem[18] and masckoff[0]);			//����� ���������� 0
		for i:=0 to 5 do
		if (Share_Mem[18] and masckon[i]) <> 0 then						//���������� ������ ������� ������ �� ������
			frmmain.ERR_Memo.lines[i]:=err_msg[i]
		else frmmain.ERR_Memo.lines[i]:='';
		if error_buf <> Share_Mem[18] then								//���� ��������� ����� ������
			begin
			frmmain.Err_label.visible:=true;							//���������� ��������� �� ������
			error_buf:=Share_Mem[18];									//��������� ����� ������� ������
		end;
		if Share_Mem[21] <> 0 then ShowMessage('�� ��������� �������'	//���� ������� ������ �� ����
			+ IntToStr(Share_Mem[22]));									//(������ �� �������� ���� ������), ��������.
		
		end																//����� ��������� ������ ���������
    else
      ShowMessage('���� ������ ��������� PLC!');						//�� ������� �������
  except
    ShowMessage('���������� � ����� ������ ��������� PLC!');			//���������� � ����� ������
  end;																	//����� ��������� ���������� ��� ������ ���������
 Tick_Write := True;													//���� ������ �������
 end																	//����� ����� ������ ���������
 
//======================================= ��������� ����� ������ ===================================================

 else																	//���� ������ �� ������
  begin
  setlength(data,7);													//������� ������� �� ������
  data[0] := 20;														//��� ������� � 20 ������� (���� ������)
  data[1] := Cmd_Word;													//21	���������� �������
  Cmd_Word := 0;														//������� �������
  data[2] := Dop_cmd;													//22	�������� �������
  Dop_cmd:=0;															//������� ��������
  data[3] :=au_MFC1;													//23	������� ���1
  data[4] :=au_MFC2;													//24	������� ���2
  data[5] :=au_Shd_speed;												//25	�������� ��
  data[6] :=au_Shd_accel;												//26	��������� ��
  Pagecontrol1.Enabled := True;											//���������� �������� ����� (��������� ����� ����� ������)

  try																	//�������� �������� �������� � 20(sharemem 20) 7 ����
    if not(mctPLC.WriteRegisters(Offset_Cmd, data)) then				//���������� � (Offset_Cmd = 20) ��������
      ShowMessage('���� ������ ��������� PLC!');
  except
    ShowMessage('���������� � ����� ������ ��������� PLC!');
  end;																	//����� ��������� ���������� ��� ������ ���������
  
//--------------------------------------- ������ �������� ������ ������ � ���� -------------------------------------
  for i:= 0 to 6 do
	Share_Mem[20+i]:=data[i];											//��������� ���������� � ������ ��������
  Reset(file_mem);														//��������� ����
  Seek(file_mem,filesize(file_mem));									//��������� � ����� �����
  write(file_mem, Share_Mem);											//���������� ������� ������ ������
  Closefile(file_mem);													//��������� ����
  
  Tick_Write := False;													//���� ������ �������
 end;																	//����� ����� ������ ���������
end;

{======================================== ��������� ��������� ������ ������������ =================================}

//--------------------------------------- ������ ������������ ������� ----------------------------------------------
procedure Tfrmmain.FV_ButtonClick(Sender: TObject);
begin
if (R_Quants and masckon[1])<> 0 then									//���� ������� �������
   begin
      cmd_word:=2;														//������� �� ���������� ���
      Dop_cmd:=1;
   end
   else
   begin
      cmd_word:=1;														//������� �� ���������
      Dop_cmd:=1;
   end;
pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
end;
//--------------------------------------- ������ ��������������� ������� ----------------------------------------------
procedure Tfrmmain.VV_buttonClick(Sender: TObject);
begin
if (R_Quants and masckon[2])<> 0 then									//���� ������� �������
   begin
      cmd_word:=2;														//������� �� ���������� ���
      Dop_cmd:=2;
   end
   else
   begin
      cmd_word:=1;														//������� �� ���������
      Dop_cmd:=2;
   end;
pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
end;
//--------------------------------------- ����� ������������� ������� ----------------------------------------------
procedure Tfrmmain.Auto_vacuum_checkboxClick(Sender: TObject);
begin
if frmmain.Auto_vacuum_checkbox.Checked then							//���� ����� ������������ ������� �����
	cmd_word:=10														//������� �� ��������� �������������
else
	cmd_word:=20;														//����� - ����������
pagecontrol1.Enabled:=false;
end;
//--------------------------------------- ����� ������������� ������� ������� ����� --------------------------------
procedure Tfrmmain.Auto_Produv_CheckBoxClick(Sender: TObject);
begin
try
if frmmain.Auto_Produv_checkbox.Checked then							//���� ����� ������������ ������� �����
  begin
	cmd_word:=30;														//������� �� ��������� �������������
  Dop_Cmd:=strtoint(frmmain.produv_time_Edit.Text);
  end
else
	cmd_word:=40;														//����� - ����������
pagecontrol1.Enabled:=false;
except
	showmessage('�� ������� ��������� �������');
end;
end;
//--------------------------------------- ������ ���������� ��������� ������� ����� --------------------------------
procedure TfrmMain.valve1buttonClick(Sender: TObject);
begin
cmd_word:=5;															//������� �� ������������ 1 �������
Dop_cmd:=1;
pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
end;

procedure TfrmMain.valve2buttonClick(Sender: TObject);
begin
cmd_word:=5;															//������� �� ������������ 2 �������
Dop_cmd:=2;
pagecontrol1.Enabled:=false;											//������������ �������� �����
end;

procedure TfrmMain.Valve3buttonClick(Sender: TObject);
begin
cmd_word:=5;															//������� �� ������������ 3 �������
Dop_cmd:=3;
pagecontrol1.Enabled:=false;											//������������ �������� �����
end;

procedure TfrmMain.valve4buttonClick(Sender: TObject);
begin
cmd_word:=5;															//������� �� ������������ 4 �������
Dop_cmd:=4;
pagecontrol1.Enabled:=false;											//������������ �������� �����
end;

procedure TfrmMain.Valve5buttonClick(Sender: TObject);
var
str:string;
begin
str:='�� �������, ��� ������� ����� ��������� ��� ��������?';
if ((not Produv_flag) and ((R_Quants and masckon[2]) <> 0)) then		//���� ������� ����� �� ����������� � ������� ���
if messagedlg(str,mtWarning,[mbYES,mbNO],0)= mrYES then					//����������� ���������� � ������������
	Produv_flag:=true;
if ((Produv_flag) or ((R_Quants and masckon[2]) = 0)) then				//���� ��� �������� ��� ������� ����� ����������� (������������)
	begin
	cmd_word:=5;														//������� �� ������������ 5 �������
	Dop_cmd:=5;
	pagecontrol1.Enabled:=false;										//������������ �������� �����
	end;
end;

procedure TfrmMain.valve6buttonClick(Sender: TObject);
var
str:string;
begin
str:='�� �������, ��� ������� ����� ��������� ��� ��������?';
if ((not Produv_flag) and ((R_Quants and masckon[2]) <> 0)) then		//���� ������� ����� �� ����������� � ������� ���
if messagedlg(str,mtWarning,[mbYES,mbNO],0)= mrYES then					//����������� ���������� � ������������
	Produv_flag:=true;
if ((Produv_flag) or ((R_Quants and masckon[2]) = 0)) then				//���� ��� �������� ��� ������� ����� ����������� (������������)
	begin
	cmd_word:=5;														//������� �� ������������ 6 �������
	Dop_cmd:=6;
	pagecontrol1.Enabled:=false;										//������������ �������� �����
	end;
end;

//--------------------------------------- ������ ���������� ���1 ---------------------------------------------------

procedure TfrmMain.rrg1okbuttonClick(Sender: TObject);
var per:real; per2:word;
	str:string;
begin
try
with frmmain do
per:=strtofloat(rrg1inedit.Text);											//��������� ��������, ������� ����� ���������� ������������
rrg1inedit.Text:='';														//������� ���� ����� ��������
if per>=0 then																//���� ����� ������ 0
	begin
	if rrgradiogroup.ItemIndex=2 then per:=per*250/0.06048;					//��������� �������� � ��, ���� ������� �/���
	if rrgradiogroup.ItemIndex=1 then per:=per*250;							//��������� �������� � ��, ���� ������� sccm
	per2:=round(per);
	if per2>5000 then  per2:=5000;											//������������ ���������� (5� = 20sccm)
	if per2/5+au_MFC2<=1500 then											//��������� ����� � 2-� ��� �.�. ����� 30 sccm
		begin																//per2/5 �.�. ����� ���2 - (5� = 100sccm)
		au_MFC1:=per2;														//��������� ���������� ����������
		case rrgradiogroup.Itemindex of										//��������� �� �� � ��������� ���
			0: per:=per2;													//���� ������� ��
			1: per:=per2/250;												//���� ������� sccm
			2: per:=per2*0.06048/250;										//���� ������� �/��� (������� ����� ��� N2)
		end;																//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);												//��������� �� 2 ������ ����� �������
		rrg1outedit.Text:=floattostr(per);									//������� �������� �������� ������ �� �����
		cmd_word:=3;														//������� �� ������ ������������ ���������� �� ���1
		pagecontrol1.Enabled:=false;										//������������ �������� ����� (��������� ����� ����� ������) 
		end
	else
	begin
		str:='��������� ����� �� ������ ��������� 30 sccm. �� �������, ��� ������ ����������?';
		if messagedlg(str,mtWarning,[mbYES,mbNO],0) = mrYES then			//����������� ���������� � ������������
		begin
		au_MFC1:=per2;														//��������� ���������� ����������
		case rrgradiogroup.Itemindex of										//��������� �� �� � ��������� ���
			0: per:=per2;													//���� ������� ��
			1: per:=per2/250;												//���� ������� sccm
			2: per:=per2*0.06048/250;										//���� ������� �/��� (������� ����� ��� N2)
		end;																//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);												//��������� �� 2 ������ ����� �������
		rrg1outedit.Text:=floattostr(per);									//������� �������� �������� ������ �� �����
		cmd_word:=3;														//������� �� ������ ������������ ���������� �� ���1
		pagecontrol1.Enabled:=false;										//������������ �������� ����� (��������� ����� ����� ������)
		end;
	end;
end;
except
	showmessage('�� ������� ������� ��������');
end;
end;

procedure TfrmMain.rrg1offbuttonClick(Sender: TObject);
begin
au_MFC1:=0;																	//������ ����� = 0
cmd_word:=3;																//������� �� ������ ������������ ���������� �� ���1
pagecontrol1.Enabled:=false;												//������������ �������� �����
frmmain.rrg1outedit.Text:='0';												//������� ������� �������� ������ �� �����
end;
//--------------------------------------- ������ ���������� ���2 ---------------------------------------------------

procedure TfrmMain.rrg2okbuttonClick(Sender: TObject);
var per:real; per2:word;
str:string;
begin
try
with frmmain do
per:=strtofloat(rrg2inedit.Text);											//��������� ��������, ������� ����� ���������� ������������
rrg2inedit.Text:='';														//������� ���� ����� ��������
if per>=0 then																//���� ����� ������ 0
	begin
	if rrgradiogroup.ItemIndex=2 then per:=per*50/0.06048;					//��������� �������� � ��, ���� ������� �/���
	if rrgradiogroup.ItemIndex=1 then per:=per*50;							//��������� �������� � ��, ���� ������� sccm
	per2:=round(per);
	if per2>5000 then  per2:=5000;										//������������ ���������� (1,5� = 30sccm)
	if per2+au_MFC1/5<=1500 then											//��������� ����� � 2-� ��� �.�. ����� 30 sccm
	begin																	//au_MFC1/5 �.�. ����� ���1 - (5� = 20sccm)
		au_MFC2:=per2;														//��������� ���������� ����������
		case rrgradiogroup.ItemIndex of										//��������� �� �� � ��������� ���
			0: per:=per2;													//���� ������� ��
			1: per:=per2/50;												//���� ������� sccm
			2: per:=per2*0.06048/50;										//���� ������� �/��� (������� ����� ��� N2)
		end;																//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);												//��������� �� 2 ������ ����� �������
		rrg2outedit.Text:=floattostr(per);									//������� �������� �������� ������ �� �����
		cmd_word:=4;														//������� �� ������ ������������ ���������� �� ���2
		pagecontrol1.Enabled:=false;										//������������ �������� ����� (��������� ����� ����� ������)
		end
	else
	begin
		str:='��������� ����� �� ������ ��������� 30 sccm. �� �������, ��� ������ ����������?';
		if messagedlg(str,mtWarning,[mbYES,mbNO],0) = mrYES then			//����������� ���������� � ������������
		begin
		au_MFC2:=per2;														//��������� ���������� ����������
		case rrgradiogroup.ItemIndex of										//��������� �� �� � ��������� ���
			0: per:=per2;													//���� ������� ��
			1: per:=per2/50;												//���� ������� sccm
			2: per:=per2*0.06048/50;										//���� ������� �/��� (������� ����� ��� N2)
		end;																//����������� ����� ������ � 1.4 ���� ������
		per:=roundto(per,-2);												//��������� �� 2 ������ ����� �������
		rrg2outedit.Text:=floattostr(per);									//������� �������� �������� ������ �� �����
		cmd_word:=4;														//������� �� ������ ������������ ���������� �� ���2
		pagecontrol1.Enabled:=false;										//������������ �������� ����� (��������� ����� ����� ������)
		end;
	end;
end;
except
	showmessage('�� ������� ������� ��������');
end;
end;

 procedure TfrmMain.rrg2offbuttonClick(Sender: TObject);
begin
au_MFC2:=0;																	//������ ����� = 0
cmd_word:=4;																//������� �� ������ ������������ ���������� �� ���2
pagecontrol1.Enabled:=false;												//������������ �������� �����
frmmain.rrg2outedit.Text:='0';												//������� ������� �������� ������ �� �����
end;
//--------------------------------------- ������ ���������� ������������� �������� ---------------------------------

procedure Tfrmmain.servo1_buttonClick(Sender: TObject);						//������� ��������� ������������ � ��������
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//��������� ��������, ������� ����� ���������� ������������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then per:=0;													//������������ ��������� 0 ��������
	servo1_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=6;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
except
	showmessage('�� ������� ��������� �������');
end;
end;

procedure Tfrmmain.Minus_BitBtn1Click(Sender: TObject);						//������� ������������ �� 1 ������ �� ������� �������
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//��������� ������� ���������� �������� ���������
	Per:=Per-1;																//��������� �� 1 ������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then  per:=0;													//������������ ��������� 0 ��������
	servo1_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=6;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('�� ������� ��������� �������');
end;
end;

procedure Tfrmmain.Plus_BitBtn1Click(Sender: TObject);						//������� ������������ �� 1 ������ ������ ������� �������
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//��������� ������� ���������� �������� ���������
	Per:=Per+1;																//����������� �� 1 ������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then  per:=0;													//������������ ��������� 0 ��������
	servo1_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=6;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('�� ������� ��������� �������');
end;
end;
//--------------------------------------- ������ ���������� ������������� ��������������� --------------------------

procedure Tfrmmain.servo2_buttonClick(Sender: TObject);						//������� ��������� ������������ � ��������
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//��������� ��������, ������� ����� ���������� ������������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then per:=0;													//������������ ��������� 0 ��������
	servo2_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=7;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
except
	showmessage('�� ������� ��������� �������');
end;
end;

procedure Tfrmmain.Minus_BitBtn2Click(Sender: TObject);						//������� ������������ �� 1 ������ �� ������� �������
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//��������� ������� ���������� �������� ���������
	Per:=Per-1;																//��������� �� 1 ������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then  per:=0;													//������������ ��������� 0 ��������
	servo2_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=7;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('�� ������� ��������� �������');
end;
end;

procedure Tfrmmain.Plus_BitBtn2Click(Sender: TObject);						//������� ������������ �� 1 ������ ������ ������� �������
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//��������� ������� ���������� �������� ���������
	Per:=Per+1;																//����������� �� 1 ������
	if per>120 then per:=120;												//������������ ���������� � 120 ��������
	if per<0 then  per:=0;													//������������ ��������� 0 ��������
	servo2_edit.text:=floattostr(per);										//������� �������� �������� �� �����
	per:=per/120*4379;														//������� �� �������� � 0..4379 ��, �������� ���������
	Dop_cmd:=round(per);													//� ������������� 0-960 ������� ��� ����������������
	cmd_word:=7;															//������� �� ������ ������������ ���������� 
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('�� ������� ��������� �������');
end;
end;
//======================================= ������ ���������� ������� ���������� =====================================

//--------------------------------------- ������ �������� ������� �� ���������� �� ����� COM-���� ��� --------------

procedure Tfrmmain.shd_buttonClick(Sender: TObject);						//������������ ��� ������� �������� ������
var
per2: word;
per: char;
begin
per:=shd_edit.text[1];														//��������� ������, ������� ����� ���������
per2:=ord(per);																//������� ��� ��� ASCII
cmd_word:=51;																//������� �� �������� �������
Dop_cmd:=per2;																//�������� - ��� �������
pagecontrol1.Enabled:=false;												//������������ �������� ����� (��������� ����� ����� ������)
showmessage(inttostr(per2));												//������� ��������� � ����� �������
end;
//--------------------------------------- ������ �������� �� � �������� ��������� ----------------------------------

procedure Tfrmmain.Go_Right_BtnClick(Sender: TObject);						//�������� �� ������� �������
begin
try
	shd_speed_refresh();													//��������� �������� �������� ��������
	shd_accel_refresh();													//��������� �������� ��������� ���������
	cmd_word:=52;															//������� �� ������ �� �������� ��������
	Dop_cmd:=1;																// � ����������� ��������
	pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
except
	showmessage('������ ����� ���������');
end;
end;

procedure Tfrmmain.Go_Left_BtnClick(Sender: TObject);						//�������� ������ ������� �������
begin
try
	shd_speed_refresh();													//��������� �������� �������� ��������
	shd_accel_refresh();													//��������� �������� ��������� ���������
	cmd_word:=52;															//������� �� ������ �� �������� ��������
	Dop_cmd:=2;																// � ����������� ��������
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('������ ����� ���������');
end;
end;
//--------------------------------------- ������ ��������� ��  -----------------------------------------------------

procedure Tfrmmain.Shd_stop_buttonClick(Sender: TObject);
begin
cmd_word:=53;																//������� ���������� ��
pagecontrol1.Enabled:=false;												//������������ �������� ����� (��������� ����� ����� ������)
end;

procedure Tfrmmain.Shd_stop_button2Click(Sender: TObject);
begin
cmd_word:=53;																//������� ���������� ��
pagecontrol1.Enabled:=false;												//������������ �������� �����
end;
//--------------------------------------- ������ ����������� �� �� ���������� --------------------------------------

procedure Tfrmmain.Shd_move_ButtonClick(Sender: TObject);
var per:word;
begin
try																			//��������� �������� ���������
	per:=round(strtofloat(Shd_position_Edit.text)/0.45);					//�� �������� � ���� (1 ��� = 0,45 ��������)
	if per>800 then per:=800;												//������������ ���������� (360� = 800 �����)
	cmd_word:=54;															//������� �� �����������
	Dop_cmd:=per;															//�������� - ����������
	pagecontrol1.Enabled:=false;											//������������ �������� ����� (��������� ����� ����� ������)
except
	showmessage('������ ����� ���������');
end;
end;
//--------------------------------------- ������ ����������� �� �� �������� ���-�� ����� ---------------------------

procedure Tfrmmain.Step_right_BtnClick(Sender: TObject);					//�� ������� �������
var per:word;
begin
try
	per:=round(strtofloat(Shd_step_edit.text));								//��������� �� ������� ����� ������������ ����� ���������
	if per<1 then per:=1;													//������������ ��������� � 1 ���
	cmd_word:=55;															//������� �� �������
	Dop_cmd:=per;															//�������� - ����� �����
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('������ ����� ���������');
end;
end;

procedure Tfrmmain.Step_left_BtnClick(Sender: TObject);						//������ �������
var per:word;
begin
try
	per:=round(strtofloat(Shd_step_edit.text));								//��������� �� ������� ����� ������������ ����� ���������
	if per<1 then per:=1;													//������������ ��������� � 1 ���
	cmd_word:=56;															//������� �� �������
	Dop_cmd:=per;															//�������� - ����� �����
	pagecontrol1.Enabled:=false;											//������������ �������� �����
except
	showmessage('������ ����� ���������');
end;
end;
//--------------------------------------- ������ ������ ����������� �������� �� ------------------------------------

procedure Tfrmmain.Shd_scan_buttonClick(Sender: TObject);
var per:word; per2:real;
begin
try
	shd_speed_refresh();													//��������� �������� �������� ��������
	shd_accel_refresh();													//��������� �������� ��������� ���������
	per:=round(strtofloat(Shd_scan_edit.text)/0.45);						//��������� �������� ������ ������������ � ����
	per2:=(au_Shd_speed*au_Shd_speed)/au_Shd_accel;							//t=v/a; 2S=at^2=v^2/a; (����� �������� ������� �
	if per>per2+1 then														//���������� 2S �.�. ������ �������); max V=1095 ���/�
		begin
		cmd_word:=57;														//������� �� ����������� ��������
		Dop_cmd:=per;														//�������� - ������ � �����
		pagecontrol1.Enabled:=false;										//������������ �������� ����� (��������� ����� ����� ������)
		end
	else
		showmessage('������ ������� ��� ��� ������� �� �������� ��������');
except
	showmessage('������ ����� ���������');
end;
end;
//--------------------------------------- ������ �������� � ��������� HOME------------------------------------------
procedure Tfrmmain.shd_home_ButtonClick(Sender: TObject);
begin
  cmd_word:=58;
  pagecontrol1.Enabled:=false;
end;
//--------------------------------------- ������ ���������� ������ ��������� ��� -----------------------------------

procedure Tfrmmain.PLC_close_ButtonClick(Sender: TObject);
var data: array of word;
begin
if R_Quants = 0 then														//���� ��� �������� �����������
	begin
	setlength(data,2);														//������� ������� �� ������
	data[0] := 20;															//��� ������� � 20 ������� (���� ������)
	data[1] := 100;															//21    ���������� ������� �� ��������� ������
	try																		//�������� �������� �������� � 20(sharemem 20) 2 ����
		if not(mctPLC.WriteRegisters(Offset_Cmd, data)) then				//���������� � (Offset_Cmd = 20) ��������
			ShowMessage('���� ������ ��������� PLC!');
	except
		ShowMessage('���������� � ����� ������ ��������� PLC!');
	end;																	//����� ������� ������ �� ������
	end
else
	showmessage('��� �������� ������ ���� ���������.');
end;
//--------------------------------------- ������ ��������� ��������� ������� ---------------------------------------

procedure TfrmMain.stopbuttonClick(Sender: TObject);
var
  Data: Array of Word;
begin
	SetLength(Data, 2);														//������� ������� �� ������
	Data[0]:=20;																//��� ������� � 20 ������� (���� ������)
	Data[1]:=1000;															//21    ���������� ������� �� ��������� �������
  	try																		//�������� �������� �������� � 20(sharemem 20) 2 ����
		if not(mctPLC.WriteRegisters(Offset_cmd, Data)) then				//���������� � (Offset_Cmd = 20) ��������
			MessageDlg('���� �������� �������!', mtError, [mbOk], 0);		//��������, ���� �� ������� �������� �������
		Pagecontrol1.Enabled := False;										//������������ �������� ����� (��������� ����� ����� ������)
	except
		ShowMessage('���������� � ����� ������ ��������� PLC!');
	end;																	//����� ������� ������ �� ������
end;

{======================================== ��������� �������������� � ���������� ���������� ========================}

//--------------------------------------- ������ ������� � ��������� ������ ��������� ------------------------------

procedure Tfrmmain.Timer_ButtonClick(Sender: TObject);						//������ ���������
begin
frmmain.Timer2.Enabled:= not frmmain.Timer2.Enabled;						//�������� ������
frmmain.Timer_2Button.Enabled:=true;										//���������� ������ ����������
frmmain.Timer_Button.Enabled:=false;										//������������ ������ ���������
frmmain.PLC_close_Button.Enabled:=false;									//������������ ������ ���������� ������ ��������� ���
end;

procedure Tfrmmain.Timer_2ButtonClick(Sender: TObject);						//������� ���������
begin
frmmain.Timer2.Enabled:= not frmmain.Timer2.Enabled;						//��������� ������
frmmain.Timer_2Button.Enabled:=false;										//������������ ������ ����������
frmmain.Timer_Button.Enabled:=true;											//���������� ������ ���������
frmmain.PLC_close_Button.Enabled:=true;										//���������� ������ ���������� ������ ��������� ���
end;
//--------------------------------------- ������ ����������� ������ ��������� �������� -----------------------------

procedure Tfrmmain.pressureradiogroupClick(Sender: TObject);
begin
with frmmain do
if pressureradiogroup.ItemIndex=0 then										//������ ������� ������ ���������
begin																		//� ����������� �� ��������� �����
   apglabel.Caption:='����';												//�������� ��������� � ����� ������
   wrglabel.Caption:='����';
   cvmlabel.Caption:='����';
   apglabel2.Caption:='����';
   wrglabel2.Caption:='����';
   cvmlabel2.Caption:='����';
end;
if pressureradiogroup.ItemIndex=1 then
begin
   apglabel.Caption:='��';
   wrglabel.Caption:='��';
   cvmlabel.Caption:='��';
   apglabel2.Caption:='��';
   wrglabel2.Caption:='��';
   cvmlabel2.Caption:='��';
end;
if pressureradiogroup.ItemIndex=2 then
begin
   apglabel.Caption:='����';
   wrglabel.Caption:='����';
   cvmlabel.Caption:='����';
   apglabel2.Caption:='����';
   wrglabel2.Caption:='����';
   cvmlabel2.Caption:='����';
end;
end;

procedure Tfrmmain.pressureradiogroup2Click(Sender: TObject);				//������ ������ ������ ��������� ��������
begin																		//�� 2 ���� ����������
with frmmain do
case pressureradiogroup2.ItemIndex of										//�������� ��������� ����� �����������
0: pressureradiogroup.ItemIndex:=0;											//������ �� 1 ���� ����������
1: pressureradiogroup.ItemIndex:=1;
2: pressureradiogroup.ItemIndex:=2;
end;
end;
//--------------------------------------- ������ ����������� ������ ��������� ������ ��� ---------------------------

procedure Tfrmmain.rrgradiogroupClick(Sender: TObject);
var per:real;
begin
with frmmain do
if rrgradiogroup.ItemIndex=0 then											//������ ������� ������ ���������
begin																		//� ����������� �� ��������� �����
  rrg1out.Text:='��';														//�������� �� ��������� � ����� ������
  rrg2out.Text:='��';
  rrg2max.Text:='0..1500';
  rrg1max.Text:='0..5000';
  rrg1outedit.Text:=inttostr(au_MFC1);										//��������� ������������ �������� ��
  rrg2outedit.Text:=inttostr(au_MFC2);										//���� ������� ��
end;
if rrgradiogroup.ItemIndex=1 then
begin
  rrg1out.Text:='sccm';
  rrg2out.Text:='sccm';
  rrg2max.Text:='0..30';
  rrg1max.Text:='0..20';
  per:=roundto(au_MFC1/250,-2);												//��������� ������������ �������� ��
  rrg1outedit.Text:=floattostr(per);										//���� ������� sccm
  per:=roundto(au_MFC2/50,-2);
  rrg2outedit.Text:=floattostr(per);
end;
if rrgradiogroup.ItemIndex=2 then
begin
  rrg1out.Text:='�/���';
  rrg2out.Text:='�/���';
  rrg2max.Text:='0..1,81';
  rrg1max.Text:='0..1,21';
  per:=roundto(au_MFC1*0.06048/250,-2);										//��������� ������������ �������� ��
  rrg1outedit.Text:=floattostr(per);										//���� ������� �/���
  per:=roundto(au_MFC2*0.06048/50,-2);
  rrg2outedit.Text:=floattostr(per);
end;
end;
//--------------------------------------- ������ ����������� ������ ��������� �������� �������� �� -----------------

procedure Tfrmmain.Shd_speed_RadioGroupClick(Sender: TObject);
var per,per2:real;
begin
with frmmain do
if Shd_speed_RadioGroup.ItemIndex=0 then									//������ ������� ������ ���������
begin																		//� ����������� �� ��������� �����
   Shd_speed_label.Caption:='��/���';
   Shd_accel_label.Caption:='��/���';
   Shd_speed_range_label.Caption:='�������� (0..1 500):';
   Shd_accel_range_label.Caption:='��������� (0..225):';
   per:=au_Shd_speed;
   per2:=au_Shd_accel;														//���� ������� ��/���
   per:=per*60/800;															//��������� � ��/��� (1	�� = 800 �����)
   per2:=per2*60/800;
   Shd_speed_edit.Text:=floattostr(per);									//��������� ������������ ��������
   Shd_accel_edit.Text:=floattostr(per2);
end;
if Shd_speed_RadioGroup.ItemIndex=1 then
begin
   Shd_speed_label.Caption:='��/���';
   Shd_accel_label.Caption:='��/���';
   Shd_speed_range_label.Caption:='�������� (0..25):';
   Shd_accel_range_label.Caption:='��������� (0..3,75):';
   per:=au_Shd_speed;
   per2:=au_Shd_accel;														//���� ������� ��/���
   per:=per/800;															//��������� � ��/��� (1	�� = 800 �����)
   per2:=per2/800;
   Shd_speed_edit.Text:=floattostr(per);									//��������� ������������ ��������
   Shd_accel_edit.Text:=floattostr(per2);
end;
if Shd_speed_RadioGroup.ItemIndex=2 then
begin
   Shd_speed_label.Caption:='���/���';
   Shd_accel_label.Caption:='���/���';
   Shd_speed_range_label.Caption:='�������� (0..20 000):';
   Shd_accel_range_label.Caption:='��������� (0..3 000):';
   Shd_speed_edit.Text:=floattostr(au_Shd_speed);							//���� ������� ���/���
   Shd_accel_edit.Text:=floattostr(au_Shd_accel);							//��������� ������������ ��������
end;
end;
//--------------------------------------- ������ ����������� ����� � ������� ����� ---------------------------------

procedure TfrmMain.ArcheckboxClick(Sender: TObject);						//���� ������ (�������) ������� Ar
begin
drawarray[9]:= not drawarray[9];											//������ ������ ���������
end;

procedure TfrmMain.NOcheckboxClick(Sender: TObject);						//���� ������ (�������) ������� N2/O2
begin
drawarray[10]:= not drawarray[10];											//������ ������ ���������
end;
//--------------------------------------- ������ ��������� � ��������� ������ --------------------------------------

procedure Tfrmmain.Err_labelClick(Sender: TObject);							//��� ������� �� ������
begin
frmmain.PageControl1.ActivePageIndex:=2;									//��������� ������� � ����� �������� ������� ������
frmmain.ERR_label.Visible:=false;											//������� ������
end;
//--------------------------------------- ��������� ������� ������� ���������� -------------------------------------

procedure Tfrmmain.PageControl1Change(Sender: TObject);
begin
if frmmain.PageControl1.ActivePageIndex=2 then								//��� ��������������� �������� ������� � ��������
frmmain.Err_label.Visible:=false;											//������� ������ ��������� �� ������, ���� ����
end;
//--------------------------------------- �������� ��������� -------------------------------------------------------

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
var str:string;
begin
str:='�� ������� ��� ������ �����?';
if messagedlg(str,mtWarning,[mbOK,mbCancel],0)= mrOk						//������� ���������� ���� �������������
then action:= caFree
else action:=caNone;
end;

{======================================== ��������� ��������� ���������� ������ ===================================}

//--------------------------------------- ������ ���������� ��������� ��� ------------------------------------------

procedure TfrmMain.readbuttonClick(Sender: TObject);
var
  Data: array[0..31] of Word;
  iAmount: Integer;
  i: Integer;
  sLine: String;
begin
    mctPLC.Host := edtIPAddress.Text;										//������ IP ������ �������
	iAmount := 30;															//��������� 30 ���������
    if mctPLC.ReadHoldingRegisters(0, iAmount, Data) then					//� ��������� ������ Data � ��������
    begin
      sLine := 'Register value(s) read:';									
      for i := 0 to (iAmount - 1) do
		sLine := sLine +													//������ ������� ����������
                 #13#10'     ' +											//� ����� ������
                 IntToStr(0 + i) +											//���������� �����
                 ': 0x'  +
                 IntToHex(Data[i], 4);										//���������� ��������
      ShowMessage(sLine);													//������� ��������� �� �����
    end
    else
		ShowMessage('PLC read operation failed!');
end;
//--------------------------------------- ������ ������ �������� ��� -----------------------------------------------

procedure Tfrmmain.WritebuttonClick(Sender: TObject);
var Reg_number,write_data: word;
begin
try
	Reg_number:=strtoint(frmmain.writeregedit.Text);						//�������� ����� ��������, � ������� ����� ����������
	write_data:=strtoint(frmmain.Writedataedit.Text);						//��������� ��������, ������� ����� ��������
	mctPLC.WriteRegisters(Reg_number,write_data);							//����������
except
	showmessage('�� ������� ������� ��������');
end;
end;
end.	{------------------------------------------- ����� ��������� ----------------------------------------------}
