object form_signup: Tform_signup
  Left = 0
  Top = 0
  Caption = 'Sign UP'
  ClientHeight = 361
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 425
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object lbl2: TLabel
      Left = 24
      Top = 80
      Width = 43
      Height = 13
      Caption = 'Address:'
    end
    object lbl3: TLabel
      Left = 24
      Top = 120
      Width = 53
      Height = 13
      Caption = 'UserName:'
    end
    object lbl4: TLabel
      Left = 24
      Top = 160
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object lbl5: TLabel
      Left = 24
      Top = 206
      Width = 90
      Height = 13
      Caption = 'Confirm Password:'
    end
    object lbl6: TLabel
      Left = 24
      Top = 246
      Width = 60
      Height = 13
      Caption = 'Expiry Date:'
    end
    object btn1: TSpeedButton
      Left = 240
      Top = 246
      Width = 23
      Height = 22
      Caption = 'AD'
    end
    object edt1: TEdit
      Left = 152
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edt2: TEdit
      Left = 152
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edt3: TEdit
      Left = 152
      Top = 117
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edt4: TEdit
      Left = 152
      Top = 157
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edt5: TEdit
      Left = 152
      Top = 203
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object btn2: TButton
      Left = 96
      Top = 296
      Width = 113
      Height = 49
      Caption = 'Sign Up'
      TabOrder = 6
      OnClick = btn2Click
    end
    object chk1: TCheckBox
      Left = 320
      Top = 251
      Width = 97
      Height = 17
      Caption = 'Is Admin'
      TabOrder = 5
    end
    object dtdtxl: TDateEditX
      Left = 144
      Top = 247
      Width = 65
      Height = 21
      TabOrder = 7
      ControlData = {
        545046300A5444617465456469745200044C65667403900003546F7003F7000B
        4461746541442E5965617203E3070C4461746541442E4D6F6E746802060A4461
        746541442E446179021E0B4461746556532E59656172031C080C446174655653
        2E4D6F6E746802030A4461746556532E446179020F0000}
    end
  end
  object qry_signup: TQuery
    Left = 352
    Top = 40
  end
end
