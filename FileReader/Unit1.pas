unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, math;

const
  Cadr_Size = 31;     //������ �����

type

  TCadr = array [0..Cadr_Size] of Word;

  TForm1 = class(TForm)
    Open_Button: TButton;
    Load_Button: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Open_ButtonClick(Sender: TObject);
    procedure Load_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  Share_Mem: TCadr;                        //������ ������
  File_mem: File of Tcadr;                 //������ ������ � ����
  donefile: Textfile;                                       
  str: string;
  masckon : array [0..15] of Word = (1, 2, 4, 8, 16, 32, 64, 128, 256,
512, 1024, 2048, 4096, 8192, 16384, 32768);

implementation

{$R *.dfm}

procedure TForm1.Open_ButtonClick(Sender: TObject);
begin

if OpenDialog1.Execute then
AssignFile(file_mem,OpenDialog1.FileName);

end;

procedure TForm1.Load_ButtonClick(Sender: TObject);
var i:integer;
    BUF_str:string;
    per:real;
begin

if SaveDialog1.Execute then
AssignFile(donefile,SaveDialog1.FileName);
Rewrite(donefile);

Reset(file_mem);
while (not EOF(file_mem)) do
	begin
	Read(file_mem, Share_Mem);
	str:='';
	for i:=1 to Cadr_Size do
		begin
      case i of
        2: begin                                                //�������� ���
             if (((Share_Mem[1] and masckon[4])<> 0)            //���� ������ ��� ��� ����������
             or ((Share_Mem[1] and masckon[2])<> 0)) then
             BUF_str:=inttostr(Trunc(share_mem[2]*2.7/100))
             else BUF_str:='0';                                  //����� 0
           end;
        3: begin                                                //�������� APG
             per:= Power(10, (Share_Mem[3]*0.002766)-6);        //�� �������� APG
             if per > 1000 then per := 1000;	                  //���� ������ ���������, �� ���������
             if per < 0.001 then per := 0.001;	                // ���� ������ 0,001
             BUF_str:=FloatToStrF(per, ffExponent, 2, 1);
           end;
        4:  begin                                               //�������� WRG
              per := Power(10, (Share_Mem[4]*1.5*0.002766)-12);//�� �������� WRG
              if per > 1000 then per := 1000;	                  //���� ������ ���������, �� ���������
              BUF_str:=FloatToStrF(per, ffExponent, 2, 1);
            end;
        5: begin                                               //������ ���� ���1
            if (Share_Mem[1] and masckon[5])<> 0 then          //���� ������� ������� �������
              begin
              per:=round(Share_Mem[5]*2.7);                    //������� � �� � ����������
              per:=per/250;                                    //������� � sccm
              per:=roundto(per,-2);
              BUF_str:=floattostr(per);                        //����������
              end
            else
              BUF_str:='0';                                    //����� 0
           end;
        6: begin                                               //������ ���� ���2
            if (Share_Mem[1] and masckon[6])<> 0 then          //���� ������� ������� �������
              begin
              per:=round(Share_Mem[6]*2.7);                    //������� � �� � ����������
              per:=per/50;                                    //������� � sccm
              per:=roundto(per,-2);
              BUF_str:=floattostr(per);                        //����������
              end
            else
              BUF_str:='0';                                    //����� 0
           end;
        7: begin                                               //�������� CVM
              per := Power(10, (Share_Mem[7]*0.0027)-4.875);//�� �������� CVM
              if per > 1000 then per := 1000;	//���� ������ ���������, �� ���������
              BUF_str:=FloatToStrF(per, ffExponent, 2, 1);
            end;
      else
        BUF_str:=inttostr(Share_Mem[i]);
      end;
		str:=str+BUF_str+';';
		end;
	writeln(donefile,str);
	end;

Closefile(file_mem);

Closefile(donefile);

end;

end.
