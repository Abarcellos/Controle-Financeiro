object Usuarios: TUsuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro Usuarios'
  ClientHeight = 157
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelNome: TLabel
    Left = 111
    Top = 6
    Width = 92
    Height = 16
    Caption = 'Nome Usuario:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelLoguin: TLabel
    Left = 111
    Top = 55
    Width = 47
    Height = 16
    Caption = 'Loguin:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelSenha: TLabel
    Left = 238
    Top = 55
    Width = 45
    Height = 16
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelTipo: TLabel
    Left = 113
    Top = 106
    Width = 31
    Height = 16
    Caption = 'Tipo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 339
    Top = 77
    Width = 20
    Height = 20
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000120000
      0017080600000006031FE4000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000001
      224944415478DAED533B6E8530105C405408F1EBB8011C85A3700E6EC23568B9
      081542E2DB2241184BE3983CD23D4551942D606DCFCCFE6CEBBC4CDE60D6BFD0
      0F0A4DD3744651A416F33C0B7D1AF6608817C7B1F697655158721E852CCB7A8C
      EABAAEECFBAEFC711C95B0E6A03446650400004C92E445EC0AACCEABAA92B22C
      354709E1100622A2F67DAF45CC163253E099B9E779D275DD6769D864BA244104
      FF6118C4711C45B66D5B8EE3D03DD23864844D581886BAB9106419CC8A65E34F
      ECAD340218C91432A788354A368588BB09B56D2B5996692112CCABF035A31721
      4E0D35D7752D45513C4EAD691AC9F35CD234D5C3B895668E9F197D67DBB689EF
      FBF71E5D9F3308020558D755E823B3A78B893E621FBD04969CF73D91DFF7FAFF
      AED007F32B2C602B8C2AD80000000049454E44AE426082}
    OnClick = Image1Click
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 2
    Width = 100
    Height = 149
    Ctl3D = True
    DataSource = DarkControl.DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'Cod. Usuario'
        Visible = True
      end>
  end
  object EditNome: TEdit
    Left = 110
    Top = 28
    Width = 248
    Height = 21
    TabOrder = 1
  end
  object EditLogin: TEdit
    Left = 111
    Top = 77
    Width = 120
    Height = 21
    TabOrder = 2
  end
  object EditSenha: TEdit
    Left = 237
    Top = 77
    Width = 95
    Height = 21
    TabOrder = 3
  end
  object ButtonGravar: TButton
    Left = 295
    Top = 128
    Width = 64
    Height = 23
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonGravarClick
  end
  object ComboBoxTipo: TComboBox
    Left = 110
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Root'
    Items.Strings = (
      'Usuario'
      'Root')
  end
  object ButtonNovo: TButton
    Left = 238
    Top = 128
    Width = 52
    Height = 23
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = ButtonNovoClick
  end
end
