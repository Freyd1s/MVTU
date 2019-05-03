object frmmain: Tfrmmain
  Left = 211
  Top = 851
  Width = 1316
  Height = 858
  Caption = #1052#1042#1058#1059'_11-1'#1052#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1298
    Height = 818
    ActivePage = TabSheet2
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1042#1072#1082#1091#1091#1084#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
      ImageIndex = 1
      object Image1: TImage
        Left = 4
        Top = 48
        Width = 1249
        Height = 473
      end
      object Produv_label: TLabel
        Left = 416
        Top = 88
        Width = 83
        Height = 23
        Caption = #1055#1088#1086#1076#1091#1074#1082#1072
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label34: TLabel
        Left = 824
        Top = 552
        Width = 126
        Height = 13
        Caption = #1074#1074#1077#1076#1080#1090#1077' '#1074#1088#1077#1084#1103' '#1087#1088#1086#1076#1091#1074#1072':'
      end
      object Label35: TLabel
        Left = 864
        Top = 579
        Width = 17
        Height = 13
        Caption = #1089#1077#1082
      end
      object rrg1inedit: TEdit
        Left = 237
        Top = 445
        Width = 44
        Height = 21
        TabOrder = 0
      end
      object rrg2out: TEdit
        Left = 344
        Top = 180
        Width = 35
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = #1051'/'#1095#1072#1089
      end
      object rrg1outedit: TEdit
        Left = 237
        Top = 400
        Width = 44
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '0'
      end
      object rrg2outedit: TEdit
        Left = 237
        Top = 180
        Width = 44
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
      object rrg2inedit: TEdit
        Left = 237
        Top = 223
        Width = 44
        Height = 21
        TabOrder = 4
      end
      object rrg1out: TEdit
        Left = 344
        Top = 400
        Width = 35
        Height = 21
        ReadOnly = True
        TabOrder = 5
        Text = #1051'/'#1095#1072#1089
      end
      object rrg2max: TEdit
        Left = 287
        Top = 223
        Width = 56
        Height = 21
        ReadOnly = True
        TabOrder = 6
        Text = '0..1,81'
      end
      object rrg1max: TEdit
        Left = 287
        Top = 445
        Width = 56
        Height = 21
        ReadOnly = True
        TabOrder = 7
        Text = '0..1,21'
      end
      object valve6button: TButton
        Left = 595
        Top = 448
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 6'
        TabOrder = 8
        OnClick = valve6buttonClick
      end
      object rrg1okbutton: TButton
        Left = 349
        Top = 442
        Width = 25
        Height = 25
        Caption = 'OK'
        TabOrder = 9
        OnClick = rrg1okbuttonClick
      end
      object Archeckbox: TCheckBox
        Left = 15
        Top = 151
        Width = 42
        Height = 17
        Caption = 'Ar'
        TabOrder = 10
        OnClick = ArcheckboxClick
      end
      object rrg2okbutton: TButton
        Left = 349
        Top = 220
        Width = 25
        Height = 25
        Caption = 'OK'
        TabOrder = 11
        OnClick = rrg2okbuttonClick
      end
      object rrg2offbutton: TButton
        Left = 324
        Top = 130
        Width = 55
        Height = 18
        Caption = 'Off'
        TabOrder = 12
        OnClick = rrg2offbuttonClick
      end
      object rrg1offbutton: TButton
        Left = 324
        Top = 350
        Width = 55
        Height = 18
        Caption = 'Off'
        TabOrder = 13
        OnClick = rrg1offbuttonClick
      end
      object NOcheckbox: TCheckBox
        Left = 15
        Top = 368
        Width = 58
        Height = 17
        Caption = 'N2/O2'
        TabOrder = 14
        OnClick = NOcheckboxClick
      end
      object valve4button: TButton
        Left = 560
        Top = 309
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 4'
        TabOrder = 15
        OnClick = valve4buttonClick
      end
      object Valve5button: TButton
        Left = 595
        Top = 227
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 5'
        TabOrder = 16
        OnClick = Valve5buttonClick
      end
      object Valve3button: TButton
        Left = 439
        Top = 448
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 3'
        TabOrder = 17
        OnClick = Valve3buttonClick
      end
      object valve1button: TButton
        Left = 144
        Top = 309
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 1'
        TabOrder = 18
        OnClick = valve1buttonClick
      end
      object valve2button: TButton
        Left = 439
        Top = 227
        Width = 55
        Height = 20
        Caption = #1050#1083#1072#1087#1072#1085' 2'
        TabOrder = 19
        OnClick = valve2buttonClick
      end
      object rrgradiogroup: TRadioGroup
        Left = 934
        Top = 639
        Width = 104
        Height = 105
        Caption = #1042#1099#1093#1086#1076' '#1056#1056#1043
        Items.Strings = (
          #1084#1042
          'Sccm'
          #1051'/'#1095)
        TabOrder = 20
        OnClick = rrgradiogroupClick
      end
      object rrg2controledit: TEdit
        Left = 292
        Top = 180
        Width = 44
        Height = 21
        ReadOnly = True
        TabOrder = 21
        Text = '0'
      end
      object rrg1controledit: TEdit
        Left = 292
        Top = 400
        Width = 45
        Height = 21
        ReadOnly = True
        TabOrder = 22
        Text = '0'
      end
      object pressureradiogroup: TRadioGroup
        Left = 816
        Top = 639
        Width = 104
        Height = 105
        Caption = #1044#1072#1074#1083#1077#1085#1080#1077
        Items.Strings = (
          #1084#1041#1072#1088
          #1055#1072
          #1058#1086#1088#1088)
        TabOrder = 23
        OnClick = pressureradiogroupClick
      end
      object Panel1: TPanel
        Left = 3
        Top = 528
        Width = 260
        Height = 252
        BevelWidth = 2
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        object Label10: TLabel
          Left = 62
          Top = 16
          Width = 127
          Height = 16
          Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1090#1082#1072#1095#1082#1086#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object FV_Button: TButton
          Left = 27
          Top = 71
          Width = 177
          Height = 25
          Caption = #1060#1086#1088#1074#1072#1082#1091#1091#1084#1085#1072#1103' '#1086#1090#1082#1072#1095#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = FV_ButtonClick
        end
        object VV_button: TButton
          Left = 27
          Top = 118
          Width = 177
          Height = 25
          Caption = #1042#1099#1089#1086#1082#1086#1074#1072#1082#1091#1091#1084#1085#1072#1103' '#1086#1090#1082#1072#1095#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = VV_buttonClick
        end
        object Auto_vacuum_checkbox: TCheckBox
          Left = 27
          Top = 182
          Width = 177
          Height = 17
          Caption = #1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1086#1090#1082#1072#1095#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Auto_vacuum_checkboxClick
        end
        object Auto_Produv_CheckBox: TCheckBox
          Left = 27
          Top = 159
          Width = 177
          Height = 17
          Caption = #1087#1088#1086#1076#1091#1074#1082#1072' '#1075#1072#1079#1086#1074#1086#1081' '#1083#1080#1085#1077#1081#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Auto_Produv_CheckBoxClick
        end
      end
      object Panel2: TPanel
        Left = 268
        Top = 528
        Width = 520
        Height = 252
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 25
        object Label4: TLabel
          Left = 18
          Top = 71
          Width = 119
          Height = 13
          Caption = #1060#1086#1088#1074#1072#1082#1091#1091#1084#1085#1072#1103' '#1086#1090#1082#1072#1095#1082#1072
        end
        object Label8: TLabel
          Left = 19
          Top = 106
          Width = 58
          Height = 13
          Caption = #1056#1072#1079#1075#1086#1085' '#1058#1052#1053
        end
        object Label6: TLabel
          Left = 18
          Top = 141
          Width = 136
          Height = 13
          Caption = #1042#1099#1089#1086#1082#1086#1074#1072#1082#1091#1091#1084#1085#1072#1103' '#1086#1090#1082#1072#1095#1082#1072
        end
        object Label9: TLabel
          Left = 18
          Top = 176
          Width = 67
          Height = 13
          Caption = #1054#1089#1090#1072#1085#1086#1074' '#1058#1052#1053
        end
        object Label5: TLabel
          Left = 104
          Top = 37
          Width = 71
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099
        end
        object label2: TLabel
          Left = 301
          Top = 71
          Width = 20
          Height = 13
          Caption = 'APG'
        end
        object label3: TLabel
          Left = 301
          Top = 106
          Width = 24
          Height = 13
          Caption = 'WRG'
        end
        object label_TMN: TLabel
          Left = 368
          Top = 177
          Width = 72
          Height = 13
          Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1058#1052#1053
        end
        object apglabel: TLabel
          Left = 471
          Top = 72
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object wrglabel: TLabel
          Left = 471
          Top = 107
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object Label11: TLabel
          Left = 210
          Top = 16
          Width = 105
          Height = 16
          Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1086#1090#1082#1072#1095#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 373
          Top = 37
          Width = 50
          Height = 13
          Caption = #1044#1072#1074#1083#1077#1085#1080#1077
        end
        object Left_Label: TLabel
          Left = 312
          Top = 210
          Width = 24
          Height = 13
          Caption = '<<<'
        end
        object Right_Label: TLabel
          Left = 472
          Top = 210
          Width = 24
          Height = 13
          Caption = '>>>'
        end
        object Label27: TLabel
          Left = 301
          Top = 141
          Width = 21
          Height = 13
          Caption = 'CVM'
        end
        object cvmlabel: TLabel
          Left = 471
          Top = 142
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object FV_timeedit: TEdit
          Left = 171
          Top = 69
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object Razgon_VV_timeedit: TEdit
          Left = 171
          Top = 104
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object VV_timeedit: TEdit
          Left = 171
          Top = 139
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = '0'
        end
        object Ostanov_VV_timeedit: TEdit
          Left = 171
          Top = 174
          Width = 97
          Height = 21
          ReadOnly = True
          TabOrder = 3
          Text = '0'
        end
        object apgedit: TEdit
          Left = 344
          Top = 69
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object wrgedit: TEdit
          Left = 344
          Top = 104
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 5
        end
        object TMN_progressbar: TProgressBar
          Left = 344
          Top = 209
          Width = 121
          Height = 17
          Smooth = True
          Step = 1
          TabOrder = 6
        end
        object cvmedit: TEdit
          Left = 344
          Top = 139
          Width = 121
          Height = 21
          TabOrder = 7
        end
      end
      object Produv_edit: TEdit
        Left = 512
        Top = 88
        Width = 89
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
      end
      object produv_time_Edit: TEdit
        Left = 824
        Top = 576
        Width = 33
        Height = 21
        TabOrder = 27
        Text = '300'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      ImageIndex = 2
      object Image2: TImage
        Left = 50
        Top = 70
        Width = 280
        Height = 280
      end
      object Image3: TImage
        Left = 488
        Top = 70
        Width = 280
        Height = 280
      end
      object Image4: TImage
        Left = 925
        Top = 70
        Width = 280
        Height = 280
      end
      object Panel3: TPanel
        Left = 50
        Top = 402
        Width = 255
        Height = 297
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 6
          Top = 8
          Width = 185
          Height = 97
          Caption = #1055#1086#1083#1086#1078#1077#1085#1077' '#1079#1072#1089#1083#1086#1085#1082#1080' '#1074' '#1075#1088#1072#1076#1091#1089#1072#1093
          TabOrder = 0
          object Minus_BitBtn1: TBitBtn
            Left = 16
            Top = 24
            Width = 25
            Height = 25
            TabOrder = 0
            OnClick = Minus_BitBtn1Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object Plus_BitBtn1: TBitBtn
            Left = 144
            Top = 24
            Width = 25
            Height = 25
            TabOrder = 1
            OnClick = Plus_BitBtn1Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object servo1_edit: TEdit
            Left = 67
            Top = 28
            Width = 54
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object servo1_button: TButton
            Left = 54
            Top = 56
            Width = 75
            Height = 25
            Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
            TabOrder = 3
            OnClick = servo1_buttonClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 6
          Top = 128
          Width = 238
          Height = 158
          Caption = #1058#1086#1095#1085#1086#1077' '#1087#1086#1079#1080#1094#1080#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 1
          object Label13: TLabel
            Left = 8
            Top = 40
            Width = 55
            Height = 13
            Caption = #1052#1072#1075#1085#1077#1090#1088#1086#1085
          end
          object Label14: TLabel
            Left = 16
            Top = 80
            Width = 14
            Height = 13
            Caption = #1048#1048
          end
          object Label16: TLabel
            Left = 16
            Top = 120
            Width = 21
            Height = 13
            Caption = #1069#1051#1048
          end
          object Button1: TButton
            Left = 72
            Top = 32
            Width = 75
            Height = 25
            Caption = #1054#1090#1082#1088#1099#1090#1100
            TabOrder = 0
          end
          object Button2: TButton
            Left = 152
            Top = 32
            Width = 75
            Height = 25
            Caption = #1047#1072#1082#1088#1099#1090#1100
            TabOrder = 1
          end
          object Button3: TButton
            Left = 72
            Top = 72
            Width = 75
            Height = 25
            Caption = #1054#1090#1082#1088#1099#1090#1100
            TabOrder = 2
          end
          object Button4: TButton
            Left = 152
            Top = 72
            Width = 75
            Height = 25
            Caption = #1047#1072#1082#1088#1099#1090#1100
            TabOrder = 3
          end
          object Button5: TButton
            Left = 72
            Top = 112
            Width = 75
            Height = 25
            Caption = #1054#1090#1082#1088#1099#1090#1100
            TabOrder = 4
          end
          object Button6: TButton
            Left = 152
            Top = 112
            Width = 75
            Height = 25
            Caption = #1047#1072#1082#1088#1099#1090#1100
            TabOrder = 5
          end
        end
      end
      object Panel4: TPanel
        Left = 360
        Top = 402
        Width = 545
        Height = 297
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 6
          Top = 8
          Width = 124
          Height = 145
          Caption = #1053#1077#1087#1088#1077#1088#1099#1074#1085#1086#1077' '#1076#1074'-'#1077':'
          TabOrder = 0
          object Go_Right_Btn: TBitBtn
            Left = 66
            Top = 22
            Width = 33
            Height = 31
            TabOrder = 0
            OnClick = Go_Right_BtnClick
            Glyph.Data = {
              C2070000424DC20700000000000036000000280000001B000000170000000100
              1800000000008C07000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483F
              CC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000FFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000CC483FCC483F
              CC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFF000000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFF00
              0000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000CC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFF000000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF000000CC48
              3FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483F000000CC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483F000000FFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFCC483F
              CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000}
          end
          object Go_Left_Btn: TBitBtn
            Left = 24
            Top = 22
            Width = 33
            Height = 31
            TabOrder = 1
            OnClick = Go_Left_BtnClick
            Glyph.Data = {
              C2070000424DC20700000000000036000000280000001B000000170000000100
              1800000000008C07000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483F
              FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF000000FFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483F000000FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483F
              CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F00
              0000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F000000FFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483F000000FFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F000000CC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483F000000CC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000}
          end
          object Shd_stop_button: TButton
            Left = 24
            Top = 110
            Width = 75
            Height = 25
            Caption = #1057#1090#1086#1087
            TabOrder = 2
            OnClick = Shd_stop_buttonClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 283
          Top = 168
          Width = 251
          Height = 118
          Caption = #1058#1086#1095#1085#1072#1103' '#1087#1086#1076#1089#1090#1088#1086#1081#1082#1072':'
          TabOrder = 1
          object Label25: TLabel
            Left = 7
            Top = 28
            Width = 114
            Height = 13
            Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' (0..360'#176'):'
          end
          object Label15: TLabel
            Left = 8
            Top = 72
            Width = 98
            Height = 13
            Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1072#1075#1086#1074':'
          end
          object Shd_position_Edit: TEdit
            Left = 40
            Top = 47
            Width = 41
            Height = 21
            TabOrder = 0
            Text = '0'
          end
          object Shd_move_Button: TButton
            Left = 142
            Top = 44
            Width = 83
            Height = 25
            Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
            TabOrder = 1
            OnClick = Shd_move_ButtonClick
          end
          object Step_right_Btn: TBitBtn
            Left = 192
            Top = 74
            Width = 33
            Height = 31
            TabOrder = 2
            OnClick = Step_right_BtnClick
            Glyph.Data = {
              C2070000424DC20700000000000036000000280000001B000000170000000100
              1800000000008C07000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483F
              CC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000FFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000CC483FCC483F
              CC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFF000000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFF00
              0000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000CC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FFFFFFFFFFFFF000000CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF000000CC48
              3FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483F000000CC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483F000000FFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFCC483F
              CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000}
          end
          object Step_left_Btn: TBitBtn
            Left = 142
            Top = 74
            Width = 33
            Height = 31
            TabOrder = 3
            OnClick = Step_left_BtnClick
            Glyph.Data = {
              C2070000424DC20700000000000036000000280000001B000000170000000100
              1800000000008C07000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483F
              FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF000000FFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FCC483FCC483F000000FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483F
              CC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F00
              0000FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F000000FFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483F000000FFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F000000CC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCC483FCC483FCC483F000000CC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FFFFFFF000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483F
              CC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC48
              3FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000}
          end
          object Shd_step_edit: TEdit
            Left = 40
            Top = 88
            Width = 41
            Height = 21
            TabOrder = 4
            Text = '0'
          end
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 168
          Width = 251
          Height = 118
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1086#1088#1090#1086#1084':'
          TabOrder = 2
          object shd_button: TButton
            Left = 8
            Top = 48
            Width = 105
            Height = 25
            Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1080#1084#1074#1086#1083
            TabOrder = 0
            OnClick = shd_buttonClick
          end
          object shd_edit: TEdit
            Left = 120
            Top = 50
            Width = 41
            Height = 21
            TabOrder = 1
          end
          object Pgm_Rcv_memo: TMemo
            Left = 168
            Top = 16
            Width = 73
            Height = 89
            Lines.Strings = (
              '')
            TabOrder = 2
          end
        end
        object GroupBox7: TGroupBox
          Left = 378
          Top = 8
          Width = 124
          Height = 145
          Caption = #1057#1082#1072#1085#1080#1088#1091#1102#1097#1077#1077' '#1076#1074'-'#1077':'
          TabOrder = 3
          object Label30: TLabel
            Left = 16
            Top = 32
            Width = 89
            Height = 13
            Caption = #1057#1077#1082#1090#1086#1088' (0..360'#176'):'
          end
          object Shd_scan_Edit: TEdit
            Left = 36
            Top = 56
            Width = 49
            Height = 21
            TabOrder = 0
            Text = '0'
          end
          object Shd_scan_button: TButton
            Left = 24
            Top = 80
            Width = 75
            Height = 25
            Caption = #1057#1090#1072#1088#1090
            TabOrder = 1
            OnClick = Shd_scan_buttonClick
          end
          object Shd_stop_button2: TButton
            Left = 24
            Top = 112
            Width = 75
            Height = 25
            Caption = #1057#1090#1086#1087
            TabOrder = 2
            OnClick = Shd_stop_button2Click
          end
        end
        object GroupBox8: TGroupBox
          Left = 137
          Top = 8
          Width = 233
          Height = 145
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1074#1080#1078#1077#1085#1080#1103':'
          TabOrder = 4
          object Shd_speed_range_label: TLabel
            Left = 8
            Top = 32
            Width = 110
            Height = 13
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100' (0..20 000):'
          end
          object Shd_speed_Label: TLabel
            Left = 64
            Top = 59
            Width = 34
            Height = 13
            Caption = #1086#1073'/'#1084#1080#1085
          end
          object Shd_accel_range_label: TLabel
            Left = 8
            Top = 88
            Width = 110
            Height = 13
            Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1077' (0..3 000):'
          end
          object Shd_accel_Label: TLabel
            Left = 64
            Top = 115
            Width = 34
            Height = 13
            Caption = #1086#1073'/'#1084#1080#1085
          end
          object Shd_speed_RadioGroup: TRadioGroup
            Left = 137
            Top = 32
            Width = 88
            Height = 73
            Caption = #1057#1082#1086#1088#1086#1089#1090#1100
            ItemIndex = 0
            Items.Strings = (
              #1086#1073'. / '#1084#1080#1085'.'
              #1086#1073'. / '#1089#1077#1082'.'
              #1096#1072#1075' / '#1089#1077#1082'.')
            TabOrder = 0
            OnClick = Shd_speed_RadioGroupClick
          end
          object Shd_speed_edit: TEdit
            Left = 8
            Top = 56
            Width = 49
            Height = 21
            TabOrder = 1
            Text = '200'
          end
          object Shd_accel_edit: TEdit
            Left = 8
            Top = 112
            Width = 49
            Height = 21
            TabOrder = 2
            Text = '200'
          end
        end
      end
      object Panel5: TPanel
        Left = 950
        Top = 402
        Width = 255
        Height = 223
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 2
        object Label17: TLabel
          Left = 16
          Top = 131
          Width = 20
          Height = 13
          Caption = 'APG'
        end
        object Label24: TLabel
          Left = 16
          Top = 163
          Width = 24
          Height = 13
          Caption = 'WRG'
        end
        object apglabel2: TLabel
          Left = 112
          Top = 131
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object wrglabel2: TLabel
          Left = 112
          Top = 163
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object Label26: TLabel
          Left = 16
          Top = 195
          Width = 21
          Height = 13
          Caption = 'CVM'
        end
        object cvmlabel2: TLabel
          Left = 112
          Top = 195
          Width = 24
          Height = 13
          Caption = #1084#1041#1072#1088
        end
        object pressureradiogroup2: TRadioGroup
          Left = 160
          Top = 123
          Width = 81
          Height = 87
          Caption = #1044#1072#1074#1083#1077#1085#1080#1077
          Items.Strings = (
            #1084#1041#1072#1088
            #1055#1072
            #1058#1086#1088#1088)
          TabOrder = 0
          OnClick = pressureradiogroup2Click
        end
        object apgedit2: TEdit
          Left = 48
          Top = 128
          Width = 57
          Height = 21
          TabOrder = 1
        end
        object wrgedit2: TEdit
          Left = 48
          Top = 160
          Width = 57
          Height = 21
          TabOrder = 2
        end
        object GroupBox6: TGroupBox
          Left = 6
          Top = 16
          Width = 185
          Height = 97
          Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' '#1079#1072#1089#1083#1086#1085#1082#1080' '#1074' '#1075#1088#1072#1076#1091#1089#1072#1093
          TabOrder = 3
          object Minus_BitBtn2: TBitBtn
            Left = 24
            Top = 24
            Width = 25
            Height = 25
            TabOrder = 0
            OnClick = Minus_BitBtn2Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object Plus_BitBtn2: TBitBtn
            Left = 136
            Top = 24
            Width = 25
            Height = 25
            TabOrder = 1
            OnClick = Plus_BitBtn2Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
              CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
              3FCC483FCC483FCC483FFFFFFFCC483FCC483FCC483FCC483FCC483FCC483FCC
              483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC483FCC
              483FCC483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCC483FCC483FCC483FCC483FFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              483FCC483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object servo2_edit: TEdit
            Left = 64
            Top = 32
            Width = 54
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object servo2_button: TButton
            Left = 56
            Top = 64
            Width = 75
            Height = 25
            Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
            TabOrder = 3
            OnClick = servo2_buttonClick
          end
        end
        object cvmedit2: TEdit
          Left = 48
          Top = 192
          Width = 57
          Height = 21
          TabOrder = 4
        end
      end
      object Button7: TButton
        Left = 776
        Top = 584
        Width = 113
        Height = 25
        Caption = #1053#1091#1083#1077#1074#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
        TabOrder = 3
        OnClick = shd_home_ButtonClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1074#1103#1079#1100
      ImageIndex = 2
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 104
        Height = 13
        Caption = 'IP address of the PLC'
      end
      object Label7: TLabel
        Left = 968
        Top = 112
        Width = 180
        Height = 19
        Caption = #1041#1091#1092#1077#1088' '#1090#1077#1082#1091#1097#1080#1093' '#1086#1096#1080#1073#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtIPAddress: TEdit
        Left = 120
        Top = 8
        Width = 137
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '172.16.11.241'
      end
      object ERR_Memo: TMemo
        Left = 968
        Top = 150
        Width = 249
        Height = 115
        Lines.Strings = (
          ''
          ''
          ''
          ''
          ''
          '')
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 56
        Top = 376
        Width = 689
        Height = 369
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 2
        object Label23: TLabel
          Left = 608
          Top = 72
          Width = 21
          Height = 13
          Caption = 'CVM'
        end
        object Label22: TLabel
          Left = 495
          Top = 72
          Width = 30
          Height = 13
          Caption = 'Speed'
        end
        object Label21: TLabel
          Left = 384
          Top = 72
          Width = 27
          Height = 13
          Caption = 'RRG2'
        end
        object Label20: TLabel
          Left = 280
          Top = 72
          Width = 27
          Height = 13
          Caption = 'RRG1'
        end
        object Label19: TLabel
          Left = 176
          Top = 72
          Width = 24
          Height = 13
          Caption = 'WRG'
        end
        object Label18: TLabel
          Left = 64
          Top = 72
          Width = 20
          Height = 13
          Caption = 'APG'
        end
        object Label36: TLabel
          Left = 200
          Top = 16
          Width = 289
          Height = 19
          Caption = #1057#1077#1082#1094#1080#1103' '#1086#1090#1083#1072#1076#1082#1080' '#1089#1080#1075#1085#1072#1083#1086#1074' '#1040#1050' ('#1076#1080#1089#1082#1088#1077#1090')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Memo1: TMemo
          Left = 32
          Top = 97
          Width = 89
          Height = 240
          Lines.Strings = (
            'APG')
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 144
          Top = 96
          Width = 89
          Height = 237
          Lines.Strings = (
            'WRG')
          TabOrder = 1
        end
        object Memo3: TMemo
          Left = 255
          Top = 96
          Width = 82
          Height = 237
          Lines.Strings = (
            'RRG1')
          TabOrder = 2
        end
        object Memo4: TMemo
          Left = 360
          Top = 96
          Width = 81
          Height = 237
          Lines.Strings = (
            'RRG2')
          TabOrder = 3
        end
        object Memo5: TMemo
          Left = 468
          Top = 96
          Width = 85
          Height = 237
          Lines.Strings = (
            'Speed')
          TabOrder = 4
        end
        object Memo6: TMemo
          Left = 580
          Top = 96
          Width = 81
          Height = 237
          Lines.Strings = (
            'CVM')
          TabOrder = 5
        end
      end
      object Panel7: TPanel
        Left = 56
        Top = 80
        Width = 313
        Height = 241
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 3
        object Label33: TLabel
          Left = 24
          Top = 128
          Width = 124
          Height = 19
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1055#1051#1050':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 24
          Top = 24
          Width = 171
          Height = 19
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1080#1085#1090#1077#1088#1092#1077#1081#1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Timer_2Button: TButton
          Left = 164
          Top = 64
          Width = 121
          Height = 33
          Caption = #1054#1089#1090#1072#1085#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Timer_2ButtonClick
        end
        object PLC_close_Button: TButton
          Left = 20
          Top = 164
          Width = 265
          Height = 41
          Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = PLC_close_ButtonClick
        end
        object Timer_Button: TButton
          Left = 24
          Top = 64
          Width = 121
          Height = 33
          Caption = #1055#1091#1089#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Timer_ButtonClick
        end
      end
      object Panel8: TPanel
        Left = 424
        Top = 80
        Width = 320
        Height = 241
        BevelWidth = 2
        BorderStyle = bsSingle
        TabOrder = 4
        object Label28: TLabel
          Left = 31
          Top = 24
          Width = 158
          Height = 19
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1084#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 33
          Top = 72
          Width = 84
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1088#1077#1075#1080#1089#1090#1088#1072':'
        end
        object Label31: TLabel
          Left = 32
          Top = 112
          Width = 101
          Height = 13
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072':'
        end
        object writeregedit: TEdit
          Left = 164
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'writeregedit'
        end
        object Writedataedit: TEdit
          Left = 164
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'Writedataedit'
        end
        object readbutton: TButton
          Left = 28
          Top = 172
          Width = 121
          Height = 33
          Caption = #1063#1080#1090#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088#1099
          TabOrder = 2
          OnClick = readbuttonClick
        end
        object Writebutton: TButton
          Left = 164
          Top = 172
          Width = 121
          Height = 33
          Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
          TabOrder = 3
          OnClick = WritebuttonClick
        end
      end
    end
  end
  object stopbutton: TButton
    Left = 1064
    Top = 684
    Width = 184
    Height = 84
    Caption = 'STOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = stopbuttonClick
  end
  object Err_label: TBitBtn
    Left = 971
    Top = 24
    Width = 238
    Height = 66
    Caption = #1054#1064#1048#1041#1050#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Err_labelClick
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 1227
    Top = 584
  end
  object mctPLC: TIdModBusClient
    MaxLineAction = maException
    Left = 1225
    Top = 624
  end
end
