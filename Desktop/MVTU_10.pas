unit MVTU_10;

interface

uses												//подключаем библиотеки протокола modbus TCP/IP client
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, buttons,
  IdTCPClient, ExtCtrls, ComCtrls, IdModbusClient, IdException, Types, Math;

const
  Cadr_Size = 31;     								//Размер памяти обмена сервера - 31 регистр

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

{	Используемые сокращения:
	РРГ - регулятора расхода газа
	ТМН - турбомолекулярный насос
	ФВН - форвакуумный насос
	ФВ - форвакуумный
	ВВ - высоковакуумный
	ШД - шаговый двигатель
	ДК - дискретный контроль
	ДУ - дискретное управление
	АК - аналоговый контроль
	АУ - аналоговое управление
	ПЛК - программируемый логический контроллер
	TIC - контроллер управления элементами создания и контроля вакуума}

//========================================== Инициализация переменных ==============================================
  
  TCadr = array [0..Cadr_Size] of Word;				//тип: массив размера памяти обмена сервера

var
  frmmain: Tfrmmain;								//форма-интерфейс
  Share_Mem: TCadr;									//Память обмена сервера
  File_mem: File of Tcadr;							//память обмена для записи в файл
  Offset_cmd: byte = 21;							//номер регистра с которого начинаются регистры, записываемые
													//клиентом на сервер
  
//------------------------------------------ Регистры памяти обмена тип: Word --------------------------------------

//| содержание регистра | номер ячейки массива регистров | ----------------------- описание ----------------------- | 
	R_Quants,			//				1					регистр состояния процессов
						//				2					Аналоговый сигнал с TIC (обороты ТМН)
						//				3					Давление с вакууметра APG
						//				4					Давление с вакууметра WRG
	R_ac_MFC1,			//				5					Поток газонатекания через РРГ1
	R_ac_MFC2,			//				6					Поток газонатекания через РРГ2
						//				7					Давление с вакууметра CVM
						//				14					буфер ПЛК принятых данных через COM-порт
	rg_dc,				//				16					Регистр сигналов ДК
	error_buf,			//				18					Буфер ошибок
						//				20					Состояние цикла записи/чтения (при записи данных на сервер
						//									записываем не 0 значение, сервер при обновлении меняет на 0)
	Cmd_Word,			//				21					Номер команды для исполнения
	Dop_Cmd,			//				22					Параметр команды
	au_MFC1,			//				23					Задание потока газонатекания через РРГ1
	au_MFC2,			//				24					Задание потока газонатекания через РРГ2
	au_Shd_speed,		//				25					скорость вращения ШД
	au_Shd_accel,		//				26					ускорение вращения ШД
	rg_du, 				//				27					Регистр ДУ
	au_servo1,			//				28					положение сервопривода заслонки
	au_servo2:Word;		//				29					положение сервопривода дросселирования
	
//========================================== Содержание процессов в регистре состояния процессов №1 ================
//
// номер бита | процесс	--------------------------------------------------------------------------------------------
//		1		ФВ откачка
//		2		ВВ откачка
//		3		разгон ТМН
//		4		торможение ТМН
//		5		напуск газа через РРГ1
//		6		напуск газа через РРГ2
//		7		продув газовой линейки
//		8		отправка символов через COM-порт 1
//------------------------------------------------------------------------------------------------------------------

//========================================== Описание команд, записанных в ригистры №22,23 =========================
//
// значение регистра 22 | значение регистра 23 | процедуры отправки команд | ---Описание----------------------------
//			1		 				1				FV_ButtonClick				Запуск ФВ насоса
//									2				VV_ButtonClick				Запуск ВВ насоса
//			2						1				FV_ButtonClick				выключение ФВ насоса
//									2				VV_ButtonClick				выключение ВВ насоса
//			3										rrg1okbuttonClick			задание напуска газа через РРГ1
//													rrg1offbuttonClick			закрыть РРГ1
//			4										rrg2okbuttonClick			задание напуска газа через РРГ2
//													rrg2offbuttonClick			закрыть РРГ2
//          5						1-6				valve1buttonClick			Открытие/Закрытие клапана
//          6						0-4379			servo1_buttonClick			Изменить положение серводвигателя заслонки
//													Minus_BitBtn1Click			повернуть на 1 градус по часовой стрелке
//													Plus_BitBtn1Click			повернуть на 1 градус против часовой
//          7						0-4379			servo2_buttonClick			Изменить положение серводвигателя дросселирования
//													Minus_BitBtn2Click			повернуть на 1 градус по часовой стрелке
//													Plus_BitBtn2Click			повернуть на 1 градус против часовой
//          51						?				shd_buttonClick				отправить символа с заданным кодом ASCII
//																				через COM-порт ПЛК 
//          52						1				Go_Right_BtnClick			непрерывно вращать ШД по часовой стрелке
//									2				Go_Left_BtnClick			епрерывно вращать ШД против часовой
//          53										Shd_stop_buttonClick		остановить ШД
//													Shd_stop_button2Click		дублируюая кнопка остановить ШД
//          54						0-800			Shd_move_ButtonClick		перемещение ШД по заданной координате
//          55						?				Step_right_BtnClick			перемещение ШД на заданное число шагов по часовой
//          56						?				Step_left_BtnClick			перемещение ШД на заданное число шагов против часовой
//          57						?				Shd_scan_buttonClick		сканирующее движение ШД на заданном секторе
//          58                    shd_home_ButtonClick    возврат в положение HOME
//          100										PLC_close_ButtonClick		завершение работы программы
//          10/20									Auto_vacuum_checkboxClick	вкл./выкл. автоматической откачки
//          30/40									Auto_Produv_CheckBoxClick	вкл./выкл. автоматической продувки газовой линии
//          1000									stopbuttonClick				аварийная остановка откачки
//------------------------------------------------------------------------------------------------------------------
//
//========================================== Содержание ошибок в буфере ошибок №18 =================================
//
// массив сообщений об ошибках --------------------------------------------------------- номер бита в регистре -----
err_msg: array[0..5] of string =
								('Ошибка контроллера TIC',							//				
								'Неисправен вакууметр APG',							//				0
								'Давление выше требуемого',							//				1
								'Плохой вакуум',									//				2
								'Сбой инициализации таймера',						//				3
								'Ком порт уже установлен'							//				4
								);

//------------------------------------------ Вспомогательные маски для побитовых операций с регистрами -------------
masckon : array [0..15] of Word = (1, 2, 4, 8, 16, 32, 64, 128, 256,
512, 1024, 2048, 4096, 8192, 16384, 32768);
masckoff : array [0..15] of Word = (65534, 65533, 65531, 65527, 65519, 65503,
65471, 65407, 65279, 65023, 64511, 63487, 61439, 57343, 49151, 32767);

//------------------------------------------ Флаги 1/0 -------------------------------------------------------------
Tick_Write: boolean = False;            			//сейчас цикл записи данных на сервер?
Produv_flag:boolean=false;              			//завершен продув газовой линии?

//------------------------------------------ счетчики --------------------------------------------------------------
WorkTime: word = 0;									//Время работы программы
Produv_time,										//Время старта процесса продув
fv_time,											//Время старта работы ФВ
vv_time,											//Время старта работы ВВ
razgon_time,										//время старта разгона тмн
ostanov_time: word;									//время старта торможения тмн
Pgm_Rcv_line: byte = 0;								//текущий номер строки в Pgm_Rcv_memo (окно отображения символов, полученных
													//ПЛК через COM-порт от контроллера ШД)

//------------------------------------------ переменные, используемые для индикации элементов на мнемо-схеме -------										
  type valvegrid=array[1..14] of boolean;         	//тип: массив состояния элементов и процессов системы:
													//1-6 состояние клапанов 1-6
													//7-8 состояние РРГ 1-2
													//9-10 включена ли индикация газов в газовой линии (AR,NO checkbox)
													//11-12 сосояние насосов ФВН, ТМН
													//13-14 разгон/торможение ТМН

//---------------------------- вспомагательные процедуры для отрисовки мнемо-схемы и индикации элементов -----------
  procedure drawstream(a:valvegrid);     								//прорисовка состояния газовой линейки
  procedure drawvacuum(a:valvegrid);									//прорисовка состояния вакуумных элементов
  procedure draw() ;                     								//прорисовка статических элементов
  procedure drawlines(IM:timage; x1,y1,x2,y2,w,cl : integer) ;			//прорисовка линий
  procedure drawgaslines(IM:timage; x1,y1,x2,y2,w,cl :integer);			//прорисовка патрубков газовой линии
  procedure drawarrow(x1,y1:integer) ;									//рисование стрелочки
  procedure drawhvalve(IM:timage; x1,y1:integer);						//прорисовка горизонтально расположенного клапана
  procedure drawvvalve(IM:timage; x1,y1:integer);						//прорисовка вертикально расположенного клапана
  procedure rounddraw(IM:timage; x1,y1,x2,y2,num:integer; ar:valvegrid);//прорисовка лампочек
  procedure drawgauge(x1,y1:integer);									//прорисовка датчика давления
  procedure drawPiranigauge(x1,y1:integer);								//прорисовка датчика давления Пирани
  procedure piedraw(ugol:word);											//прорисовка сектора (положение заслонки)
  procedure drawflange(IM:timage);										//прорисовка нижнего фланца камеры
  procedure karuseldraw(ugol:word);										//прорисовка положения подложкодержателя-карусели
  
 //----------------------------------------- прочие вспомагательные процедуры --------------------------------------
  procedure shd_speed_refresh();										//обновление переменной au_Shd_speed
  procedure shd_accel_refresh();										//обновление переменной au_Shd_accel
  function timeinput(t:word):string;									//перевод времени в секундах в строку для отображения

implementation

var
drawarray:valvegrid;													//переменная - массив состояния системы

{$R *.dfm}

{======================================= процедуры отрисовки мнемо-схемы и индикации элементов ====================}

//--------------------------------------- прорисовка линий ---------------------------------------------------------
procedure drawlines(IM:timage; x1,y1,x2,y2,w,cl : integer);				//вводим название элемента TImage, координаты 
begin																	//начала и конца линии, ширину и цвет линии
  with frmmain do
  begin
  Im.Canvas.Pen.Width:=w;
  Im.Canvas.Pen.color:=cl;
  im.Canvas.MoveTo(x1,y1);
  Im.Canvas.LineTo(x2,y2);
  end;
end;
//--------------------------------------- прорисовка стрелочек (->) ------------------------------------------------
procedure drawarrow(x1,y1 : integer);									//вводим координаты стрелки
begin
  frmmain.Image1.Canvas.Pen.Width:=2;									
  frmmain.Image1.Canvas.Pen.color:=clblack;
  frmmain.image1.Canvas.MoveTo(x1,y1);									//		__\
  frmmain.Image1.Canvas.LineTo(x1-10,y1-10);							//		  /
  frmmain.image1.Canvas.MoveTo(x1,y1);
  frmmain.Image1.Canvas.LineTo(x1-10,y1+10);
end;
//--------------------------------------- прорисовка горизонтального клапана ---------------------------------------
procedure drawhvalve(IM:timage; x1,y1:integer);							//вводим координаты расположения клапана
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
//--------------------------------------- прорисовка вертикального клапана -----------------------------------------
procedure drawvvalve(IM:timage; x1,y1:integer);							//вводим координаты расположения клапана
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
//--------------------------------------- прорисовка датчика давления ----------------------------------------------
procedure drawgauge(x1,y1:integer);										//вводим координаты расположения датчика
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
//--------------------------------------- прорисовка датчика давления Пирани ---------------------------------------
procedure drawPiranigauge(x1,y1:integer);								//вводим координаты расположения датчика
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
//--------------------------------------- прорисовка патрубков газовой линии ---------------------------------------
procedure drawgaslines(IM:timage; x1,y1,x2,y2,w,cl : integer);			//вводим координаты начала и конца патрубка,
begin																	//толщину патрубка и цвет заполнения
  with frmmain do
  begin
  Im.Canvas.Pen.Width:=1;
  if (cl>0) and (x1<>x2) then											//если закрашиваем горизонтальную линию
  begin
    Im.Canvas.Pen.color:=clblack;
    im.Canvas.MoveTo(x1,y1-2);											//		______
    Im.Canvas.LineTo(x2+1,y2-2);										//		 цвет
    im.Canvas.MoveTo(x1+1,y1+1);										//		??????
    Im.Canvas.LineTo(x2+1,y2+1);
  end;
  if (cl>0) and (y1<>y2) then											//если закрашиваем вертикальную линию
  begin
    Im.Canvas.Pen.color:=clblack;
    im.Canvas.MoveTo(x1+1,y1);											//		| ц |
    Im.Canvas.LineTo(x2+1,y2+1);										//		| в |
    im.Canvas.MoveTo(x1-2,y1);											//		| е |
    Im.Canvas.LineTo(x2-2,y2+1);										//		| т |
  end;
  if (cl<1) and (x1<>x2) then											//если очищаем горизонтальную линию
  begin
    Im.Canvas.Pen.color:=clwhite;
    im.Canvas.MoveTo(x1+1,y1-2);										//		. . . .
    Im.Canvas.LineTo(x2+1,y2-2);										//		 белый
    im.Canvas.MoveTo(x1+1,y1+1);										//		. . . .
    Im.Canvas.LineTo(x2+1,y2+1);
  end;
  if (cl<1) and (y1<>y2) then											//если очищаем вертикальную линию
  begin
    Im.Canvas.Pen.color:=clwhite;
    im.Canvas.MoveTo(x1+1,y1);											//		. б .
    Im.Canvas.LineTo(x2+1,y2+1);										//		. е .
    im.Canvas.MoveTo(x1-2,y1);											//		. л .
    Im.Canvas.LineTo(x2-2,y2+1);										//		. ы .
  end;																	//		. й .
  drawlines(im,x1,y1,x2,y2,w,cl);
  end;
end;
//--------------------------------------- прорисовка лампочек ------------------------------------------------------
procedure rounddraw(IM:timage; x1,y1,x2,y2,num:integer; ar:valvegrid);	//вводим координаты, номер лампочки, 
var zvet:integer;														//массив состояния системы
begin
  with frmmain do
  begin
  if ar[Num] then														//если элемент активен,то
  begin
    Im.Canvas.Pen.Color:=32768;											//закрашиваем в зеленый цвет
    zvet:=32768;
  end
  else																	//иначе
  begin
    Im.Canvas.Pen.Color:=255;											//в красный цвет
    zvet:=255;
  end;
  Im.Canvas.ellipse(x1,y1,x2,y2);										//		 /???\
  Im.Canvas.Brush.Color:=zvet;											//		|	  |
  Im.Canvas.floodfill(x1+5,y1+5,zvet,fsborder);							//		 \___/
  end;
end;
//--------------------------------------- прорисовка нижнего фланца камеры -----------------------------------------
procedure drawflange(IM:timage);										//вводим название элемента TImage
begin
    Im.Canvas.Pen.Color:=clblack;
    Im.Canvas.Brush.Color:=RGB(200,191,231);							//изображаем расположение и форму
    Im.Canvas.Chord(20,20,260,260,280,59,0,59);							//технологических источников	
    Im.Canvas.Brush.Color:=RGB(195,195,195);							//на виде сверху
    Im.Canvas.Chord(20,20,260,260,0,59,280,59);
    Im.Canvas.Brush.Color:=RGB(255,201,14);
    im.Canvas.Ellipse(180,180,220,220);
    im.Canvas.Ellipse(60,180,100,220);
    im.Canvas.RoundRect(130,35,150,70,10,10);
    Im.Canvas.Brush.Color:=RGB(127,127,127);
    im.Canvas.RoundRect(134,21,146,37,0,0);
end;
//--------------------------------------- прорисовка сектора (положение заслонки) ----------------------------------
procedure piedraw(ugol:word);											//вводим угол поворота заслонки
var
grad:real;
x3,y3,x4,y4:word;
begin
  grad:=ugol*180/4692;      											//перевод в градусы из дискрет(мВ)
  grad:=grad/180*pi;                									//перевод из градусов в радианы
  x3:=round(sin(grad+pi/4)*100);										//находим отстояние от центра
  x3:=140+x3;                       									//абсолютная координата
  y3:=round(cos(grad+pi/4)*100);
  y3:=140-y3;
  x4:=round(sin(grad-pi/4)*100);
  x4:=140+x4;
  y4:=round(cos(grad-pi/4)*100);
  y4:=140-y4;
  frmmain.Image2.Canvas.Brush.Color:=RGB(112,146,190);
  frmmain.image2.canvas.Pie(30,30,250,250,x3,y3,x4,y4);					//рисуем сектор
  frmmain.Image2.Canvas.Brush.Color:=RGB(127,127,127);
  frmmain.Image2.canvas.Ellipse(126,126,154,154);						//рисуем ось вращения заслонки
end;
//--------------------------------------- прорисовка положения карусели --------------------------------------------
procedure karuseldraw(ugol:word);										//вводим угол поворота ШД (шагов)
var grad:real;
x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6: word;
begin
  grad:=ugol/800*360;													// перевод в градусы из шагов ШД
  grad:=grad/180*pi;													// перевод из градусов в радианы
  with frmmain do
  begin
  x1:=140+round(85*sin(grad));											//высчитываем координаты саттелитов карусели
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
  frmmain.Image3.canvas.Ellipse(126,126,154,154);						// рисуем ось вращения карусели
  image3.Canvas.pen.Width:=2;
  image3.Canvas.Brush.Color:=clred;
  frmmain.Image3.canvas.Ellipse(x1-25,y1-25,x1+25,y1+25);				// рисуем саттелит-индикатор положения
  image3.Canvas.Brush.Color:=RGB(112,146,190);
  frmmain.Image3.canvas.Ellipse(x2-25,y2-25,x2+25,y2+25);				// рисуем остальные саттелиты
  frmmain.Image3.canvas.Ellipse(x3-25,y3-25,x3+25,y3+25);
  frmmain.Image3.canvas.Ellipse(x4-25,y4-25,x4+25,y4+25);
  frmmain.Image3.canvas.Ellipse(x5-25,y5-25,x5+25,y5+25);
  frmmain.Image3.canvas.Ellipse(x6-25,y6-25,x6+25,y6+25);
  end;
end;
//--------------------------------------- прорисовка статических элементов схемы -----------------------------------
procedure draw();
begin
  with frmmain do
  begin
  drawlines(image1,74,160,230,160,2,0);									//рисуем газовую линию
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
  drawhvalve(image1,438,160);											//рисуем клапаны
  drawhvalve(image1,594,160);
  drawhvalve(image1,438,380);
  drawhvalve(image1,594,380);
  drawvvalve(image1,126,244);
  drawvvalve(image1,542,244);
  image1.Canvas.Brush.Color:=clwhite;
  image1.Canvas.Rectangle(230,108,386,212);								//рисуем РРГ2
  image1.Canvas.Rectangle(230,328,386,432);								//рисуем РРГ1
  image1.Canvas.Rectangle(230,83,256,109);
  image1.Canvas.Rectangle(230,303,256,329);
  Image1.Canvas.TextOut(235,113,'Задание');								//добавляем надписи
  Image1.Canvas.TextOut(290,113,'Выход');
  Image1.Canvas.TextOut(235,333,'Задание');
  Image1.Canvas.TextOut(290,333,'Выход');
  Image1.Canvas.TextOut(651,140,'К источнику ионов');
  Image1.Canvas.TextOut(280,303,'РРГ 1');
  Image1.Canvas.TextOut(280,83,'РРГ 2');
  
  drawlines(image1,742,105,842,105,2,0);								//Рисуем камеру
  drawlines(image1,742,110,752,110,2,0);
  drawlines(image1,832,110,842,110,2,0);
  drawlines(image1,752,110,752,210,2,0);
  drawlines(image1,832,110,832,210,2,0);
  drawlines(image1,742,210,752,210,2,0);
  drawlines(image1,832,210,842,210,2,0);
  drawlines(image1,742,215,842,215,2,0);
  drawlines(image1,832,185,884,185,2,0);
  drawlines(image1,884,185,884,380,2,0);
  drawgauge(812,105);													//рисуем датчик WRG
  image1.Canvas.TextOut(840,20,'Широкодиапазонный');
  image1.Canvas.TextOut(840,34,'датчик');
  image1.Canvas.Rectangle(858,354,910,406);								//рисуем ТМН
  image1.canvas.Ellipse(871,367,897,393);
  drawlines(image1,874,380,893,380,2,0);
  drawlines(image1,878,374,878,386,2,0);
  drawlines(image1,882,374,882,386,2,0);
  drawlines(image1,886,374,886,386,2,0);
  drawlines(image1,890,374,890,386,2,0);
  drawlines(image1,910,380,962,380,2,0);
  drawhvalve(image1,962,380);											//рисуем отсечной клапан
  drawlines(image1,1014,380,1118,380,2,0);
  image1.Canvas.Rectangle(1118,354,1170,406);							//рисуем ФВН
  image1.canvas.Ellipse(1131,367,1157,393);
  drawlines(image1,1160,374,1170,380,2,0);
  drawlines(image1,1160,386,1170,380,2,0);
  drawlines(image1,1170,380,1200,380,2,0);
  drawPiranigauge(1066,380);											//рисуем датчик APG
  image1.Canvas.TextOut(1094,295,'Датчик');
  image1.Canvas.TextOut(1094,309,'Пирани');
  drawlines(image1,884,302,897,302,2,0);								//клапан напуска атмосферы
  drawlines(image1,897,289,897,315,2,0);
  drawlines(image1,897,289,949,315,2,0);
  drawlines(image1,949,289,949,315,2,0);
  drawlines(image1,897,315,963,282,2,0);
  drawlines(image1,963,282,953,285,2,0);
  drawlines(image1,963,282,955,288,2,0);
  drawlines(image1,949,302,962,302,2,0);

  frmmain.Image2.Canvas.Pen.Width:=2;
  frmmain.Image3.Canvas.Pen.Width:=2;
  drawflange(frmmain.Image2);											// рисуем фланец на 2 канве
  drawflange(frmmain.Image3);											// рисуем фланец на 3 канве
  piedraw(0);															// рисуем заслонку в 0 положении
  
   image4.Canvas.Pen.Width:=2;											// здесь будет рисование дросселирующей заслонки
   image4.Canvas.Brush.Color:=RGB(200,191,231);							// на 4 канве
   image4.canvas.Ellipse(20,20,260,260);	
  end;
end;
//--------------------------------------- прорисовка инидкации состояния вакуумных элементов -----------------------
procedure drawvacuum(a:valvegrid);										//вводим массив состояния системы
begin
  with frmmain do
  begin
  if a[11] then															//если ФВН включен, выбираем зеленый цвет
    image1.canvas.Brush.Color:=32768
    else
    image1.canvas.Brush.Color:=255;										//иначе - красный
    image1.Canvas.FrameRect(rect(1119,355,1168,404));					//обводим элемент на схеме выбранным цветом
    image1.Canvas.FrameRect(rect(1120,356,1167,403));
    drawlines(image1,1160,374,1170,380,2,0);
    drawlines(image1,1160,386,1170,380,2,0);
    if a[12] then														//если ТМН включен, выбираем зеленый цвет
    image1.canvas.Brush.Color:=32768;
    if a[13] then														//если разгоняется или тормозится, 
    image1.canvas.Brush.Color:=clyellow;								//выбираем желтый цвет
    if a[14] then
    image1.canvas.Brush.Color:=clyellow;
    if not ((a[12]) or (a[13]) or (a[14])) then							//если выключен, выбираем красный цвет
    image1.canvas.Brush.Color:=255;
    image1.Canvas.FrameRect(rect(859,355,908,404));						//обводим элемент на схеме выбранным цветом 
    image1.Canvas.FrameRect(rect(860,356,907,403));		
    rounddraw(image1,981,334,994,347,11,drawarray);						//индикация отсечного клапана
    rounddraw(image1,918,275,931,288,11,drawarray);						//индикация клапана напуска атмосферы
    if a[11] then
    image1.Canvas.Brush.color:=clred
    else
    image1.Canvas.Brush.color:=clgreen;
    image1.Canvas.floodfill(923,280,clwhite,fsborder);					//инвертируем индикацию клапана напуска атмосферы
  end;
end;
//--------------------------------------- прорисовка инидкации состояния газовой линии -----------------------------
procedure drawstream(a:valvegrid);										//вводим массив состояния системы
var line1,line2,line3,line4:boolean;
begin
  line1:=false;
  line2:=false;
  line3:=false;
  line4:=false;
  with frmmain do
  begin
  Image1.canvas.Pen.Width:=2;											//рисуем лампочки состояния
  rounddraw(image1,80,263,93,276,1,a);									//клапанов и РРГ
  rounddraw(image1,457,114,470,127,2,a);
  rounddraw(image1,457,334,470,347,3,a);
  rounddraw(image1,496,263,509,276,4,a);
  rounddraw(image1,613,114,626,127,5,a);
  rounddraw(image1,613,334,626,347,6,a);
  rounddraw(image1,236,89,249,102,8,a);
  rounddraw(image1,236,309,249,322,7,a);

  drawgaslines(image1,74,160,228,160,2,0);								//очищаем патрубки газовой линии
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
																		//закрашиваем в соответствии с тем какой газ в патрубке
  if a[9] then		{проверяем стоит ли галочка индикации линии Аргона}
  begin
    drawgaslines(image1,74,160,228,160,2,65535);
    drawgaslines(image1,126,161,126,242,2,65535);
    if a[8] then		{проверяем ррг2}
    begin
      drawgaslines(image1,385,160,436,160,2,65535);
      if a[2] then		{проверяем клапан 2}
      begin
        drawgaslines(image1,490,160,592,160,2,65535);
        drawgaslines(image1,542,161,542,242,2,65535);
        line1:=true;
        if a[5] then		{проверяем клапан 5}
        begin
          drawgaslines(image1,646,160,750,160,2,65535);
          line2:=true;
        end;
        if a[4] then		{проверяем клапан 4}
        begin
          drawgaslines(image1,490,380,592,380,2,65535);
          drawgaslines(image1,542,297,542,378,2,65535);
          line3:=true;
          if a[6] then		{проверяем клапан 6}
          begin
            drawgaslines(image1,646,380,775,380,2,65535);
            drawgaslines(image1,775,216,775,380,2,65535);
            line4:=true;
          end;
        end;
      end;
    end;
    if a[1] then		{проверяем клапан 1}
    begin
      drawgaslines(image1,74,380,228,380,2,65535);
      drawgaslines(image1,126,297,126,378,2,65535);
      if a[7] then		{проверяем ррг 1}
      begin
        drawgaslines(image1,385,380,436,380,2,65535);
        if a[3] then		{проверяем клапан 3}
        begin
          drawgaslines(image1,490,380,592,380,2,65535);
          drawgaslines(image1,542,297,542,378,2,65535);
          if a[6] then		{проверяем клапан 6}
          drawgaslines(image1,646,380,775,380,2,65535);
          drawgaslines(image1,775,216,775,380,2,65535);
          if a[4] then		{проверяем клапан 4}
          begin
            drawgaslines(image1,490,160,592,160,2,65535);
            drawgaslines(image1,542,161,542,242,2,65535);
            if a[5] then		{проверяем клапан 5}
            drawgaslines(image1,646,160,750,160,2,65535);
          end;
        end;
      end;
    end;
  end;
  if a[10] then		{проверяем стоит ли галочка индикаци линии N2/O2}
  begin
    drawgaslines(image1,74,380,228,380,2,16711680);
    drawgaslines(image1,126,297,126,378,2,16711680);
    if a[1] then		{проверяем клапан 1}
    begin
      drawgaslines(image1,74,160,228,160,2,16711680);
      drawlines(image1,126,161,126,242,2,16711680);
      if a[8] then		{проверяем ррг2}
      begin
        drawgaslines(image1,385,160,436,160,2,16711680);
        if a[2] then		{проверяем клапан 2}
        begin
          drawgaslines(image1,490,160,592,160,2,16711680);
          drawgaslines(image1,542,161,542,242,2,16711680);
          if a[5] then		{проверяем клапан 5}
          begin
            drawgaslines(image1,646,160,750,160,2,16711680);
          end;
          if a[4] then		{проверяем клапан 4}
          begin
            drawgaslines(image1,490,380,592,380,2,16711680);
            drawgaslines(image1,542,297,542,378,2,16711680);
            if a[6] then		{проверяем клапан 6}
            begin
              drawgaslines(image1,646,380,775,380,2,16711680);
              drawgaslines(image1,775,216,775,380,2,16711680);
            end;
          end;
        end;
      end;
    end;
    if a[7] then		{проверяем ррг 1}
    begin
      drawgaslines(image1,385,380,436,380,2,16711680);
      if a[3] then		{проверяем клапан 3}
      begin
        drawgaslines(image1,490,380,592,380,2,16711680);
        drawgaslines(image1,542,297,542,378,2,16711680);
        if line3 then
        begin
          drawlines(image1,490,380,592,380,2,32768);
          drawlines(image1,542,297,542,378,2,32768);
        end;
        if a[6] then		{проверяем клапан 6}
        begin
          drawgaslines(image1,646,380,775,380,2,16711680);
          drawgaslines(image1,775,216,775,380,2,16711680);
          if line4 then
          drawgaslines(image1,646,380,775,380,2,32768);
          drawgaslines(image1,775,216,775,380,2,32768);
        end;
        if a[4] then		{проверяем клапан 4}
        begin
          drawgaslines(image1,490,160,592,160,2,16711680);
          drawgaslines(image1,542,161,542,242,2,16711680);
          if line1 then
          begin
            drawgaslines(image1,490,160,592,160,2,32768);
            drawgaslines(image1,542,161,542,242,2,32768);
          end;
          if a[5] then		{проверяем клапан 5}
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
  drawarrow(74,159);													//рисуем стрелочки в начале патрубков
  drawarrow(74,379);
end;

{======================================= прочие вспомогательные процедуры и функции ===============================}

//--------------------------------------- перевод времени из секунд в строку ЧЧ:ММ:СС ------------------------------
function timeinput(t:word):string;										//вводим время в секундах
var chasy, min, sek: byte;
stroka:string;
begin
   chasy := t div 3600;													//рассчитываем часы, минуты, секунды
   min := (t mod 3600) div 60;
   sek := t mod 60;
   if chasy>9 then														//формируем строку формата ЧЧ:ММ:СС
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
//--------------------------------------- обновление переменной au_Shd_speed ---------------------------------------
procedure shd_speed_refresh();
var per:word; per2:real;
begin
with frmmain do
begin
per2:=strtofloat(Shd_speed_edit.Text);									//записываем значение из окна "скорость ШД"
if Shd_speed_RadioGroup.ItemIndex=0 then								//если выбрана ед. изм. об/мин
per2:=per2*800/60;                         								//переводим из об/мин в шаг/сек (1 об. = 800 шагов)
if Shd_speed_RadioGroup.ItemIndex=1 then								//если выбрана ед. изм. об/сек
per2:=per2*800;                         								//переводим из об/сек в шаг/сек
per:=round(per2);                            							//округляем до целых
if per>20000 then per:=20000;											//ограничение максимумом (из докум. контроллера ШД)
if per<1 then per:=1;													//ограничиваем минимумом
au_Shd_speed:=per;														//обновляем глобальную переменную
if Shd_speed_RadioGroup.ItemIndex=2 then per2:=per;						//перевод в выбранный тип
if Shd_speed_RadioGroup.ItemIndex=1 then per2:=per/800;
if Shd_speed_RadioGroup.ItemIndex=0 then per2:=per*60/800;
Shd_speed_edit.Text:=floattostr(per2);									//обновляем значение окна "скорость ШД"
end;
end;
//--------------------------------------- обновление переменной au_Shd_accel ---------------------------------------
procedure shd_accel_refresh();
var per:word; per2:real;
begin
with frmmain do
begin
per2:=strtofloat(Shd_accel_edit.Text);									//записываем значение из окна "ускорение ШД"
if Shd_speed_RadioGroup.ItemIndex=0 then								//если выбрана ед. изм. об/мин
per2:=per2*800/60;														//переводим из об/мин в шаг/сек (1 об. = 800 шагов)
if Shd_speed_RadioGroup.ItemIndex=1 then								//если выбрана ед. изм. об/сек
per2:=per2*800;                         								//переводим из об/сек в шаг/сек
per:=round(per2);														//округляем до целых
if per>3000 then per:=3000;												//ограничение максимумом (из докум. контроллера ШД)
if per<1 then per:=1;													//ограничиваем минимумом
au_Shd_accel:=per;														//обновляем глобальную переменную
if Shd_speed_RadioGroup.ItemIndex=2 then per2:=per;						//перевод в выбранный тип
if Shd_speed_RadioGroup.ItemIndex=1 then per2:=per/800;
if Shd_speed_RadioGroup.ItemIndex=0 then per2:=per*60/800;
Shd_accel_edit.Text:=floattostr(per2);									//обновляем значение окна "ускорение ШД"
end;
end;

{======================================== Основная программа ======================================================}

//--------------------------------------- Процедура запуска программы ----------------------------------------------

procedure TfrmMain.FormCreate(Sender: TObject);
var
i:integer;
str:string;
myYear, myMonth, myDay: word;
begin
frmmain.Top:=150;														//устанавливаем параметры окна интерфейса
frmmain.Left:=300;
frmmain.Width:=1317;
frmmain.Height:=858;
draw;
for i := 1 to 14 do														//обнуляем массив состояния (все элементы неактивны)
drawarray[i]:=false;
frmmain.Archeckbox.Checked:=true;										//принудительно по умолчанию устанавливаем
frmmain.NOcheckbox.Checked:=true;										//индикацию газа в патрубках
drawstream(drawarray);													//отрисовываем состояние газовой линии
drawvacuum(drawarray);													//отрисовываем состояние вакуумных элементов
frmmain.Err_label.Visible:=false;										//делаем невидимыми окно ошибки
frmmain.Left_Label.Visible:=false;										//стрелки разгона/торможения ТМН
frmmain.Right_Label.Visible:=false;
frmmain.Produv_label.Visible:=false;									//окно состояния процесса продув газовой линии
frmmain.Produv_edit.Visible:=false;
frmmain.rrgradiogroup.itemindex:=2;										//выставляем по умолчанию выбранные позиции
frmmain.pressureradiogroup.itemindex:=2;								//элементов TRadioGroup
frmmain.Shd_speed_RadioGroup.ItemIndex:=2;
au_MFC1:=0;																//инициализируем переменные АУ
au_MFC2:=0;
au_servo1:=0;
au_servo2:=0;
au_Shd_speed:=200;
au_Shd_accel:=200;
error_buf:=0;
frmmain.VV_button.Enabled:=false;										//кнопку ВВ откачки делаем неактивной
frmmain.Timer2.Enabled:=false;											//выключаем таймер работы программы
frmmain.Timer_2Button.Enabled:=false;									//делаем неактивной кнопку остановки работы программы
mctPLC.Host := edtIPAddress.Text;										//устанавливаем IP адрес ПЛК: 172.16.11.228

																		// инициализация файла записи листинга работы программы
DecodeDate(Date, myYear, myMonth, myDay);								//определяем текущую дату
str:='C:\Users\NanoElion\Desktop\мвту\Листинг\'+inttostr(myMonth)+'.'+inttostr(myYear);
if not DirectoryExists(str) then										//если папка с именем текущего месяца и года не существует
if not createdir(str) then												//создаем папку
showmessage('ошибка при создании папки');
AssignFile(file_mem, str+'\'+inttostr(myDay)+'.ini');					//привязываем переменную к файлу с именем текущего дня в папке
if not fileexists(str+'\'+inttostr(myDay)+'.ini') then					//если файл с еще не был создан, то создаем
begin
Rewrite(file_mem);
Closefile(file_mem);
end;
end;

//--------------------------------------- Процедура срабатывания таймера программы ---------------------------------

//Таймер настроен не полсекунды. Благодаря переменной Tick_Write первый и каждый нечетный тик проводится считывание
//регистров памяти обмена с сервера и их обработка (цикл чтения), каждый четный тиепроводится запись в память обмена
//управляющих команд, параметров для их исполнения(цикл записи), а также запись регистра №20 (индикатор, что был
//произведен цикл записи), признак для сервера прочитать полученную команду.

procedure TfrmMain.Timer2Timer(Sender: TObject);
var per,per2: real;
i: integer;
smb:char;
str:string;
data: array of word;
begin

//======================================= обработка цикла чтения ===================================================
if not Tick_Write then													//если не цикл записи (цикл чтения)
 begin																	//начало цикла чтения
  WorkTime := WorkTime + 1;												//Увеличиваем текущее время работы
  try																	//попытаться прочесть регистры с нулевого 30 штук
    if mctPLC.ReadHoldingRegisters(0, 30, Share_Mem) then
      begin																//если прочитали, обновляем переменные
		R_Quants := Share_Mem[1];
//--------------------------------------- Обработка циклограммы ----------------------------------------------------
//состояние форвакуумной откачки
        if (R_Quants and masckon[1])<> 0 then							//Если процесс запущен
          begin
             drawarray[11]:=true;										//обновляем массив состояния
             frmmain.FV_timeedit.text:=timeinput(Worktime-fv_time);		//отображаем время процесса
			 if (WorkTime-fv_time>120) and (WorkTime-fv_time<300) then	//если после двух минут откачки
				if (Share_Mem[28] and masckon[7])<>0 then				//открыт 2 клапан
				if (Share_Mem[28] and masckon[8])<>0 then				//открыт 3 клапан
				if (Share_Mem[28] and masckon[10])<>0 then				//открыт 5 клапан
				if (Share_Mem[28] and masckon[11])<>0 then				//открыт 6 клапан
					Produv_flag:=true;									//отметка что газовая линия откачена
          end
          else															//Если процесс не запущен
          begin
             drawarray[11]:=false;										//обновляем массив состояния
             Produv_flag:=false;										//отметка что продув не завершен
			 fv_time:=Worktime+1;										//записали время старта для следующего цикла
          end;

//состояние высоковакуумной откачки
        if (R_Quants and masckon[2])<> 0 then							//Если процесс запущен
          begin
             drawarray[12]:=true;										//обновляем массив состояния
             frmmain.VV_timeedit.text:=timeinput(Worktime-vv_time);		//отображаем время процесса
          end
          else															//Если процесс не запущен
          begin
             drawarray[12]:=false;										//обновляем массив состояния
			 vv_time:=Worktime+1;										//записали время старта для следующего цикла
          end;

//состояние высоковакуумной откачки
        if (R_Quants and masckon[3])<> 0 then							//если ТМН разгоняется
          begin
             drawarray[13]:=true;										//обновляем массив состояния
             frmmain.Right_Label.Visible:=true;							//отображаем стрелочку изменения скорости ТМН
             frmmain.Razgon_VV_timeedit.text:=timeinput(Worktime-razgon_time);	//отображаем время процесса
          end
          else
          begin
             drawarray[13]:=false;										//обновляем массив состояния
             frmmain.Right_Label.Visible:=false;						//убираем стрелочку изменения скорости ТМН
			 razgon_time:=Worktime+1;									//записали время старта для следующего цикла
          end;

//состояние высоковакуумной откачки
        if (R_Quants and masckon[4])<> 0 then							//если ТМН тормозится
          begin
             drawarray[14]:=true;										//обновляем массив состояния
             frmmain.Left_Label.Visible:=true;							//отображаем стрелочку изменения скорости ТМН
             frmmain.ostanov_VV_timeedit.text:=timeinput(Worktime-ostanov_time);	//отображаем время процесса
          end
          else
          begin
             drawarray[14]:=false;										//обновляем массив состояния
             frmmain.Left_Label.Visible:=false;							//убираем стрелочку изменения скорости ТМН
			 ostanov_time:=Worktime+1;									//записали время старта для следующего цикла
          end;

//Состаяние продува газовой линейки
        if (R_Quants and masckon[7])<> 0 then							//Если процесс запущен
          begin
             frmmain.Produv_label.Visible:=true;						//отображаем окно состояния процесса
             frmmain.Produv_edit.Visible:=true;
             frmmain.Produv_edit.text:=timeinput(Worktime-Produv_time);	//отображаем время процесса
             if (Worktime-Produv_time)>290 then Produv_flag:=true;		//отметка что продув завершен
          end
          else
          begin
             frmmain.Produv_label.Visible:=false;						//скрываем окно состояния процесса
             frmmain.Produv_edit.Visible:=false;
             Produv_time:=Worktime+1;									//записали время старта для следующего цикла 
          end;
//--------------------------------------- Конец обработки циклограммы ----------------------------------------------

//--------------------------------------- Обработка индикации ------------------------------------------------------

//возможность нажать на кнопку ФВ откачка
        if (((R_Quants and masckon[4])<> 0)								//если включен ТМН или тормозится
        or ((R_Quants and masckon[2])<> 0))
        then frmmain.FV_button.Enabled:=false							//нельзя выключть ФВН
        else
        frmmain.FV_button.Enabled:=true;

//возможность нажать на кнопку ВВ откачка
		if ((((R_Quants and masckon[1])<> 0) and (Share_Mem[4]<2720) and	//если запущен ФВ насос, давление ниже требуемого,
		((WorkTime-fv_time)>300) and ((R_Quants and masckon[7]) = 0)) or	//прошло 5 минут откачки и процесс продува не активен
		((R_Quants and masckon[2])<> 0)) then								//или ВВ откачка уже идет
			frmmain.VV_button.Enabled:=true									//разрешаем включение/выключение насоса
		else
			frmmain.VV_button.Enabled:=false;
			
//возможность управления элементами газовой линии
		if (R_Quants and masckon[7])<> 0 then								//если запущен процесс продува
			begin
			frmmain.valve1button.enabled:=false;							//запрещаем закрытие клапанов и РРГ
			frmmain.valve2button.enabled:=false;							//гарантируя продув заговой линии
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

// скорость ТМН
		if (((R_Quants and masckon[4])<> 0)								//если вклюен ТМН или тормозится
		or ((R_Quants and masckon[2])<> 0)) then
			frmmain.TMN_progressbar.position:=Trunc(share_mem[2]*2.7/100)	//заполняем шкалу разгона (2.7 - мВ в дискрете)
		else frmmain.TMN_progressbar.position:=0; //иначе 0

//записываем давление APG:
		per:= Power(10, (Share_Mem[3]*0.002766)-6);						//переводим в мВ и в давление в мБар
		if per > 1000 then per := 1000;									//Если больше атмосферы, то атмосфера
		if per < 0.001 then per := 0.001;								//Если меньше 0,001 (предел датчика), то предел
		case pressureradiogroup.ItemIndex of							//переводим показание из мБар в выбранное пользователем
			0: per:=per;												//если выбраны мБар
			1: per:=100*per;											//если выбраны Па
			2: per:=per/1.333;											//если выбраны Торр
		end;
		apgedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//выодим давление на экран
		apgedit2.Text := FloatToStrF(per, ffExponent, 2, 1);
													//Power - воз. в степень, 0.0027 - перевод в мВ(см. ADAM manual appendix B)
													//2.766- поправка при переводе в мВ для повторяемости с TIC
													//floattostrF : 2 - число цифр в мантиссе, 1 - число цифр в порядке

//записываем давление WRG:
		per := Power(10, (Share_Mem[4]*1.5*0.002766)-12);				//переводим в мВ и в давление в мБар
		if per > 1000 then per := 1000;									//Если больше атмосферы, то атмосфера
		case pressureradiogroup.ItemIndex of							//переводим показание из мБар в выбранное пользователем
			0: per:=per;												//если выбраны мБар
			1: per:=100*per;											//если выбраны Па
			2: per:=per/1.333;											//если выбраны Торр
		end;
		wrgedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//выодим давление на экран
		wrgedit2.Text := FloatToStrF(per, ffExponent, 2, 1);

//записываем давление CVM:
		per := Power(10, (Share_Mem[7]*0.0027)-4.875);					//переводим в мВ и в давление в мБар
		if per > 1000 then per := 1000;									//Если больше атмосферы, то атмосфера
		case pressureradiogroup.ItemIndex of							//переводим показание из мБар в выбранное пользователем
			0: per:=per;												//если выбраны мБар
			1: per:=100*per;											//если выбраны Па
			2: per:=per/1.333;											//если выбраны Торр
		end;
		cvmedit.Text := FloatToStrF(per, ffExponent, 2, 1);				//выодим давление на экран
		cvmedit2.Text := FloatToStrF(per, ffExponent, 2, 1);

//записываем поток РРГ1
		if (R_Quants and masckon[5])<> 0 then							//если процесс напуска активен
			R_ac_MFC1 := Share_Mem[5]									//то обновляем переменную
		else															//иначе	присваиваем 0
			R_ac_MFC1 :=0;
		per2:=round(R_ac_MFC1*2.7);										//перевод в мВ и округление
		case rrgradiogroup.ItemIndex of									//переводим из мВ в выбранный тип
			0: per:=per2;												//если выбраны мВ
			1: per:=per2/250;											//если выбраны sccm (5В = 20 sccm)
			2: per:=per2*0.06048/250;									//если выбраны л/час (перевод верен для N2)
		end;															//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);											//округляем до 2 знаков после запятой
		rrg1controledit.Text:=floattostr(per);							//выводим значение потока на экран
		
//записываем поток РРГ2
		if (R_Quants and masckon[6])<> 0 then							//если процесс напуска активен
			R_ac_MFC2 := Share_Mem[6]									//то обновляем переменную
		else															//иначе присваиваем 0
			R_ac_MFC2 :=0;
		per2:=round(R_ac_MFC2*2.7);										//перевод в мВ и округление
		case rrgradiogroup.ItemIndex of									//переводим из мВ в выбранный тип
			0: per:=per2;												//если выбраны мВ
			1: per:=per2/50;											//если выбраны sccm (5В = 100 sccm)
			2: per:=per2*0.06048/50;									//если выбраны л/час (перевод верен для N2)
		end;															//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);											//округляем до 2 знаков после запятой
		rrg2controledit.Text:=floattostr(per);							//выводим значение потока на экран

//вывод отладочной информации		
		memo1.Lines.Add(floattostr(Share_Mem[3]));						//выводим показания АК в дисркретах
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

//записываем символы принятые контроллером ШД, для отладки работы COM-порта
		if (Share_Mem[14] = 10) or (Share_Mem[14] = 13) then smb:=' '	//если передается символ новой строки,то ' '
		else smb:=Chr(Share_Mem[14]);									//иначе записываем символ по его коду ASCII
		str:=Pgm_Rcv_memo.Lines[Pgm_Rcv_line];							//считываем текущую строку
		str:=str+smb;													//добавляем символ к строке
		if length(str)>10 then											//если длина строки больше 10
			begin
			Pgm_Rcv_memo.lines.add(smb);								//новый символ записываем на следующую строку
			Pgm_Rcv_line:=Pgm_Rcv_line+1;								//увеличиваем счетчик кол-ва строк
			end
		else
			Pgm_Rcv_memo.lines[Pgm_Rcv_line]:=str;						//иначе обновляем строку с новым символом

//записываем регистры ДК, ДУ, АУ сервоприводов
		rg_dc := Share_Mem[16];
		rg_du := Share_Mem[28];		
		au_servo1:= Share_Mem[29];
		au_servo2:= Share_Mem[30];

//прорисовываем состояние элементов на мнемо-схеме
		if (R_Quants and masckon[5])<> 0 then drawarray[7]:=true		//обновляем массив состояния
		else drawarray[7]:=false;										//в соответствии с состоянием
		if (R_Quants and masckon[6])<> 0 then drawarray[8]:=true		//обоих РРГ
		else drawarray[8]:=false;
		for i:=0 to 5 do
		if (rg_du and masckon[i+5])<>0 then								//обновляем массив состояния
			drawarray[i+1]:=true										//в соответствии с состоянием
		else															//клапанов газовой линии
			drawarray[i+1]:=false;
		drawstream(drawarray);											//прорисовываем индикацию элементов газовой линии
		drawvacuum(drawarray);											//прорисовываем инидикацию вакуумных элементов
		drawflange(image2);												//обновляем схему расположения
		piedraw(au_servo1);												//заслонки

//Обработка ошибок
		if ((not rg_dc) and masckon[0]) <> 0 then						//Если активен сигнал об ошибке с TIC
		Share_Mem[18]:=(Share_Mem[18] or masckon[0])					//записываем 1 в 1 бит регистра ошибок
		else Share_Mem[18]:=(Share_Mem[18] and masckoff[0]);			//иначе записываем 0
		for i:=0 to 5 do
		if (Share_Mem[18] and masckon[i]) <> 0 then						//отображаем список текущих ошибок на экране
			frmmain.ERR_Memo.lines[i]:=err_msg[i]
		else frmmain.ERR_Memo.lines[i]:='';
		if error_buf <> Share_Mem[18] then								//если появились новые ошибки
			begin
			frmmain.Err_label.visible:=true;							//отображаем сообщение об ошибке
			error_buf:=Share_Mem[18];									//обновляем буфер текущих ошибок
		end;
		if Share_Mem[21] <> 0 then ShowMessage('Не выполнена команда'	//если регистр команд не пуст
			+ IntToStr(Share_Mem[22]));									//(сервер не выполнил цикл чтения), сообщаем.
		
		end																//конец успешного чтения регистров
    else
      ShowMessage('Сбой чтения регистров PLC!');						//не удалось считать
  except
    ShowMessage('Исключение в цикле чтения регистров PLC!');			//исключение в цикле чтения
  end;																	//конец перехвата исключения при чтении регистров
 Tick_Write := True;													//Цикл чтения окончен
 end																	//конец цикла чтения регистров
 
//======================================= обработка цикла записи ===================================================

 else																	//цикл записи на сервер
  begin
  setlength(data,7);													//Готовим посылку на сервер
  data[0] := 20;														//это запишем в 20 регистр (цикл записи)
  data[1] := Cmd_Word;													//21	Присвоение команды
  Cmd_Word := 0;														//Очищаем команду
  data[2] := Dop_cmd;													//22	Параметр команды
  Dop_cmd:=0;															//очищаем параметр
  data[3] :=au_MFC1;													//23	задание РРГ1
  data[4] :=au_MFC2;													//24	задание РРГ2
  data[5] :=au_Shd_speed;												//25	скорость ШД
  data[6] :=au_Shd_accel;												//26	ускорение ШД
  Pagecontrol1.Enabled := True;											//активируем элементы формы (разрешаем прием новых команд)

  try																	//пытаемся записать регистры с 20(sharemem 20) 7 штук
    if not(mctPLC.WriteRegisters(Offset_Cmd, data)) then				//записываем с (Offset_Cmd = 20) регистра
      ShowMessage('Сбой записи регистров PLC!');
  except
    ShowMessage('Исключение в цикле записи регистров PLC!');
  end;																	//конец перехвата исключений при записи регистров
  
//--------------------------------------- Запись листинга памяти обмена в файл -------------------------------------
  for i:= 0 to 6 do
	Share_Mem[20+i]:=data[i];											//обновляем записанные в память регистры
  Reset(file_mem);														//открываем файл
  Seek(file_mem,filesize(file_mem));									//переходим в конец файла
  write(file_mem, Share_Mem);											//записываем текущую память обмена
  Closefile(file_mem);													//закрываем файл
  
  Tick_Write := False;													//цикл записи окончен
 end;																	//Конец цикла записи регистров
end;

{======================================== Процедуры обработки команд пользователя =================================}

//--------------------------------------- Кнопка форвакуумная откачка ----------------------------------------------
procedure Tfrmmain.FV_ButtonClick(Sender: TObject);
begin
if (R_Quants and masckon[1])<> 0 then									//Если процесс запущен
   begin
      cmd_word:=2;														//команда на выключение ФВН
      Dop_cmd:=1;
   end
   else
   begin
      cmd_word:=1;														//команда на включение
      Dop_cmd:=1;
   end;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
end;
//--------------------------------------- Кнопка высоковакуумная откачка ----------------------------------------------
procedure Tfrmmain.VV_buttonClick(Sender: TObject);
begin
if (R_Quants and masckon[2])<> 0 then									//Если процесс запущен
   begin
      cmd_word:=2;														//команда на выключение ТМН
      Dop_cmd:=2;
   end
   else
   begin
      cmd_word:=1;														//команда на включение
      Dop_cmd:=2;
   end;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
end;
//--------------------------------------- Опция автоматизации откачки ----------------------------------------------
procedure Tfrmmain.Auto_vacuum_checkboxClick(Sender: TObject);
begin
if frmmain.Auto_vacuum_checkbox.Checked then							//если после переключения галочка стоит
	cmd_word:=10														//команда на включение автоматизации
else
	cmd_word:=20;														//иначе - выключение
pagecontrol1.Enabled:=false;
end;
//--------------------------------------- Опция автоматизации продува газовой линии --------------------------------
procedure Tfrmmain.Auto_Produv_CheckBoxClick(Sender: TObject);
begin
try
if frmmain.Auto_Produv_checkbox.Checked then							//если после переключения галочка стоит
  begin
	cmd_word:=30;														//команда на включение автоматизации
  Dop_Cmd:=strtoint(frmmain.produv_time_Edit.Text);
  end
else
	cmd_word:=40;														//иначе - выключение
pagecontrol1.Enabled:=false;
except
	showmessage('Не удалось выполнить команду');
end;
end;
//--------------------------------------- Кнопки управления клапанами газовой линии --------------------------------
procedure TfrmMain.valve1buttonClick(Sender: TObject);
begin
cmd_word:=5;															//команда на переключение 1 клапана
Dop_cmd:=1;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
end;

procedure TfrmMain.valve2buttonClick(Sender: TObject);
begin
cmd_word:=5;															//команда на переключение 2 клапана
Dop_cmd:=2;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы
end;

procedure TfrmMain.Valve3buttonClick(Sender: TObject);
begin
cmd_word:=5;															//команда на переключение 3 клапана
Dop_cmd:=3;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы
end;

procedure TfrmMain.valve4buttonClick(Sender: TObject);
begin
cmd_word:=5;															//команда на переключение 4 клапана
Dop_cmd:=4;
pagecontrol1.Enabled:=false;											//деактивируем элементы формы
end;

procedure TfrmMain.Valve5buttonClick(Sender: TObject);
var
str:string;
begin
str:='Вы уверены, что газовая линия находится под вакуумом?';
if ((not Produv_flag) and ((R_Quants and masckon[2]) <> 0)) then		//если газовая линия не продувалась и включен ТМН
if messagedlg(str,mtWarning,[mbYES,mbNO],0)= mrYES then					//запрашиваем разрешение у пользователя
	Produv_flag:=true;
if ((Produv_flag) or ((R_Quants and masckon[2]) = 0)) then				//если ТМН выключен или газовая линия продувалась (откачивалась)
	begin
	cmd_word:=5;														//команда на переключение 5 клапана
	Dop_cmd:=5;
	pagecontrol1.Enabled:=false;										//деактивируем элементы формы
	end;
end;

procedure TfrmMain.valve6buttonClick(Sender: TObject);
var
str:string;
begin
str:='Вы уверены, что газовая линия находится под вакуумом?';
if ((not Produv_flag) and ((R_Quants and masckon[2]) <> 0)) then		//если газовая линия не продувалась и включен ТМН
if messagedlg(str,mtWarning,[mbYES,mbNO],0)= mrYES then					//запрашиваем разрешение у пользователя
	Produv_flag:=true;
if ((Produv_flag) or ((R_Quants and masckon[2]) = 0)) then				//если ТМН выключен или газовая линия продувалась (откачивалась)
	begin
	cmd_word:=5;														//команда на переключение 6 клапана
	Dop_cmd:=6;
	pagecontrol1.Enabled:=false;										//деактивируем элементы формы
	end;
end;

//--------------------------------------- Кнопки управления РРГ1 ---------------------------------------------------

procedure TfrmMain.rrg1okbuttonClick(Sender: TObject);
var per:real; per2:word;
	str:string;
begin
try
with frmmain do
per:=strtofloat(rrg1inedit.Text);											//считываем значение, которое хочет установить пользователь
rrg1inedit.Text:='';														//очищаем поле ввода значений
if per>=0 then																//если число больше 0
	begin
	if rrgradiogroup.ItemIndex=2 then per:=per*250/0.06048;					//переводим значение в мВ, если выбраны л/час
	if rrgradiogroup.ItemIndex=1 then per:=per*250;							//переводим значение в мВ, если выбраны sccm
	per2:=round(per);
	if per2>5000 then  per2:=5000;											//ограничиваем максимумом (5В = 20sccm)
	if per2/5+au_MFC2<=1500 then											//суммарный поток с 2-х РРГ д.б. менее 30 sccm
		begin																//per2/5 т.к. поток РРГ2 - (5В = 100sccm)
		au_MFC1:=per2;														//обновляем глобальную переменную
		case rrgradiogroup.Itemindex of										//переводим из мВ в выбранный тип
			0: per:=per2;													//если выбраны мВ
			1: per:=per2/250;												//если выбраны sccm
			2: per:=per2*0.06048/250;										//если выбраны л/час (перевод верен для N2)
		end;																//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);												//округляем до 2 знаков после запятой
		rrg1outedit.Text:=floattostr(per);									//выводим заданное значение потока на экран
		cmd_word:=3;														//команда на подачу управляющего напряжения на РРГ1
		pagecontrol1.Enabled:=false;										//деактивируем элементы формы (запрещаем прием новых команд) 
		end
	else
	begin
		str:='Суммарный поток не должен превышать 30 sccm. Вы уверены, что хотите продолжить?';
		if messagedlg(str,mtWarning,[mbYES,mbNO],0) = mrYES then			//запрашиваем разрешение у пользователя
		begin
		au_MFC1:=per2;														//обновляем глобальную переменную
		case rrgradiogroup.Itemindex of										//переводим из мВ в выбранный тип
			0: per:=per2;													//если выбраны мВ
			1: per:=per2/250;												//если выбраны sccm
			2: per:=per2*0.06048/250;										//если выбраны л/час (перевод верен для N2)
		end;																//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);												//округляем до 2 знаков после запятой
		rrg1outedit.Text:=floattostr(per);									//выводим заданное значение потока на экран
		cmd_word:=3;														//команда на подачу управляющего напряжения на РРГ1
		pagecontrol1.Enabled:=false;										//деактивируем элементы формы (запрещаем прием новых команд)
		end;
	end;
end;
except
	showmessage('Не удалось считать значение');
end;
end;

procedure TfrmMain.rrg1offbuttonClick(Sender: TObject);
begin
au_MFC1:=0;																	//задаем поток = 0
cmd_word:=3;																//команад на подачу управляющего напряжения на РРГ1
pagecontrol1.Enabled:=false;												//деактивируем элементы формы
frmmain.rrg1outedit.Text:='0';												//выводим нулевое значение потока на экран
end;
//--------------------------------------- Кнопки управления РРГ2 ---------------------------------------------------

procedure TfrmMain.rrg2okbuttonClick(Sender: TObject);
var per:real; per2:word;
str:string;
begin
try
with frmmain do
per:=strtofloat(rrg2inedit.Text);											//считываем значение, которое хочет установить пользователь
rrg2inedit.Text:='';														//очищаем поле ввода значений
if per>=0 then																//если число больше 0
	begin
	if rrgradiogroup.ItemIndex=2 then per:=per*50/0.06048;					//переводим значение в мВ, если выбраны л/час
	if rrgradiogroup.ItemIndex=1 then per:=per*50;							//переводим значение в мВ, если выбраны sccm
	per2:=round(per);
	if per2>5000 then  per2:=5000;										//ограничиваем максимумом (1,5В = 30sccm)
	if per2+au_MFC1/5<=1500 then											//суммарный поток с 2-х РРГ д.б. менее 30 sccm
	begin																	//au_MFC1/5 т.к. поток РРГ1 - (5В = 20sccm)
		au_MFC2:=per2;														//обновляем глобальную переменную
		case rrgradiogroup.ItemIndex of										//переводим из мВ в выбранный тип
			0: per:=per2;													//если выбраны мВ
			1: per:=per2/50;												//если выбраны sccm
			2: per:=per2*0.06048/50;										//если выбраны л/час (перевод верен для N2)
		end;																//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);												//округляем до 2 знаков после запятой
		rrg2outedit.Text:=floattostr(per);									//выводим заданное значение потока на экран
		cmd_word:=4;														//команда на подачу управляющего напряжения на РРГ2
		pagecontrol1.Enabled:=false;										//деактивируем элементы формы (запрещаем прием новых команд)
		end
	else
	begin
		str:='Суммарный поток не должен превышать 30 sccm. Вы уверены, что хотите продолжить?';
		if messagedlg(str,mtWarning,[mbYES,mbNO],0) = mrYES then			//запрашиваем разрешение у пользователя
		begin
		au_MFC2:=per2;														//обновляем глобальную переменную
		case rrgradiogroup.ItemIndex of										//переводим из мВ в выбранный тип
			0: per:=per2;													//если выбраны мВ
			1: per:=per2/50;												//если выбраны sccm
			2: per:=per2*0.06048/50;										//если выбраны л/час (перевод верен для N2)
		end;																//фактический поток аргона в 1.4 раза больше
		per:=roundto(per,-2);												//округляем до 2 знаков после запятой
		rrg2outedit.Text:=floattostr(per);									//выводим заданное значение потока на экран
		cmd_word:=4;														//команда на подачу управляющего напряжения на РРГ2
		pagecontrol1.Enabled:=false;										//деактивируем элементы формы (запрещаем прием новых команд)
		end;
	end;
end;
except
	showmessage('Не удалось считать значение');
end;
end;

 procedure TfrmMain.rrg2offbuttonClick(Sender: TObject);
begin
au_MFC2:=0;																	//задаем поток = 0
cmd_word:=4;																//команад на подачу управляющего напряжения на РРГ2
pagecontrol1.Enabled:=false;												//деактивируем элементы формы
frmmain.rrg2outedit.Text:='0';												//выводим нулевое значение потока на экран
end;
//--------------------------------------- Кнопки управления сервоприводом заслонки ---------------------------------

procedure Tfrmmain.servo1_buttonClick(Sender: TObject);						//задание положения сервопривода в градусах
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//считываем значение, которое хочет установить пользователь
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then per:=0;													//ограничиваем минимумом 0 градусов
	servo1_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=6;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
except
	showmessage('Не удалось выполнить команду');
end;
end;

procedure Tfrmmain.Minus_BitBtn1Click(Sender: TObject);						//поворот сервопривода на 1 градус по часовой стрелке
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//считываем текущее записанное значение положения
	Per:=Per-1;																//уменьшаем на 1 градус
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then  per:=0;													//ограничиваем минимумом 0 градусов
	servo1_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=6;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Не удалось выполнить команду');
end;
end;

procedure Tfrmmain.Plus_BitBtn1Click(Sender: TObject);						//поворот сервопривода на 1 градус против часовой стрелки
var
per:real;
begin
try
	per:=strtofloat(servo1_edit.Text);										//считываем текущее записанное значение положения
	Per:=Per+1;																//увеличиваем на 1 градус
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then  per:=0;													//ограничиваем минимумом 0 градусов
	servo1_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=6;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Не удалось выполнить команду');
end;
end;
//--------------------------------------- Кнопки управления сервоприводом дросселирования --------------------------

procedure Tfrmmain.servo2_buttonClick(Sender: TObject);						//задание положения сервопривода в градусах
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//считываем значение, которое хочет установить пользователь
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then per:=0;													//ограничиваем минимумом 0 градусов
	servo2_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=7;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
except
	showmessage('Не удалось выполнить команду');
end;
end;

procedure Tfrmmain.Minus_BitBtn2Click(Sender: TObject);						//поворот сервопривода на 1 градус по часовой стрелке
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//считываем текущее записанное значение положения
	Per:=Per-1;																//уменьшаем на 1 градус
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then  per:=0;													//ограничиваем минимумом 0 градусов
	servo2_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=7;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Не удалось выполнить команду');
end;
end;

procedure Tfrmmain.Plus_BitBtn2Click(Sender: TObject);						//поворот сервопривода на 1 градус против часовой стрелки
var
per:real;
begin
try
	per:=strtofloat(servo2_edit.Text);										//считываем текущее записанное значение положения
	Per:=Per+1;																//увеличиваем на 1 градус
	if per>120 then per:=120;												//ограничиваем максимумом в 120 гардусов
	if per<0 then  per:=0;													//ограничиваем минимумом 0 градусов
	servo2_edit.text:=floattostr(per);										//выводим заданное значение на экран
	per:=per/120*4379;														//перевод из градусов в 0..4379 мВ, значение подобрано
	Dop_cmd:=round(per);													//и соответствует 0-960 дискрет для сервоконтроллера
	cmd_word:=7;															//команда на подачу управляющего напряжения 
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Не удалось выполнить команду');
end;
end;
//======================================= Кнопки управления шаговым двигателем =====================================

//--------------------------------------- Кнопка отправки символа на контроллер ШД через COM-порт ПЛК --------------

procedure Tfrmmain.shd_buttonClick(Sender: TObject);						//используется для отладки отправки команд
var
per2: word;
per: char;
begin
per:=shd_edit.text[1];														//считываем символ, который хотим отправить
per2:=ord(per);																//находим его код ASCII
cmd_word:=51;																//команда на отправку символа
Dop_cmd:=per2;																//параметр - код символа
pagecontrol1.Enabled:=false;												//деактивируем элементы формы (запрещаем прием новых команд)
showmessage(inttostr(per2));												//выводим сообщение с кодом символа
end;
//--------------------------------------- Кнопки вращения ШД с заданной скоростью ----------------------------------

procedure Tfrmmain.Go_Right_BtnClick(Sender: TObject);						//вращение по часовой стрелке
begin
try
	shd_speed_refresh();													//обновляем параметр заданной скорости
	shd_accel_refresh();													//обновляем параметр заданного ускорения
	cmd_word:=52;															//команда на разгон до заданной скорости
	Dop_cmd:=1;																// и постоянного вращения
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
except
	showmessage('Ошибка ввода параметра');
end;
end;

procedure Tfrmmain.Go_Left_BtnClick(Sender: TObject);						//вращение против часовой стрелки
begin
try
	shd_speed_refresh();													//обновляем параметр заданной скорости
	shd_accel_refresh();													//обновляем параметр заданного ускорения
	cmd_word:=52;															//команда на разгон до заданной скорости
	Dop_cmd:=2;																// и постоянного вращения
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Ошибка ввода параметра');
end;
end;
//--------------------------------------- Кнопки остановки ШД  -----------------------------------------------------

procedure Tfrmmain.Shd_stop_buttonClick(Sender: TObject);
begin
cmd_word:=53;																//команад остановить ШД
pagecontrol1.Enabled:=false;												//деактивируем элементы формы (запрещаем прием новых команд)
end;

procedure Tfrmmain.Shd_stop_button2Click(Sender: TObject);
begin
cmd_word:=53;																//команад остановить ШД
pagecontrol1.Enabled:=false;												//деактивируем элементы формы
end;
//--------------------------------------- Кнопка перемещения ШД по координате --------------------------------------

procedure Tfrmmain.Shd_move_ButtonClick(Sender: TObject);
var per:word;
begin
try																			//переводим заданное положение
	per:=round(strtofloat(Shd_position_Edit.text)/0.45);					//из градусов в шаги (1 шаг = 0,45 градусов)
	if per>800 then per:=800;												//ограничиваем максимумом (360° = 800 шагов)
	cmd_word:=54;															//команда на перемещение
	Dop_cmd:=per;															//параметр - координата
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы (запрещаем прием новых команд)
except
	showmessage('Ошибка ввода параметра');
end;
end;
//--------------------------------------- Кнопки перемещения ШД на заданное кол-во шагов ---------------------------

procedure Tfrmmain.Step_right_BtnClick(Sender: TObject);					//по часовой стрелке
var per:word;
begin
try
	per:=round(strtofloat(Shd_step_edit.text));								//считываем на сколько шагов пользователь хочет повернуть
	if per<1 then per:=1;													//ограничиваем минимумом в 1 шаг
	cmd_word:=55;															//команда на поворот
	Dop_cmd:=per;															//параметр - число шагов
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Ошибка ввода параметра');
end;
end;

procedure Tfrmmain.Step_left_BtnClick(Sender: TObject);						//против часовой
var per:word;
begin
try
	per:=round(strtofloat(Shd_step_edit.text));								//считываем на сколько шагов пользователь хочет повернуть
	if per<1 then per:=1;													//ограничиваем минимумом в 1 шаг
	cmd_word:=56;															//команда на поворот
	Dop_cmd:=per;															//параметр - число шагов
	pagecontrol1.Enabled:=false;											//деактивируем элементы формы
except
	showmessage('Ошибка ввода параметра');
end;
end;
//--------------------------------------- Кнопка задать сканирующее движение ШД ------------------------------------

procedure Tfrmmain.Shd_scan_buttonClick(Sender: TObject);
var per:word; per2:real;
begin
try
	shd_speed_refresh();													//обновляем параметр заданной скорости
	shd_accel_refresh();													//обновляем параметр заданного ускорения
	per:=round(strtofloat(Shd_scan_edit.text)/0.45);						//переводим заданный сектор сканирования в шаги
	per2:=(au_Shd_speed*au_Shd_speed)/au_Shd_accel;							//t=v/a; 2S=at^2=v^2/a; (сумма участков разгона и
	if per>per2+1 then														//торможения 2S д.б. меньше сектора); max V=1095 шаг/с
		begin
		cmd_word:=57;														//команда на сканирующее движение
		Dop_cmd:=per;														//параметр - сектор в шагах
		pagecontrol1.Enabled:=false;										//деактивируем элементы формы (запрещаем прием новых команд)
		end
	else
		showmessage('Сектор слишком мал для разгона до заданной скорости');
except
	showmessage('Ошибка ввода параметра');
end;
end;
//--------------------------------------- Кнопка возврата в положение HOME------------------------------------------
procedure Tfrmmain.shd_home_ButtonClick(Sender: TObject);
begin
  cmd_word:=58;
  pagecontrol1.Enabled:=false;
end;
//--------------------------------------- Кнопка заврешение работы программы ПЛК -----------------------------------

procedure Tfrmmain.PLC_close_ButtonClick(Sender: TObject);
var data: array of word;
begin
if R_Quants = 0 then														//если все процессы остановлены
	begin
	setlength(data,2);														//готовим посылку на сервер
	data[0] := 20;															//это запишем в 20 регистр (цикл записи)
	data[1] := 100;															//21    Присвоение команды на звершение работы
	try																		//пытаемся записать регистры с 20(sharemem 20) 2 штук
		if not(mctPLC.WriteRegisters(Offset_Cmd, data)) then				//записываем с (Offset_Cmd = 20) регистра
			ShowMessage('Сбой записи регистров PLC!');
	except
		ShowMessage('Исключение в цикле записи регистров PLC!');
	end;																	//конец попытки записи на сервер
	end
else
	showmessage('Все процессы должны быть завершены.');
end;
//--------------------------------------- Кнопка аварийной остановки откачки ---------------------------------------

procedure TfrmMain.stopbuttonClick(Sender: TObject);
var
  Data: Array of Word;
begin
	SetLength(Data, 2);														//готовим посылку на сервер
	Data[0]:=20;																//это запишем в 20 регистр (цикл записи)
	Data[1]:=1000;															//21    Присвоение команды на остановку откачки
  	try																		//пытаемся записать регистры с 20(sharemem 20) 2 штук
		if not(mctPLC.WriteRegisters(Offset_cmd, Data)) then				//записываем с (Offset_Cmd = 20) регистра
			MessageDlg('Сбой передачи команды!', mtError, [mbOk], 0);		//сообщаем, если не удалось записать команду
		Pagecontrol1.Enabled := False;										//деактивируем элементы формы (запрещаем прием новых команд)
	except
		ShowMessage('Исключение в цикле записи регистров PLC!');
	end;																	//конец попытки записи на сервер
end;

{======================================== Процедуры взаимодейтсвия с элементами интерфейса ========================}

//--------------------------------------- кнопки запуска и остановки работы программы ------------------------------

procedure Tfrmmain.Timer_ButtonClick(Sender: TObject);						//запуск программы
begin
frmmain.Timer2.Enabled:= not frmmain.Timer2.Enabled;						//включаем таймер
frmmain.Timer_2Button.Enabled:=true;										//активируем кнопку выключения
frmmain.Timer_Button.Enabled:=false;										//деактивируем кнопку включения
frmmain.PLC_close_Button.Enabled:=false;									//деактивируем кнопку завершения работы программы ПЛК
end;

procedure Tfrmmain.Timer_2ButtonClick(Sender: TObject);						//останов программы
begin
frmmain.Timer2.Enabled:= not frmmain.Timer2.Enabled;						//выключаем таймер
frmmain.Timer_2Button.Enabled:=false;										//деактивируем кнопку выключения
frmmain.Timer_Button.Enabled:=true;											//активируем кнопку включения
frmmain.PLC_close_Button.Enabled:=true;										//активируем кнопку завершения работы программы ПЛК
end;
//--------------------------------------- панели радиокнопок единиц измерения давления -----------------------------

procedure Tfrmmain.pressureradiogroupClick(Sender: TObject);
begin
with frmmain do
if pressureradiogroup.ItemIndex=0 then										//меняем надписи единиц измерения
begin																		//в зависимости от выбранной опции
   apglabel.Caption:='мБар';												//значения обновятся в цикле чтения
   wrglabel.Caption:='мБар';
   cvmlabel.Caption:='мБар';
   apglabel2.Caption:='мБар';
   wrglabel2.Caption:='мБар';
   cvmlabel2.Caption:='мБар';
end;
if pressureradiogroup.ItemIndex=1 then
begin
   apglabel.Caption:='Па';
   wrglabel.Caption:='Па';
   cvmlabel.Caption:='Па';
   apglabel2.Caption:='Па';
   wrglabel2.Caption:='Па';
   cvmlabel2.Caption:='Па';
end;
if pressureradiogroup.ItemIndex=2 then
begin
   apglabel.Caption:='Торр';
   wrglabel.Caption:='Торр';
   cvmlabel.Caption:='Торр';
   apglabel2.Caption:='Торр';
   wrglabel2.Caption:='Торр';
   cvmlabel2.Caption:='Торр';
end;
end;

procedure Tfrmmain.pressureradiogroup2Click(Sender: TObject);				//панель выбора единиц измерения давления
begin																		//на 2 окне интерфейса
with frmmain do
case pressureradiogroup2.ItemIndex of										//изменяет выбранную опцию аналогичной
0: pressureradiogroup.ItemIndex:=0;											//панели на 1 окне интерфейса
1: pressureradiogroup.ItemIndex:=1;
2: pressureradiogroup.ItemIndex:=2;
end;
end;
//--------------------------------------- панель радиокнопок единиц измерения потока РРГ ---------------------------

procedure Tfrmmain.rrgradiogroupClick(Sender: TObject);
var per:real;
begin
with frmmain do
if rrgradiogroup.ItemIndex=0 then											//меняем надписи единиц измерения
begin																		//в зависимости от выбранной опции
  rrg1out.Text:='мВ';														//значения АК обновятся в цикле чтения
  rrg2out.Text:='мВ';
  rrg2max.Text:='0..1500';
  rrg1max.Text:='0..5000';
  rrg1outedit.Text:=inttostr(au_MFC1);										//обновляем отображаемые значения АУ
  rrg2outedit.Text:=inttostr(au_MFC2);										//если выбраны мВ
end;
if rrgradiogroup.ItemIndex=1 then
begin
  rrg1out.Text:='sccm';
  rrg2out.Text:='sccm';
  rrg2max.Text:='0..30';
  rrg1max.Text:='0..20';
  per:=roundto(au_MFC1/250,-2);												//обновляем отображаемые значения АУ
  rrg1outedit.Text:=floattostr(per);										//если выбраны sccm
  per:=roundto(au_MFC2/50,-2);
  rrg2outedit.Text:=floattostr(per);
end;
if rrgradiogroup.ItemIndex=2 then
begin
  rrg1out.Text:='л/час';
  rrg2out.Text:='л/час';
  rrg2max.Text:='0..1,81';
  rrg1max.Text:='0..1,21';
  per:=roundto(au_MFC1*0.06048/250,-2);										//обновляем отображаемые значения АУ
  rrg1outedit.Text:=floattostr(per);										//если выбраны л/час
  per:=roundto(au_MFC2*0.06048/50,-2);
  rrg2outedit.Text:=floattostr(per);
end;
end;
//--------------------------------------- панель радиокнопок единиц измерения скорости вращения ШД -----------------

procedure Tfrmmain.Shd_speed_RadioGroupClick(Sender: TObject);
var per,per2:real;
begin
with frmmain do
if Shd_speed_RadioGroup.ItemIndex=0 then									//меняем надписи единиц измерения
begin																		//в зависимости от выбранной опции
   Shd_speed_label.Caption:='об/мин';
   Shd_accel_label.Caption:='об/мин';
   Shd_speed_range_label.Caption:='Скорость (0..1 500):';
   Shd_accel_range_label.Caption:='Ускорение (0..225):';
   per:=au_Shd_speed;
   per2:=au_Shd_accel;														//если выбраны об/мин
   per:=per*60/800;															//переводим в об/мин (1	об = 800 шагов)
   per2:=per2*60/800;
   Shd_speed_edit.Text:=floattostr(per);									//обновляем отображаемые значения
   Shd_accel_edit.Text:=floattostr(per2);
end;
if Shd_speed_RadioGroup.ItemIndex=1 then
begin
   Shd_speed_label.Caption:='об/сек';
   Shd_accel_label.Caption:='об/сек';
   Shd_speed_range_label.Caption:='Скорость (0..25):';
   Shd_accel_range_label.Caption:='Ускорение (0..3,75):';
   per:=au_Shd_speed;
   per2:=au_Shd_accel;														//если выбраны об/сек
   per:=per/800;															//переводим в об/сек (1	об = 800 шагов)
   per2:=per2/800;
   Shd_speed_edit.Text:=floattostr(per);									//обновляем отображаемые значения
   Shd_accel_edit.Text:=floattostr(per2);
end;
if Shd_speed_RadioGroup.ItemIndex=2 then
begin
   Shd_speed_label.Caption:='шаг/сек';
   Shd_accel_label.Caption:='шаг/сек';
   Shd_speed_range_label.Caption:='Скорость (0..20 000):';
   Shd_accel_range_label.Caption:='Ускорение (0..3 000):';
   Shd_speed_edit.Text:=floattostr(au_Shd_speed);							//если выбраны шаг/сек
   Shd_accel_edit.Text:=floattostr(au_Shd_accel);							//обновляем отображаемые значения
end;
end;
//--------------------------------------- флажки отображения газов в газовой линии ---------------------------------

procedure TfrmMain.ArcheckboxClick(Sender: TObject);						//если ставим (убираем) галочку Ar
begin
drawarray[9]:= not drawarray[9];											//меняем массив состояния
end;

procedure TfrmMain.NOcheckboxClick(Sender: TObject);						//если ставим (убираем) галочку N2/O2
begin
drawarray[10]:= not drawarray[10];											//меняем массив состояния
end;
//--------------------------------------- панель сообщения о появлении ошибки --------------------------------------

procedure Tfrmmain.Err_labelClick(Sender: TObject);							//при нажатии на панель
begin
frmmain.PageControl1.ActivePageIndex:=2;									//открываем вкладку с окном описания текущих ошибок
frmmain.ERR_label.Visible:=false;											//убираем панель
end;
//--------------------------------------- изменение текущей вкладки интерфейса -------------------------------------

procedure Tfrmmain.PageControl1Change(Sender: TObject);
begin
if frmmain.PageControl1.ActivePageIndex=2 then								//при самостоятельном открытии вкладки с ошибками
frmmain.Err_label.Visible:=false;											//убираем панель сообщения об ошибки, если была
end;
//--------------------------------------- закрытие программы -------------------------------------------------------

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
var str:string;
begin
str:='Вы уверены что хотите выйти?';
if messagedlg(str,mtWarning,[mbOK,mbCancel],0)= mrOk						//выводим диалоговое окно подтверждения
then action:= caFree
else action:=caNone;
end;

{======================================== Процедуры обработки отладочных команд ===================================}

//--------------------------------------- Кнопка считывания регистров ПЛК ------------------------------------------

procedure TfrmMain.readbuttonClick(Sender: TObject);
var
  Data: array[0..31] of Word;
  iAmount: Integer;
  i: Integer;
  sLine: String;
begin
    mctPLC.Host := edtIPAddress.Text;										//задаем IP адресс сервера
	iAmount := 30;															//считываем 30 регистров
    if mctPLC.ReadHoldingRegisters(0, iAmount, Data) then					//в созданный массив Data с нулевого
    begin
      sLine := 'Register value(s) read:';									
      for i := 0 to (iAmount - 1) do
		sLine := sLine +													//каждый регистр записываем
                 #13#10'     ' +											//с новой строки
                 IntToStr(0 + i) +											//записываем номер
                 ': 0x'  +
                 IntToHex(Data[i], 4);										//записываем значение
      ShowMessage(sLine);													//выводим сообщение на экран
    end
    else
		ShowMessage('PLC read operation failed!');
end;
//--------------------------------------- Кнопка записи регистра ПЛК -----------------------------------------------

procedure Tfrmmain.WritebuttonClick(Sender: TObject);
var Reg_number,write_data: word;
begin
try
	Reg_number:=strtoint(frmmain.writeregedit.Text);						//счтываем номер регистра, в который будем записывать
	write_data:=strtoint(frmmain.Writedataedit.Text);						//считываем значение, которое хотим записать
	mctPLC.WriteRegisters(Reg_number,write_data);							//записываем
except
	showmessage('Не удалось считать значение');
end;
end;
end.	{------------------------------------------- Конец программы ----------------------------------------------}
