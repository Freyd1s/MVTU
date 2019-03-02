program MVTU;

uses
  Forms,
  MVTU_10 in 'MVTU_10.pas' {frmmain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.Run;
end.
