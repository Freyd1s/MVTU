object Form1: TForm1
  Left = 920
  Top = 263
  Width = 788
  Height = 443
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Open_Button: TButton
    Left = 208
    Top = 176
    Width = 121
    Height = 81
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = Open_ButtonClick
  end
  object Load_Button: TButton
    Left = 400
    Top = 176
    Width = 121
    Height = 81
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
    TabOrder = 1
    OnClick = Load_ButtonClick
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 96
    Top = 24
  end
end
