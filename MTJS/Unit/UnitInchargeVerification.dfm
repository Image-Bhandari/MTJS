object Form_InchargeVerification: TForm_InchargeVerification
  Left = 409
  Top = 300
  Caption = 'Admin Verification'
  ClientHeight = 117
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 256
    Height = 117
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 212
    ExplicitHeight = 101
    object Label1: TLabel
      Left = 7
      Top = 21
      Width = 53
      Height = 13
      Caption = 'User Name'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Edit_UserName: TEdit
      Left = 68
      Top = 17
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = Edit_UserNameKeyDown
    end
    object Edit_Password: TEdit
      Left = 68
      Top = 42
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = Edit_PasswordKeyDown
    end
    object BitBtnOk: TBitBtn
      Left = 4
      Top = 80
      Width = 100
      Height = 25
      Caption = '&Ok'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtnOkClick
    end
    object BitBtnCancel: TBitBtn
      Left = 110
      Top = 80
      Width = 100
      Height = 25
      Caption = '&Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BitBtnCancelClick
    end
  end
  object Query_CheckUser: TQuery
    DatabaseName = 'Hospital'
    Left = 16
  end
end
