unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompMenu, Vcl.Menus, IniFiles, caminhobanco, ConsultaBaixas, CadastroUsuarios,
    Vcl.Imaging.jpeg, Vcl.ExtDlgs;

type
  TDarkControl = class(TForm)
    DBGridPrincipal: TDBGrid;
    PanelCadastro: TPanel;
    EditDescricao: TEdit;
    ButtonGravar: TButton;
    EditValorParcela: TEdit;
    EditQtdParcelas: TEdit;
    PanelHoje: TPanel;
    LabelLancamento: TLabel;
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    Label1Parcela: TLabel;
    PanelConsulta: TPanel;
    LabelConsulta: TLabel;
    ButtonPesquisar: TButton;
    DateTimePickerDataInicial: TDateTimePicker;
    DateTimePickerDataFinal: TDateTimePicker;
    CheckBoxPagoSim: TCheckBox;
    CheckBoxPagoNao: TCheckBox;
    LabelPago: TLabel;
    LabelVencimento: TLabel;
    LabelInicial: TLabel;
    LabelFinal: TLabel;
    LabelVparcela: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Banco1: TMenuItem;
    Sobre: TMenuItem;
    ImageFundo: TImage;
    Layout: TMenuItem;
    OpenPictureDialogImgFuindo: TOpenPictureDialog;
    Cadastros1: TMenuItem;
    Usuarios: TMenuItem;
    LabelUsuarioLogado: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure CheckBoxPagoNaoClick(Sender: TObject);
    procedure CheckBoxPagoSimClick(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure DBGridPrincipalDblClick(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure LayoutClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);





  private
    { Private declarations }
  public
    { Public declarations }
     usuLogado : integer;
     TipoUsuLogado : integer;


  end;

var
  DarkControl: TDarkControl;
  config : Tinifile;
  caminhoIni : string;
  codLancamento : integer;


implementation


{$R *.dfm}


// CRIA��O DO FORM

uses
   TelaLoguin;



procedure TDarkControl.FormCreate(Sender: TObject);

begin
    //CRIANDO AQUIVO INI
  caminhoIni := ExtractFilePath(Application.ExeName)+'config.ini';
  config := TIniFile.Create(caminhoIni);
  try
  FDConnection1.Params.Database := config.ReadString('DADOS','BANCO',FDConnection1.Params.Database);
  except
  ShowMessage('banco de dados n�o encontrado');
  end;
  try
  FDPhysFBDriverLink1.VendorLib := config.ReadString('DADOS','FBCLIENT',FDPhysFBDriverLink1.VendorLib);
  Except
  ShowMessage('DLL Firebird n�o encontrada');
  end;
  try
  ImageFundo.Picture.LoadFromFile(config.ReadString('DADOS','WALLPAPER',OpenPictureDialogImgFuindo.FileName));
  except
  ShowMessage('Papel de parede n�o encontrado');
  end;
  PanelHoje.Caption := 'Hoje: ' + DateToStr(date());
  CheckBoxPagoNao.Checked := true;
  DateTimePicker1.DateTime := date() + 30;
  DateTimePickerDataInicial.DateTime := date();
  DateTimePickerDataFinal.DateTime := date();
  //LabelUsuarioLogado.Caption := usuarioLogado;

  with TLoguin.Create(self) do
   begin

    with FDQuery1 do
     begin
      Active := false;
      SQL.Text := 'SELECT * FROM USUARIOS';
      Active := true;
     end;
   ShowModal;
   LabelUsuarioLogado.Caption := FDQuery1.FieldByName('CODIGO').AsString +' - '+FDQuery1.FieldByName('NOME_USUARIO').AsString;
   TipoUsuLogado := FDQuery1.FieldByName('TIPO').AsInteger;
   // verificando se o usuario e root
   if FDQuery1.FieldByName('TIPO').AsInteger <> 1 then
     begin
        MainMenu1.Items.Items[1].Visible := false;
        ButtonGravar.Visible := false;
     end;
   end;



end;

// MENU CADASTRO -> USUARIOS
procedure TDarkControl.UsuariosClick(Sender: TObject);
begin
  // ABRE TELA DE CADASTRO DE USUARIOS

  With TUsuarios.Create(nil) do
  begin
    usuLogado :=  FDQuery1.FieldByName('CODIGO').AsInteger;
    ShowModal;
  end;

end;


// ABRE TELA DE CONFIGURA��ES BANCO.
procedure TDarkControl.Banco1Click(Sender: TObject);
begin
  with TConfiguracoesBanco.Create(self) do
  begin
    ShowModal;
    //config := TIniFile.Create('C:\Users\arthu\OneDrive\Projetos Desenvolvimento\Controle financeiro\Win32\Debug\config.Ini');
    config := TIniFile.Create(caminhoIni);
    FDConnection1.Params.Database := config.ReadString('DADOS','BANCO',FDConnection1.Params.Database);
    FDPhysFBDriverLink1.VendorLib := config.ReadString('DADOS','FBCLIENT',FDPhysFBDriverLink1.VendorLib);
    free;
  end;
end;

 // MENU APARENCIA
procedure TDarkControl.LayoutClick(Sender: TObject);
begin
  if OpenPictureDialogImgFuindo.Execute then
  begin
    config.WriteString('DADOS','WALLPAPER',OpenPictureDialogImgFuindo.FileName);
    ImageFundo.Picture.LoadFromFile(OpenPictureDialogImgFuindo.FileName);
  end;
end;





// MENU SOOBRE
procedure TDarkControl.SobreClick(Sender: TObject);
begin
 ShowMessage(' |                                        '       +#13+
             ' |           Sistema Dark Control         '       +#13+
             ' |                                        '       +#13+
             ' | '                                              +#13+
             ' |Vers�o 1.0                 '                    +#13+
             ' |Primeira vers�o: 25/11/2019            '        +#13+
             ' |Desenvolvido por: Arthur Barcellos Lima'        +#13+
             ' |Contato: + 55 27 99861 2892                       ');
end;


procedure TDarkControl.StringGrid1Click(Sender: TObject);
begin

end;



// BOT�O DE LANCAMENTO
procedure TDarkControl.ButtonGravarClick(Sender: TObject);
var
dataVencimento : TDateTime;
i, qtdParcelas, primeiroVencimento : integer;

begin
  qtdParcelas := StrToInt(EditQtdParcelas.Text);
  dataVencimento := DateTimePicker1.DateTime;
  for I := 1 to qtdParcelas do
  begin
    with FDQuery1 do
    begin
      Active := false;
      SQL.Text := 'SELECT * FROM CONTAS_PAGAR';
      Active := true;
      Append;
      FieldByName('CODIGO'             ).AsInteger  := 1; // codigo esta sendo auto incrementado pelo generato e sua trigger
      FieldByName('DESCRICAO'          ).AsString   := EditDescricao.Text;
      FieldByName('DATA_EMISSAO'       ).AsDateTime := date();
      FieldByName('DATA_VENCIMENTO'    ).AsDateTime := dataVencimento;
      FieldByName('PARCELA'            ).AsInteger  := i;
      FieldByName('QUANTIDADE_PARCELAS').AsInteger  := StrToInt(EditQtdParcelas.Text);
      FieldByName('VALOR_PARCELA'      ).AsFloat    := StrToFloat(EditValorParcela.Text);
      FieldByName('PAGO'               ).AsString   := 'F';
      Post;
    end;
    dataVencimento := IncMonth(dataVencimento, 1); // fun��o IncMonth incrementa somente o mes baseado no calendario do Windows
    TNumericField(FDQuery1.FieldByName('VALOR_PARCELA')).DisplayFormat := 'R$ '+'##,##0.00'; // FORMATANDO O CAMPO NA DBGRID

  end;
   EditDescricao.Text := '';
end;

// BOT�O DE CONSULTA!
procedure TDarkControl.ButtonPesquisarClick(Sender: TObject);
var
data_inicial, data_final, pago: string;

begin
data_inicial := DateToStr(DateTimePickerDataInicial.Date);
data_final   := DateToStr(DateTimePickerDataFinal.Date);

  if (CheckBoxPagoSim.Checked = true) then
  begin
    pago := 'T';
  end;
  if (CheckBoxPagoNao.Checked = true) then
  begin
    pago := 'F';
  end;

  with FDQuery1 do
  begin
    Active := false;
    SQL.Text := 'SELECT * FROM CONTAS_PAGAR A WHERE A.DATA_VENCIMENTO BETWEEN :DATA_INICIAL and :DATA_FINAL AND A.PAGO = :PAGO';
    ParamByName('DATA_INICIAL').AsDate   := StrToDate(data_inicial);
    ParamByName('DATA_FINAL'  ).AsDate   := StrToDate(data_final);
    ParamByName('PAGO'        ).AsString := pago;
    Active := true;
    TNumericField(FieldByName('VALOR_PARCELA')).DisplayFormat := 'R$ '+'##,##0.00'; // FORMATANDO O CAMPO NA DBGRID
  end;
end;

//IMPEDINDO DE MARCAR OS DOIS CHECBOX
procedure TDarkControl.CheckBoxPagoNaoClick(Sender: TObject);
begin
  if CheckBoxPagoSim.Checked then
  begin
    CheckBoxPagoSim.Checked := false;
  end
  else
  begin
    CheckBoxPagoNao.Checked := true;
  end;
end;
procedure TDarkControl.CheckBoxPagoSimClick(Sender: TObject);
begin
  if CheckBoxPagoNao.Checked then
  begin
    CheckBoxPagoNao.Checked := false;
  end
  else
  begin
    CheckBoxPagoSim.Checked := true;
  end;
end;

  //ABRE BAIXAS
procedure TDarkControl.DBGridPrincipalDblClick(Sender: TObject);
begin
    if TipoUsuLogado <> 1 then
    begin
      ShowMessage('Usuario sem permiss�o');
      exit
    end;

    codLancamento := FDQuery1.FieldByName('CODIGO').AsInteger;
    if (FDQuery1.FieldByName('PAGO').AsString = 'T') then
    begin
      ShowMessage('Essa conta ja foi paga!');
    end;

   with TFormConsultaBaixas.Create(self) do
   begin
     ShowModal;

     free;
   end;
end;







// Encerrando o programa
procedure TDarkControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// MessageDlg('Deseja realmente fechar?  )

Application.Terminate;
end;

end.
