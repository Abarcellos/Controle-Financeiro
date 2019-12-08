object DarkControl: TDarkControl
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSizeToolWin
  Caption = 'Dark Control 1.0'
  ClientHeight = 500
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImageFundo: TImage
    Left = -1
    Top = -2
    Width = 714
    Height = 507
  end
  object LabelUsuarioLogado: TLabel
    Left = 572
    Top = 64
    Width = 114
    Height = 13
    Caption = 'LabelUsuarioLogado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 572
    Top = 45
    Width = 90
    Height = 13
    Caption = 'Usuario Logado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridPrincipal: TDBGrid
    Left = 3
    Top = 146
    Width = 685
    Height = 220
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridPrincipalDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENCIMENTO'
        Title.Caption = 'Data Vencimento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PAGAMENTO'
        Title.Caption = 'Data Pagamento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELA'
        Title.Caption = 'Parcela'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_PARCELAS'
        Title.Caption = 'Total Parcelas'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PARCELA'
        Title.Caption = 'Valor Parcela'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object PanelCadastro: TPanel
    Left = 8
    Top = 8
    Width = 241
    Height = 137
    TabOrder = 1
    object LabelLancamento: TLabel
      Left = 15
      Top = 7
      Width = 199
      Height = 14
      Caption = 'Lancamento Debitos Parcelados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label1Parcela: TLabel
      Left = 29
      Top = 114
      Width = 59
      Height = 14
      Caption = ' Venc. 1'#186':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelVparcela: TLabel
      Left = 25
      Top = 55
      Width = 63
      Height = 14
      Caption = 'V. Parcela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 87
      Width = 84
      Height = 14
      Caption = 'Qtd. Parcelas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditDescricao: TEdit
      Left = 6
      Top = 27
      Width = 227
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Descri'#231#227'o'
    end
    object ButtonGravar: TButton
      Left = 187
      Top = 110
      Width = 49
      Height = 25
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButtonGravarClick
    end
    object EditValorParcela: TEdit
      Left = 90
      Top = 55
      Width = 91
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditQtdParcelas: TEdit
      Left = 90
      Top = 82
      Width = 91
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
    end
  end
  object PanelHoje: TPanel
    Left = 569
    Top = 8
    Width = 115
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 98
    Top = 118
    Width = 91
    Height = 22
    Date = 43780.754843032410000000
    Time = 43780.754843032410000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object PanelConsulta: TPanel
    Left = 271
    Top = 8
    Width = 242
    Height = 137
    TabOrder = 4
    object LabelConsulta: TLabel
      Left = 62
      Top = 9
      Width = 109
      Height = 14
      Caption = 'Consulta Debitos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object LabelPago: TLabel
      Left = 38
      Top = 110
      Width = 39
      Height = 14
      Caption = 'Pago: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelVencimento: TLabel
      Left = 91
      Top = 40
      Width = 72
      Height = 14
      Caption = 'Vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelInicial: TLabel
      Left = 2
      Top = 59
      Width = 72
      Height = 14
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFinal: TLabel
      Left = 10
      Top = 87
      Width = 64
      Height = 14
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtonPesquisar: TButton
      Left = 181
      Top = 110
      Width = 57
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = ButtonPesquisarClick
    end
    object DateTimePickerDataInicial: TDateTimePicker
      Left = 77
      Top = 56
      Width = 97
      Height = 21
      Date = 43780.970161018520000000
      Time = 43780.970161018520000000
      TabOrder = 1
    end
    object DateTimePickerDataFinal: TDateTimePicker
      Left = 77
      Top = 83
      Width = 98
      Height = 21
      Date = 43780.970526574080000000
      Time = 43780.970526574080000000
      TabOrder = 2
    end
    object CheckBoxPagoSim: TCheckBox
      Left = 134
      Top = 109
      Width = 40
      Height = 17
      Caption = 'Sim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBoxPagoSimClick
    end
    object CheckBoxPagoNao: TCheckBox
      Left = 77
      Top = 106
      Width = 42
      Height = 23
      Caption = 'N'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = CheckBoxPagoNaoClick
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 472
    Top = 400
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 560
    Top = 384
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FormatOptions.AssignedValues = [fvFmtDisplayDate, fvFmtDisplayNumeric]
    FormatOptions.FmtDisplayNumeric = '0,00'
    SQL.Strings = (
      '')
    Left = 648
    Top = 392
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDQuery1
    Left = 408
    Top = 384
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    OwnerDraw = True
    ParentBiDiMode = False
    Left = 336
    Top = 400
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Banco1: TMenuItem
        Caption = 'Banco'
        OnClick = Banco1Click
      end
      object Layout: TMenuItem
        Caption = 'Apar'#234'ncia'
        OnClick = LayoutClick
      end
      object Sobre: TMenuItem
        Caption = 'Sobre'
        OnClick = SobreClick
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Usuarios: TMenuItem
        Caption = 'Usuarios'
        OnClick = UsuariosClick
      end
    end
  end
  object OpenPictureDialogImgFuindo: TOpenPictureDialog
    Left = 224
    Top = 384
  end
end
