object FormConsultaBaixas: TFormConsultaBaixas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Baixas'
  ClientHeight = 123
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTtDescrição: TLabel
    Left = 8
    Top = 10
    Width = 77
    Height = 18
    Caption = 'Descri'#231#227'o:  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTtDalaLanc: TLabel
    Left = 8
    Top = 34
    Width = 92
    Height = 18
    Caption = 'Data Compra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTtValorParcela: TLabel
    Left = 8
    Top = 82
    Width = 88
    Height = 18
    Caption = 'Valor Parcela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTtParcela: TLabel
    Left = 8
    Top = 57
    Width = 51
    Height = 18
    Caption = 'Parcela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTtValorTotal: TLabel
    Left = 280
    Top = 9
    Width = 80
    Height = 18
    Caption = 'Valor Total: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelTtDataPagamento: TLabel
    Left = 280
    Top = 33
    Width = 120
    Height = 18
    Caption = 'Data Pagamento: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelDescrição: TLabel
    Left = 91
    Top = 8
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDataLancamento: TLabel
    Left = 113
    Top = 33
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelParcela: TLabel
    Left = 65
    Top = 58
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelValorParcela: TLabel
    Left = 105
    Top = 82
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelValorTotalCompra: TLabel
    Left = 366
    Top = 9
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDesejaEstornar: TLabel
    Left = 368
    Top = 60
    Width = 140
    Height = 18
    Caption = 'Estornar pagamento?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 417
    Top = 33
    Width = 96
    Height = 21
    Date = 43784.801727789350000000
    Time = 43784.801727789350000000
    TabOrder = 0
  end
  object ButtonConfirmar: TButton
    Left = 368
    Top = 80
    Width = 150
    Height = 25
    Caption = 'Confirmar Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonConfirmarClick
  end
  object ButtonEstornarSim: TButton
    Left = 368
    Top = 80
    Width = 75
    Height = 25
    Caption = 'SIM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonEstornarSimClick
  end
  object ButtonEstornarNao: TButton
    Left = 443
    Top = 80
    Width = 75
    Height = 25
    Caption = 'N'#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonEstornarNaoClick
  end
  object FDQueryConsultaBaixa: TFDQuery
    Connection = DarkControl.FDConnection1
    Left = 264
    Top = 64
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = DarkControl.FDConnection1
    Left = 168
    Top = 64
  end
end
