program DarckControl;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {DarkControl},
  CaminhoBanco in 'CaminhoBanco.pas' {ConfiguracoesBanco},
  ConsultaBaixas in 'ConsultaBaixas.pas' {FormConsultaBaixas},
  CadastroUsuarios in 'CadastroUsuarios.pas' {Usuarios},
  TelaLoguin in 'TelaLoguin.pas' {Loguin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDarkControl, DarkControl);
  Application.CreateForm(TLoguin, Loguin);
  Application.Run;
end.
