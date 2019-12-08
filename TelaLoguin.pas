unit TelaLoguin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, principal, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, CaminhoBanco,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, IniFiles, Vcl.Imaging.pngimage;

type
  TLoguin = class(TForm)
    LabelLoguin: TLabel;
    LabelSenha: TLabel;
    EditLoguin: TEdit;
    EditSenha: TEdit;
    ImageLoguin: TImage;
    procedure EditLoguinExit(Sender: TObject);
    procedure EditSenhaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ValidacaoUsuario(u, s : string): boolean;
    procedure FormCreate(Sender: TObject);
    function UsuarioLogado (u :String): string;
    procedure ImageLoguinClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }



  end;




var
  Loguin: TLoguin;
   usuLogado : string;
implementation


{$R *.dfm}
function TLoguin.UsuarioLogado(u: String): string;
begin
 with DarkControl.FDQuery1 do
 begin
   if (Locate('LOGUIN', u, [])) then
   result := FieldByName('NOME_USUARIO').AsString;
 end;

end;

function TLoguin.ValidacaoUsuario(u, s : string): boolean;
begin
 with DarkControl.FDQuery1 do
 begin
   if (Locate('LOGUIN', u, [])) and (Locate('SENHA', s, [])) then
   result := true
   else
   result := false ;
 end;
end;

////     DarkControl.FDQuery1.FieldByName('NOME_USUARIO').AsString



procedure TLoguin.EditLoguinExit(Sender: TObject);
begin
//



end;


procedure TLoguin.EditSenhaExit(Sender: TObject);
begin
 if ValidacaoUsuario(EditLoguin.Text, EditSenha.Text) then
 Close
 else
 begin
   ShowMessage('Usuario ou senha Invalidos!!!');
   EditLoguin.SetFocus;
 end;
end;


procedure TLoguin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  ShowMessage('Seja bem vindo ao Seu controle Financeiro ' + UsuarioLogado(EditLoguin.Text));
 if (EditSenha.Text = '') or (EditLoguin.Text = '') or (ValidacaoUsuario(EditLoguin.Text, EditSenha.Text) = false) then
 begin
 Application.Terminate
 end;
end;

procedure TLoguin.FormCreate(Sender: TObject);
begin
 EditSenha.PasswordChar := '*';
end;



procedure TLoguin.ImageLoguinClick(Sender: TObject);
begin
Application.Terminate
end;

end.
