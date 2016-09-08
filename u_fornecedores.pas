unit u_fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrSocket, ACBrCEP, uPesqCPNJ, uPesqCPF;

type
  TfFornecedores = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    qrFornecedores: TSQLQuery;
    dsFornecedores: TDataSource;
    cdsFornecedores: TClientDataSet;
    dspFornecedores: TDataSetProvider;
    qrEstados: TSQLQuery;
    qrEstadosuf: TStringField;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    qrAux: TSQLQuery;
    ACBrCEP1: TACBrCEP;
    cdsFornecedorestipo: TStringField;
    cdsFornecedoresnome: TStringField;
    cdsFornecedoresfantasia: TStringField;
    cdsFornecedorescontato: TStringField;
    cdsFornecedorescep: TStringField;
    cdsFornecedoresendereco: TStringField;
    cdsFornecedoresnumero: TStringField;
    cdsFornecedoresidUF: TIntegerField;
    cdsFornecedoresidCidade: TIntegerField;
    cdsFornecedoresdddfone: TStringField;
    cdsFornecedoresfone: TStringField;
    cdsFornecedoresdddcel: TStringField;
    cdsFornecedorescelular: TStringField;
    cdsFornecedoresemail: TStringField;
    cdsFornecedoresie: TStringField;
    cdsFornecedoresim: TStringField;
    cdsFornecedoresrg: TStringField;
    cdsFornecedorescep_cobranca: TStringField;
    cdsFornecedoresendereco_cobranca: TStringField;
    cdsFornecedoresbairro_cobranca: TStringField;
    cdsFornecedoresidUf_cobranca: TIntegerField;
    cdsFornecedoresidCidade_cobranca: TIntegerField;
    cdsFornecedoresestado_civil: TStringField;
    cdsFornecedorespai: TStringField;
    cdsFornecedoresmae: TStringField;
    cdsFornecedoresconjude: TStringField;
    cdsFornecedorestrabalho: TStringField;
    cdsFornecedoresnaturalidade: TStringField;
    cdsFornecedoresdatanascimento: TDateField;
    cdsFornecedoresnumero_cobranca: TStringField;
    cdsFornecedorescomplemento_cobranca: TStringField;
    cdsFornecedorescomplemento: TStringField;
    cdsFornecedorescdg_cliente: TStringField;
    cdsFornecedorescontrib_icms: TStringField;
    cdsFornecedoressimples_nacional: TStringField;
    cdsFornecedoresdependentes: TStringField;
    cdsFornecedoresbairro: TStringField;
    edtCNPJ: TMaskEdit;
    lbl4: TLabel;
    imgPespCNPJ: TImage;
    imgPesqCliente2: TImage;
    edtRazaoSocial: TDBEdit;
    lbl5: TLabel;
    lbl26: TLabel;
    edtFantasia: TDBEdit;
    lbl27: TLabel;
    edtContato: TDBEdit;
    lbl14: TLabel;
    edtCepJur: TDBEdit;
    imgPesqCep2: TImage;
    edtComplementoJur: TDBEdit;
    lbl16: TLabel;
    lbl21: TLabel;
    edtDddTelJur: TDBEdit;
    edtTelefoneJur: TDBEdit;
    edtIeJur: TDBEdit;
    lbl20: TLabel;
    lbl23: TLabel;
    edtImJur: TDBEdit;
    edtDddCelJur: TDBEdit;
    edtCelularJur: TDBEdit;
    lbl22: TLabel;
    lbl24: TLabel;
    edtBairroJur: TDBEdit;
    lbl25: TLabel;
    edtEnderecoJur: TDBEdit;
    lbl28: TLabel;
    edtNumeroJur: TDBEdit;
    cbbCidadeJur: TComboBox;
    lbl29: TLabel;
    cbbUFJur: TComboBox;
    lbl30: TLabel;
    lbl31: TLabel;
    edtEmailJur: TDBEdit;
    chkContIcmsJur: TDBCheckBox;
    chkSimplesJur: TDBCheckBox;
    procedure imgSairClick(Sender: TObject);
    procedure imgPesqCepClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCepCobClick(Sender: TObject);
    procedure imgPesqCep2Click(Sender: TObject);
    procedure imgPesqCepCob2Click(Sender: TObject);
    procedure imgPespCNPJClick(Sender: TObject);
    procedure img4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure limparJuridica;
    procedure limparFisica;
    procedure habilitaCamposJuridica;
    procedure desabilitaCamposJuridica;
    procedure habilitaCamposFisica;
    procedure desabilitaCamposFisica;
  end;

var
  fFornecedores: TfFornecedores;

implementation

{$R *.dfm}

procedure TfFornecedores.ACBrCEP1BuscaEfetuada(Sender: TObject);
var i : Integer;
begin
  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
//    edtCEP.Text := ACBrCEP1.Enderecos[i].CEP;
//    edtEndereco.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
//    cbbUF.Text := ACBrCEP1.Enderecos[i].UF;
//    cbbCidades.Text := ACBrCEP1.Enderecos[i].Municipio;
//    edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
  end;
end;

procedure TfFornecedores.img4Click(Sender: TObject);
begin
   if ActiveControl = edtCNPJ then
  begin
    Application.CreateForm(TfPesqCPF,fPesqCPF);
    fPesqCPF.ShowModal;
    if fPesqCPF.cpf <> '' then
    begin
//       edtCpf.text := fPesqCPF.cpf;
       edtRazaoSocial.Text := fPesqCPF.razaosocial;
//       edtDataNascimento.Text := fPesqCPF.nascimento;
       edtNumeroJur.Text := fPesqCNPJ.numero;
    end;
    fPesqCPF.release;
    fPesqCPF := nil;
   end;
end;

procedure TfFornecedores.imgPespCNPJClick(Sender: TObject);
begin
  if ActiveControl = edtCnpj then
  begin
    Application.CreateForm(TfPesqCNPJ,fPesqCNPJ);
    fPesqCNPJ.ShowModal;
    if fPesqCNPJ.cnpj <> '' then
    begin
       edtCnpj.text := fPesqCNPJ.cnpj;
       edtRazaoSocial.Text := fPesqCNPJ.razaosocial;
       edtFantasia.Text := fPesqCNPJ.fantasia;
       edtEnderecoJur.Text := fPesqCNPJ.endereco;
       edtNumeroJur.Text := fPesqCNPJ.numero;
       edtBairroJur.Text := fPesqCNPJ.bairro;
       edtComplementoJur.Text := fPesqCNPJ.complemento;
       cbbUFJur.Text := fPesqCNPJ.uf;
       cbbCidadeJur.Text := fPesqCNPJ.cidade;
       edtTelefoneJur.Text := fPesqCNPJ.telefone;
       edtCepJur.Text := fPesqCNPJ.cep;
       edtEmailJur.Text := fPesqCNPJ.email;
    end;
    fPesqCNPJ.release;
    fPesqCNPJ := nil;
   end;
end;

procedure TfFornecedores.imgPesqCep2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepJur.Text)
end;

procedure TfFornecedores.imgPesqCepClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepJur.Text)
end;

procedure TfFornecedores.imgPesqCepCob2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepJur.Text)
end;

procedure TfFornecedores.imgPesqCepCobClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepJur.Text)
end;

procedure TfFornecedores.imgSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfFornecedores.limparFisica;
begin

end;


procedure TfFornecedores.limparJuridica;
begin
  edtCNPJ.Clear;
  edtRazaoSocial.Clear;

  edtNumeroJur.Clear;

  edtComplementoJur.Clear;
  edtIeJur.Clear;
  edtDddTelJur.Clear;
  edtTelefoneJur.Clear;
  edtImJur.Clear;
  edtBairroJur.Clear;
  edtEnderecoJur.Clear;
  edtFantasia.Clear;
  edtNumeroJur.Clear;
  cbbCidadeJur.Clear;
  cbbUFJur.Clear;
  chkContIcmsJur.Checked := False;
  edtEmailJur.Clear;
  chkSimplesJur.Checked := False;

  edtContato.Clear;
  edtDddCelJur.Clear;
  edtCelularJur.Clear;
end;

procedure TfFornecedores.habilitaCamposFisica;
begin

end;

procedure TfFornecedores.desabilitaCamposFisica;
begin

end;

procedure TfFornecedores.habilitaCamposJuridica;
begin
  edtCNPJ.Enabled := True;
  edtRazaoSocial.Enabled := True;

  edtNumeroJur.Enabled := True;

  edtComplementoJur.Enabled := True;
  edtIeJur.Enabled := True;
  edtDddTelJur.Enabled := True;
  edtTelefoneJur.Enabled := True;
  edtImJur.Enabled := True;
  edtBairroJur.Enabled := True;
  edtEnderecoJur.Enabled := True;
  edtFantasia.Enabled := True;
  edtNumeroJur.Enabled := True;
  cbbCidadeJur.Enabled := True;
  cbbUFJur.Enabled := True;
  chkContIcmsJur.Enabled := True;
  edtEmailJur.Enabled := True;
  chkSimplesJur.Enabled := True;

  edtContato.Enabled := True;
  edtDddCelJur.Enabled := True;
  edtCelularJur.Enabled := True;
end;

procedure TfFornecedores.desabilitaCamposJuridica;
begin
  edtCNPJ.Enabled := False;
  edtRazaoSocial.Enabled := False;

  edtNumeroJur.Enabled := False;

  edtComplementoJur.Enabled := False;
  edtIeJur.Enabled := False;
  edtDddTelJur.Enabled := False;
  edtTelefoneJur.Enabled := False;
  edtImJur.Enabled := False;
  edtBairroJur.Enabled := False;
  edtEnderecoJur.Enabled := False;
  edtFantasia.Enabled := False;
  edtNumeroJur.Enabled := False;
  cbbCidadeJur.Enabled := False;
  cbbUFJur.Enabled := False;
  chkContIcmsJur.Enabled := False;
  edtEmailJur.Enabled := False;
  chkSimplesJur.Enabled := False;
 
  edtContato.Enabled := False;
  edtDddCelJur.Enabled := False;
  edtCelularJur.Enabled := False;
  edtCepJur.Enabled := False;
end;

end.
