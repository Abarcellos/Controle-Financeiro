unit CaminhoBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TConfiguracoesBanco = class(TForm)
    ImageBanco: TImage;
    ImageDllFirebird: TImage;
    EditCaminhoBanco: TEdit;
    EditCaminhoDLLFireBird: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ButtonSelBanco: TButton;
    ButtonSelDll: TButton;
    OpenDialogBanco: TOpenDialog;
    OpenDialogdllFireBird: TOpenDialog;
    ButtonConfirmar: TButton;
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure ButtonSelBancoClick(Sender: TObject);
    procedure ButtonSelDllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



  private
    { Private declarations }
  public
    { Public declarations }
    //diretorioBanco, diretorioFbCliente : string;
    config : TIniFile;
  end;

var
  ConfiguracoesBanco: TConfiguracoesBanco;


implementation
   uses Principal;
{$R *.dfm}


procedure TConfiguracoesBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TConfiguracoesBanco.FormCreate(Sender: TObject);
begin
  //config := TIniFile.Create('C:\Users\arthu\OneDrive\Projetos Desenvolvimento\Controle financeiro\Win32\Debug\config.Ini');
  config := TIniFile.Create(caminhoIni);
  if (config.ReadString('dados','BANCO',EditCaminhoBanco.Text) <> '') then
  begin
    EditCaminhoBanco.Text := config.ReadString('dados','BANCO',EditCaminhoBanco.Text);
  end;
  if (config.ReadString('dados','FBCLIENT',EditCaminhoDLLFireBird.Text) <> '') then
  begin
    EditCaminhoDLLFireBird.Text  := config.ReadString('dados','FBCLIENT',EditCaminhoDLLFireBird.Text);
  end;
end;


procedure TConfiguracoesBanco.ButtonSelBancoClick(Sender: TObject);
begin
  if (config.ReadString('dados','BANCO',EditCaminhoBanco.Text) <> '') then
  ShowMessage('Alterar o Banco de Dados pode causar Problemas no sistema');
  if OpenDialogBanco.Execute then
  begin
    EditCaminhoBanco.Text := OpenDialogBanco.FileName;
  end;
end;
procedure TConfiguracoesBanco.ButtonSelDllClick(Sender: TObject);
begin
  if (config.ReadString('dados','FBCLIENT',EditCaminhoDLLFireBird.Text) <> '') then
  ShowMessage('Altera a DDL do Firebird pode causar problemas no sistema');

    if OpenDialogdllFireBird.Execute then
  begin
    EditCaminhoDLLFireBird.Text := OpenDialogdllFireBird.FileName;
  end;
end;

procedure TConfiguracoesBanco.ButtonConfirmarClick(Sender: TObject);
//  TIniFile encontrase dentro da unit IniFiles
begin
  //config := TIniFile.Create('C:\Users\arthu\OneDrive\Projetos Desenvolvimento\Controle financeiro\Win32\Debug\config.Ini');
  config := TIniFile.Create(caminhoIni);
  config.WriteString('Dados', 'BANCO', EditCaminhoBanco.Text);
  config.WriteString('Dados', 'FBCLIENT', EditCaminhoDLLFireBird.Text);
  EditCaminhoBanco.Text := config.ReadString('dados','BANCO',EditCaminhoBanco.Text);
  EditCaminhoDLLFireBird.Text := config.ReadString('dados','FBCLIENT',EditCaminhoDLLFireBird.Text);
  config.Free;

  Close;
end;






end.



