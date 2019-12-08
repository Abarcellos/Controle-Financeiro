unit ConsultaBaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormConsultaBaixas = class(TForm)
    FDQueryConsultaBaixa: TFDQuery;
    LabelTtDescrição: TLabel;
    LabelTtDalaLanc: TLabel;
    LabelTtValorParcela: TLabel;
    LabelTtParcela: TLabel;
    LabelTtValorTotal: TLabel;
    LabelTtDataPagamento: TLabel;
    DateTimePicker1: TDateTimePicker;
    ButtonConfirmar: TButton;
    LabelDescrição: TLabel;
    LabelDataLancamento: TLabel;
    LabelParcela: TLabel;
    LabelValorParcela: TLabel;
    LabelValorTotalCompra: TLabel;
    FDUpdateSQL1: TFDUpdateSQL;
    LabelDesejaEstornar: TLabel;
    ButtonEstornarSim: TButton;
    ButtonEstornarNao: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
    procedure ButtonEstornarNaoClick(Sender: TObject);
    procedure ButtonEstornarSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaBaixas: TFormConsultaBaixas;

implementation
  uses principal;





{$R *.dfm}





procedure TFormConsultaBaixas.FormCreate(Sender: TObject);
var
valorTotalCompra : integer;
begin
DateTimePicker1.Date := date();
LabelDesejaEstornar.Visible := false;
ButtonEstornarSim.Visible := false;
ButtonEstornarNao.Visible := false;

 with FDQueryConsultaBaixa do
 begin
  Active := false;
  SQL.Text := 'SELECT * FROM CONTAS_PAGAR WHERE CODIGO =' + IntToStr(codLancamento);
  Active := true;
 end;
  LabelDescrição.Caption := FDQueryConsultaBaixa.FieldByName('codigo').AsString + ' - ' + FDQueryConsultaBaixa.FieldByName('DESCRICAO').AsString;
  LabelDataLancamento .Caption := FDQueryConsultaBaixa.FieldByName('DATA_EMISSAO').AsString;
  LabelParcela.Caption := FDQueryConsultaBaixa.FieldByName('PARCELA').AsString;
  LabelValorParcela.Caption := 'R$ '+FDQueryConsultaBaixa.FieldByName('VALOR_PARCELA').AsString;
  valorTotalCompra := FDQueryConsultaBaixa.FieldByName('VALOR_PARCELA').AsInteger * FDQueryConsultaBaixa.FieldByName('QUANTIDADE_PARCELAS').AsInteger;
  LabelValorTotalCompra.Caption := 'R$ '+ IntToStr(valorTotalCompra);

if FDQueryConsultaBaixa.FieldByName('PAGO').AsString = 'T' then
 begin
  LabelDesejaEstornar.Visible := true;
  ButtonConfirmar.Visible := false;
  ButtonEstornarSim.Visible := true;
  ButtonEstornarNao.Visible := true;
 // ButtonEstornarNao.SetFocus;
 end;
end;



procedure TFormConsultaBaixas.ButtonConfirmarClick(Sender: TObject);
 var
 dataPagamento : string;
begin
  dataPagamento := datetostr(DateTimePicker1.DateTime);
  with FDQueryConsultaBaixa do
   begin
     OpenOrExecute;
     SQL.Text := 'UPDATE CONTAS_PAGAR A SET A.PAGO = ''T'',  A.DATA_PAGAMENTO = :DT_PAGAMENTO WHERE A.CODIGO =' + IntToStr(codLancamento);
     ParamByName('DT_PAGAMENTO').AsDate :=  StrToDate(dataPagamento);
     ExecSQL;
   end;
   ShowMessage('Baixa efetuada com sucesso!');
   Close;
end;

procedure TFormConsultaBaixas.ButtonEstornarSimClick(Sender: TObject);
begin
  with FDQueryConsultaBaixa do
    begin
      OpenOrExecute;
      SQL.Text := 'UPDATE CONTAS_PAGAR A SET A.PAGO = ''F'',  A.DATA_PAGAMENTO = :DT_PAGAMENTO WHERE A.CODIGO =' + IntToStr(codLancamento);
      // ParamByName('DT_PAGAMENTO').AsDate := '';
      ExecSQL;
    end;
    ShowMessage('Estorno confirmado');
    close;
end;


procedure TFormConsultaBaixas.ButtonEstornarNaoClick(Sender: TObject);
begin
  close;
end;


end.
