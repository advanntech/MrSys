unit u_funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrSocket, ACBrCEP, uPesqCPNJ, uPesqCPF;

type
  TfFuncionarios = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pgcCliente: TPageControl;
    tsFisica: TTabSheet;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl9: TLabel;
    lbl17: TLabel;
    lbl46: TLabel;
    lbl15: TLabel;
    lbl11: TLabel;
    lbl19: TLabel;
    lbl47: TLabel;
    lbl13: TLabel;
    imgPesqCliente: TImage;
    imgPesqCep: TImage;
    lbl50: TLabel;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    lbl18: TLabel;
    edtCpf: TMaskEdit;
    edtNome: TDBEdit;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    edtRG: TDBEdit;
    edtFoneFis: TDBEdit;
    cbbUF: TComboBox;
    cbbCidades: TComboBox;
    edtNumero: TDBEdit;
    edtEmailFis: TDBEdit;
    edtComplemento: TDBEdit;
    edtCEP: TDBEdit;
    edtDataNascimento: TDBEdit;
    grpDadosPessoais: TGroupBox;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    edtConjuge: TDBEdit;
    cbbEstadoCivil: TDBComboBox;
    edtNomePai: TDBEdit;
    edtNomeMae: TDBEdit;
    grpDependentes: TDBRadioGroup;
    grp1: TGroupBox;
    img1: TImage;
    edtCelularFis: TDBEdit;
    edtDddCelFis: TDBEdit;
    edtDddFoneFis: TDBEdit;
    qrFuncionarios: TSQLQuery;
    dsFuncionarios: TDataSource;
    cdsFuncionarios: TClientDataSet;
    cdsFuncionariostipo: TStringField;
    cdsFuncionariosnome: TStringField;
    cdsFuncionariosfantasia: TStringField;
    cdsFuncionarioscontato: TStringField;
    cdsFuncionarioscep: TStringField;
    cdsFuncionariosendereco: TStringField;
    cdsFuncionariosnumero: TStringField;
    cdsFuncionariosidUF: TIntegerField;
    cdsFuncionariosidCidade: TIntegerField;
    cdsFuncionariosdddfone: TStringField;
    cdsFuncionariosfone: TStringField;
    cdsFuncionariosdddcel: TStringField;
    cdsFuncionarioscelular: TStringField;
    cdsFuncionariosemail: TStringField;
    cdsFuncionariosie: TStringField;
    cdsFuncionariosim: TStringField;
    cdsFuncionariosrg: TStringField;
    cdsFuncionarioscep_cobranca: TStringField;
    cdsFuncionariosendereco_cobranca: TStringField;
    cdsFuncionariosbairro_cobranca: TStringField;
    cdsFuncionariosidUf_cobranca: TIntegerField;
    cdsFuncionariosidCidade_cobranca: TIntegerField;
    cdsFuncionariosestado_civil: TStringField;
    cdsFuncionariospai: TStringField;
    cdsFuncionariosmae: TStringField;
    cdsFuncionariosconjude: TStringField;
    cdsFuncionariostrabalho: TStringField;
    cdsFuncionariosnaturalidade: TStringField;
    cdsFuncionariosdatanascimento: TDateField;
    cdsFuncionariosnumero_cobranca: TStringField;
    cdsFuncionarioscomplemento_cobranca: TStringField;
    cdsFuncionarioscomplemento: TStringField;
    cdsFuncionarioscdg_cliente: TStringField;
    cdsFuncionarioscontrib_icms: TStringField;
    cdsFuncionariossimples_nacional: TStringField;
    cdsFuncionariosdependentes: TStringField;
    cdsFuncionariosbairro: TStringField;
    dspFuncionarios: TDataSetProvider;
    qrEstados: TSQLQuery;
    qrEstadosuf: TStringField;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    qrAux: TSQLQuery;
    ACBrCEP1: TACBrCEP;
    grp2: TGroupBox;
    lbl48: TLabel;
    edtIeFis: TDBEdit;
    lbl49: TLabel;
    edtImFis: TDBEdit;
    lbl4: TLabel;
    edtim: TDBEdit;
    lblSetor: TLabel;
    lbl5: TLabel;
    edtcep1: TDBEdit;
    img5: TImage;
    edtcep2: TDBEdit;
    img6: TImage;
    procedure imgSairClick(Sender: TObject);
    procedure imgPesqCepClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCepCobClick(Sender: TObject);
    procedure imgPesqCep2Click(Sender: TObject);
    procedure imgPesqCepCob2Click(Sender: TObject);
    procedure imgPespCNPJClick(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbbUFJurExit(Sender: TObject);
    procedure cbbUFCobJurExit(Sender: TObject);
    procedure cbbUFExit(Sender: TObject);
    procedure cbbUfCobFisExit(Sender: TObject);
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
  fFuncionarios: TfFuncionarios;

implementation

{$R *.dfm}

procedure TfFuncionarios.ACBrCEP1BuscaEfetuada(Sender: TObject);
var i : Integer;
begin
  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    edtCEP.Text := ACBrCEP1.Enderecos[i].CEP;
    edtEndereco.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
    cbbUF.Text := ACBrCEP1.Enderecos[i].UF;
    cbbCidades.Text := ACBrCEP1.Enderecos[i].Municipio;
    edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
  end;
end;

procedure TfFuncionarios.img4Click(Sender: TObject);
begin
   if ActiveControl = edtCPF then
  begin
    Application.CreateForm(TfPesqCPF,fPesqCPF);
    fPesqCPF.ShowModal;
    if fPesqCPF.cpf <> '' then
    begin
       edtCpf.text := fPesqCPF.cpf;
//       edtRazaoSocial.Text := fPesqCPF.razaosocial;
//       edtDataNascimento.Text := fPesqCPF.nascimento;
//       edtNumeroJur.Text := fPesqCNPJ.numero;
    end;
    fPesqCPF.release;
    fPesqCPF := nil;
   end;
end;

procedure TfFuncionarios.imgPespCNPJClick(Sender: TObject);
begin
  if ActiveControl = edtCpf then
  begin
    Application.CreateForm(TfPesqCNPJ,fPesqCNPJ);
    fPesqCNPJ.ShowModal;
    if fPesqCNPJ.cnpj <> '' then
    begin
//       edtCnpj.text := fPesqCNPJ.cnpj;
//       edtRazaoSocial.Text := fPesqCNPJ.razaosocial;
//       edtFantasia.Text := fPesqCNPJ.fantasia;
//       edtEnderecoJur.Text := fPesqCNPJ.endereco;
//       edtNumeroJur.Text := fPesqCNPJ.numero;
//       edtBairroJur.Text := fPesqCNPJ.bairro;
//       edtComplementoJur.Text := fPesqCNPJ.complemento;
//       cbbUFJur.Text := fPesqCNPJ.uf;
//       cbbCidadeJur.Text := fPesqCNPJ.cidade;
//       edtTelefoneJur.Text := fPesqCNPJ.telefone;
//       edtCepJur.Text := fPesqCNPJ.cep;
//       edtEmailJur.Text := fPesqCNPJ.email;
    end;
    fPesqCNPJ.release;
    fPesqCNPJ := nil;
   end;
end;

procedure TfFuncionarios.imgPesqCep2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfFuncionarios.imgPesqCepClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfFuncionarios.imgPesqCepCob2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfFuncionarios.imgPesqCepCobClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfFuncionarios.imgSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfFuncionarios.limparFisica;
begin
  edtCpf.Clear;
  edtNome.Clear;
  edtEndereco.Clear;
  edtBairro.Clear;
  edtRG.Clear;
  cbbUF.Clear;
  cbbCidades.Clear;
  edtNumero.Clear;
  edtComplemento.Clear;
  edtCEP.Clear;
  edtDataNascimento.Clear;
  edtConjuge.Clear;
  cbbEstadoCivil.Clear;
  edtNomePai.Clear;
  edtNomeMae.Clear;
  edtDddCelFis.Clear;
  edtCelularFis.Clear;
  edtDddCelFis.Clear;
  edtDddFoneFis.Clear;
end;


procedure TfFuncionarios.limparJuridica;
begin
//  edtCNPJ.Clear;
//  edtRazaoSocial.Clear;
//  edtEndereco.Clear;
//  edtBairro.Clear;
//  edtNumeroJur.Clear;
//  edtCepCobJur.Clear;
//  edtComplementoJur.Clear;
//  edtIeJur.Clear;
//  edtDddTelJur.Clear;
//  edtTelefoneJur.Clear;
//  edtImJur.Clear;
//  edtBairroJur.Clear;
//  edtEnderecoJur.Clear;
//  edtFantasia.Clear;
//  edtNumeroJur.Clear;
//  cbbCidadeJur.Clear;
//  cbbUFJur.Clear;
//  chkContIcmsJur.Checked := False;
//  edtEmailJur.Clear;
//  chkSimplesJur.Checked := False;
//  edtCepCobJur.Clear;
//  edtEnderecoCobJur.Clear;
//  edtNumeroCobJur.Clear;
//  edtComplementoCobJur.Clear;
//  edtBairroCobJur.Clear;
//  cbbUFCobJur.Clear;
//  cbbCidadeCobJur.Clear;
//  edtContato.Clear;
//  edtDddCelJur.Clear;
//  edtCelularJur.Clear;
end;

procedure TfFuncionarios.habilitaCamposFisica;
begin
  edtCpf.Enabled := True;
  edtNome.Enabled := True;
  edtEndereco.Enabled := True;
  edtBairro.Enabled := True;
  edtRG.Enabled := True;
  cbbUF.Enabled := True;
  cbbCidades.Enabled := True;
  edtNumero.Enabled := True;
  edtComplemento.Enabled := True;
  edtCEP.Enabled := True;
  edtDataNascimento.Enabled := True;
  edtConjuge.Enabled := True;
  cbbEstadoCivil.Enabled := True;
  edtNomePai.Enabled := True;
  edtNomeMae.Enabled := True;

  edtDddCelFis.Enabled := True;
  edtCelularFis.Enabled := True;
  edtDddCelFis.Enabled := True;
  edtDddFoneFis.Enabled := True;
end;

procedure TfFuncionarios.btnNovoClick(Sender: TObject);
begin
  if (tsFisica.Showing = True) then
  begin
    habilitaCamposFisica;
    desabilitaCamposJuridica;
    edtCpf.SetFocus;
    limparFisica;
    limparJuridica;
  end;




end;

procedure TfFuncionarios.cbbUfCobFisExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUF.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCidades.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfFuncionarios.cbbUFCobJurExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUF.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCidades.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfFuncionarios.cbbUFExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUF.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCidades.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfFuncionarios.cbbUFJurExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUF.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCidades.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfFuncionarios.desabilitaCamposFisica;
begin
  edtCpf.Enabled := False;
  edtNome.Enabled := False;
  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtRG.Enabled := False;
  cbbUF.Enabled := False;
  cbbCidades.Enabled := False;
  edtNumero.Enabled := False;
  edtComplemento.Enabled := False;
  edtCEP.Enabled := False;
  edtDataNascimento.Enabled := False;
  edtConjuge.Enabled := False;
  cbbEstadoCivil.Enabled := False;
  edtNomePai.Enabled := False;
  edtNomeMae.Enabled := False;
//  edtTrabalho.Enabled := False;
//  edtNaturalidade.Enabled := False;
//  edtCepCobFis.Enabled := False;
//  edtEnderecoCobFis.Enabled := False;
//  edtNumeroCobFis.Enabled := False;
//  edtComplementoCobFis.Enabled := False;
//  edtBairroCobFis.Enabled := False;
//  cbbUfCobFis.Enabled := False;
//  cbbCidadeCobFis.Enabled := False;
//  chkSimplesFis.Enabled := False;
//  chkContIcmsFis.Enabled := False;
  edtDddCelFis.Enabled := False;
  edtCelularFis.Enabled := False;
  edtDddCelFis.Enabled := False;
  edtDddFoneFis.Enabled := False;
end;

procedure TfFuncionarios.habilitaCamposJuridica;
begin

end;

procedure TfFuncionarios.desabilitaCamposJuridica;
begin
 
end;

end.
