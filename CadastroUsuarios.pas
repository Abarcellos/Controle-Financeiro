unit CadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TUsuarios = class(TForm)
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    LabelNome: TLabel;
    LabelLoguin: TLabel;
    EditLogin: TEdit;
    LabelSenha: TLabel;
    EditSenha: TEdit;
    ButtonGravar: TButton;
    ComboBoxTipo: TComboBox;
    LabelTipo: TLabel;
    ButtonNovo: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGravarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ButtonNovoClick(Sender: TObject);
    procedure LimpatrEdits;
    procedure EscolherTipo(x :integer);
    function GravarTipo(x :integer) : integer;
    procedure Image1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuarios: TUsuarios;
  passvisi : integer;
  usuSelecionado : integer;

implementation
   uses principal;

{$R *.dfm}

//////////////////////// PROCEDIMENTOS CRIADOS //////////////////////////

Procedure SelectNaTabela();
begin
with DarkControl.FDQuery1 do
  begin
  Active := false;
  SQL.Text := 'SELECT * FROM USUARIOS';
  Active := true;
  end;
end;

procedure TUsuarios.LimpatrEdits();
begin
  EditNome.Text := '';
  EditLogin.Text := '';
  EditSenha.Text := '';
  ComboBoxTipo.ItemIndex := -1;
end;

procedure TUsuarios.EscolherTipo(x : integer);
begin
  case x of
  0 : ComboBoxTipo.ItemIndex := 0;
  1 : ComboBoxTipo.ItemIndex := 1;
  end;
end;

function TUsuarios.GravarTipo(x: integer): integer;
begin
  case x of
  0 : result := 0;
  1 : result := 1;
  end;
end;


//////////////////////// FIM PROCEDIMENTOS CRIADOS //////////////////////////


procedure TUsuarios.FormCreate(Sender: TObject);
begin
  EditSenha.PasswordChar := '*';
  SelectNaTabela;
  passvisi := 1;

  if (DarkControl.FDQuery1.FieldByName('TIPO').AsInteger <> 1) then
  begin
    Image1.Visible := false;
    ButtonGravar.Visible := false;
  end;
end;

procedure TUsuarios.DBGrid1CellClick(Column: TColumn);
var
cod : integer;
begin
  cod := DarkControl.FDQuery1.FieldByName('CODIGO').AsInteger;
  DarkControl.FDQuery1.locate('CODIGO',cod,[]);
  EditNome.Text :=  DarkControl.FDQuery1.FieldByName('NOME_USUARIO').AsString;
  EditLogin.Text := DarkControl.FDQuery1.FieldByName('LOGUIN').AsString;
  EditSenha.Text := DarkControl.FDQuery1.FieldByName('SENHA').AsString;
  EscolherTipo(DarkControl.FDQuery1.FieldByName('TIPO').AsInteger);
  ButtonGravar.Caption := 'Editar';
  EditSenha.PasswordChar := '*';
  passvisi := 1;

end;

procedure TUsuarios.ButtonNovoClick(Sender: TObject);
begin
  ButtonGravar.Caption := 'Gravar';
  EditSenha.PasswordChar := '*';
  EditNome.SetFocus;
  LimpatrEdits;
end;

 // ALTERA MASCARA DO CAMPO DE SENHA PARA VISIVEL OU NÃO.
procedure TUsuarios.Image1Click(Sender: TObject);
begin
 if passvisi = 1 then
  EditSenha.PasswordChar := #0 else
  begin
  EditSenha.PasswordChar := '*';
  passvisi := 1;
  end;
 if EditSenha.PasswordChar = #0 then
  passvisi := 0;
end;

procedure TUsuarios.ButtonGravarClick(Sender: TObject);
var
cod : integer;
begin
  cod := DarkControl.FDQuery1.FieldByName('CODIGO').AsInteger;
  if ButtonGravar.Caption = 'Gravar' then
  begin
  SelectNaTabela;
    with DarkControl.FDQuery1 do
    begin
      Append;
      fieldByName('CODIGO'      ).AsInteger := 0;
      fieldByName('NOME_USUARIO').AsString  := EditNome.Text;
      fieldByName('LOGUIN'      ).AsString  := EditLogin.Text;
      fieldByName('SENHA'       ).AsString  := EditSenha.Text;
      fieldByName('TIPO'        ).AsInteger := GravarTipo(ComboBoxTipo.ItemIndex);
      Post;
      ShowMessage('Usuario cadastrado com sucesso');
      LimpatrEdits;
      SelectNaTabela;
      DBGrid1.SetFocus;
    end;
  end
  else
  begin
  with DarkControl.FDQuery1 do
   begin
     OpenOrExecute;
     SQL.Text := 'update usuarios set nome_usuario = :NOME , loguin = :LOGUIN , senha = :SENHA, tipo = :TIPO where codigo = :CODIGO';
     ParamByName('NOME'  ).AsString := EditNome.Text;
     ParamByName('LOGUIN').AsString := EditLogin.Text;
     ParamByName('SENHA' ).AsString := EditSenha.Text;
     ParamByName('TIPO'  ).AsInteger := GravarTipo(ComboBoxTipo.ItemIndex);
     ParamByName('CODIGO').AsInteger := cod;
     ExecSQL;
   end;
   ShowMessage('Usuario alterado com sucesso!!');
   SelectNaTabela;
   LimpatrEdits;
  end;
end;



end.
