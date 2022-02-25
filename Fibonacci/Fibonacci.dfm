object frmMain: TfrmMain
  Left = 340
  Top = 274
  Caption = 'Sucesi'#243'n de Fibonacci'
  ClientHeight = 221
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -3
    object lbCaptura: TLabel
      Left = 189
      Top = 24
      Width = 217
      Height = 19
      Caption = 'Ingrese un n'#250'mero entre 1 y 20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto Lt'
      Font.Style = []
      ParentFont = False
    end
    object btnCalc: TSpeedButton
      Left = 499
      Top = 19
      Width = 94
      Height = 29
      Caption = 'Generar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto Lt'
      Font.Style = []
      ParentFont = False
      OnClick = btnCalcClick
    end
    object numCalc: TSpinEdit
      Left = 420
      Top = 19
      Width = 65
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto Lt'
      Font.Style = []
      MaxValue = 20
      MinValue = 1
      ParentFont = False
      TabOrder = 0
      Value = 0
    end
  end
  object pClient: TPanel
    Left = 0
    Top = 81
    Width = 758
    Height = 140
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 336
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lbResponse: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 15
      Width = 728
      Height = 110
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 15
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto Lt'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 4
      ExplicitHeight = 19
    end
  end
end
