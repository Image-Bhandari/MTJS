object form_report: Tform_report
  Left = 0
  Top = 0
  Caption = 'Report'
  ClientHeight = 407
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 57
    TabOrder = 0
    object Button1: TButton
      Left = 32
      Top = 13
      Width = 81
      Height = 33
      Caption = 'Send To Exel'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 200
      Top = 13
      Width = 81
      Height = 33
      Caption = 'Preview'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 360
      Top = 13
      Width = 81
      Height = 33
      Caption = 'Close'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 481
    Height = 346
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 61
      Height = 13
      Caption = 'Modification:'
    end
    object Label2: TLabel
      Left = 32
      Top = 192
      Width = 64
      Height = 13
      Caption = 'Project Name'
    end
    object Label3: TLabel
      Left = 30
      Top = 192
      Width = 76
      Height = 13
      Caption = 'Database Name'
    end
    object Label4: TLabel
      Left = 32
      Top = 271
      Width = 24
      Height = 13
      Caption = 'From'
    end
    object Label5: TLabel
      Left = 32
      Top = 315
      Width = 12
      Height = 13
      Caption = 'To'
    end
    object SpeedButton1: TSpeedButton
      Left = 210
      Top = 271
      Width = 23
      Height = 22
      Caption = 'AD'
    end
    object SpeedButton2: TSpeedButton
      Left = 210
      Top = 311
      Width = 23
      Height = 24
      Caption = 'AD'
    end
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 80
      Width = 185
      Height = 89
      Caption = 'Report type'
      Items.Strings = (
        'Summary'
        'Details')
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 112
      Top = 37
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'Source'
    end
    object DBLookupCombo1: TDBLookupCombo
      Left = 112
      Top = 189
      Width = 121
      Height = 25
      TabOrder = 2
    end
    object DBLookupCombo2: TDBLookupCombo
      Left = 112
      Top = 189
      Width = 121
      Height = 25
      TabOrder = 3
    end
    object DateEditX1: TDateEditX
      Left = 88
      Top = 271
      Width = 65
      Height = 21
      TabOrder = 4
      ControlData = {
        545046300A5444617465456469745200044C656674025803546F70030F010B44
        61746541442E5965617203E3070C4461746541442E4D6F6E746802060A446174
        6541442E44617902150B4461746556532E59656172031C080C4461746556532E
        4D6F6E746802030A4461746556532E44617902060000}
    end
    object DateEditX2: TDateEditX
      Left = 88
      Top = 311
      Width = 65
      Height = 21
      TabOrder = 5
      ControlData = {
        545046300A5444617465456469745200044C656674025803546F70030F010B44
        61746541442E5965617203E3070C4461746541442E4D6F6E746802060A446174
        6541442E44617902150B4461746556532E59656172031C080C4461746556532E
        4D6F6E746802030A4461746556532E44617902060000}
    end
    object cb_date: TCheckBox
      Left = 248
      Top = 296
      Width = 25
      Height = 17
      TabOrder = 6
    end
  end
end
