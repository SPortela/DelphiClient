object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Calculo horas Empleado'
  ClientHeight = 113
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pMain: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 113
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 408
    ExplicitTop = 80
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lbHour: TLabel
      Left = 292
      Top = 16
      Width = 119
      Height = 19
      Caption = 'Horas trabajadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnCalc: TSpeedButton
      Left = 487
      Top = 16
      Width = 74
      Height = 29
      Caption = 'Calcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCalcClick
    end
    object lbResponse: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 53
      Width = 576
      Height = 45
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 15
      Align = alBottom
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 10
      ExplicitTop = 58
      ExplicitWidth = 586
    end
    object textEmp: TEdit
      Left = 40
      Top = 16
      Width = 246
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Nombre del  Empleado'
    end
    object numberHour: TSpinEdit
      Left = 417
      Top = 16
      Width = 64
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 0
    end
  end
end
