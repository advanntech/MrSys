unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrSocket, ACBrCEP, uPesqCPNJ, uPesqCPF;

type
  TfClientes = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    qrClientes: TSQLQuery;
    dsEmpresa: TDataSource;
    cdsClientes: TClientDataSet;
    dspClientes: TDataSetProvider;
    qrEstados: TSQLQuery;
    qrEstadosuf: TStringField;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    qrAux: TSQLQuery;
    pgcCliente: TPageControl;
    tsJuridica: TTabSheet;
    tsFisica: TTabSheet;
    lbl2: TLabel;
    edtCpf: TMaskEdit;
    lbl3: TLabel;
    edtRazaoSocial: TDBEdit;
    lbl10: TLabel;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    lbl12: TLabel;
    edtRG: TDBEdit;
    Label4: TLabel;
    lbl17: TLabel;
    edtFone: TDBEdit;
    lbl18: TLabel;
    edtFax: TDBEdit;
    Label3: TLabel;
    cbbUF: TComboBox;
    cbbCidades: TComboBox;
    edtNumero: TDBEdit;
    lbl15: TLabel;
    lbl11: TLabel;
    edtemail: TDBEdit;
    lbl19: TLabel;
    Label2: TLabel;
    edtComplemento: TDBEdit;
    lbl13: TLabel;
    edtCEP: TDBEdit;
    imgPesqCliente: TImage;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    imgPesqCep: TImage;
    Label34: TLabel;
    edtDataNascimento: TDBEdit;
    grpDadosPessoais: TGroupBox;
    Label26: TLabel;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label29: TLabel;
    lbl6: TLabel;
    dbedttelefone: TDBEdit;
    lbl8: TLabel;
    dbedttelefone2: TDBEdit;
    lbl7: TLabel;
    dbedttelefone1: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    lbl9: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    grp1: TGroupBox;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    lbl4: TLabel;
    edtCNPJ: TMaskEdit;
    imgPesqCliente2: TImage;
    lbl5: TLabel;
    dbedtrazao_social: TDBEdit;
    lbl14: TLabel;
    edtCep2: TDBEdit;
    lbl16: TLabel;
    edtComplementoJur: TDBEdit;
    lbl20: TLabel;
    edtIeJur: TDBEdit;
    lbl21: TLabel;
    edtTelefoneJur: TDBEdit;
    lbl22: TLabel;
    edtImJur: TDBEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    edtBairroJur: TDBEdit;
    lbl25: TLabel;
    edtEnderecoJur: TDBEdit;
    lbl26: TLabel;
    edtFantasia: TDBEdit;
    edtNumeroJur: TDBEdit;
    lbl28: TLabel;
    cbbCidadeJur: TComboBox;
    lbl29: TLabel;
    cbbUFJur: TComboBox;
    lbl30: TLabel;
    chkContIcmsJur: TDBCheckBox;
    lbl31: TLabel;
    edtEmailJur: TDBEdit;
    grp2: TGroupBox;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    imgPesqCep2: TImage;
    chkSimplesJur: TDBCheckBox;
    lbl27: TLabel;
    pgcComplento: TPageControl;
    ts2: TTabSheet;
    ts1: TTabSheet;
    lbl32: TLabel;
    imgPesqCepCob2: TImage;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    edtCepCob2: TDBEdit;
    edtEnderecoCobJur: TDBEdit;
    edtNumeroCobJur: TDBEdit;
    edtComplementoCobJur: TDBEdit;
    edtBairroCobJur: TDBEdit;
    cbbUFCobJur: TComboBox;
    cbbCidadeCobJur: TComboBox;
    pgc1: TPageControl;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lbl39: TLabel;
    imgPesqCepCob: TImage;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    edtCepCob: TDBEdit;
    dbedtendereco2: TDBEdit;
    dbedtnumero2: TDBEdit;
    dbedtcomplemento2: TDBEdit;
    dbedtbairro2: TDBEdit;
    cbb5: TComboBox;
    cbb6: TComboBox;
    DBGrid1: TDBGrid;
    chkSimples: TDBCheckBox;
    cdsClientescpf_cnpj: TStringField;
    cdsClientestipo: TStringField;
    cdsClientesnome: TStringField;
    cdsClientesfantasia: TStringField;
    cdsClientescontato: TStringField;
    cdsClientescep: TStringField;
    cdsClientesendereco: TStringField;
    cdsClientesnumero: TStringField;
    cdsClientesidUF: TIntegerField;
    cdsClientesidCidade: TIntegerField;
    cdsClientesdddfone: TStringField;
    cdsClientesfone: TStringField;
    cdsClientesdddcel: TStringField;
    cdsClientescelular: TStringField;
    cdsClientesemail: TStringField;
    cdsClientesie: TStringField;
    cdsClientesim: TStringField;
    cdsClientesrg: TStringField;
    cdsClientescontrib_icms: TIntegerField;
    cdsClientessimples_nacional: TIntegerField;
    cdsClientescep_cobranca: TStringField;
    cdsClientesendereco_cobranca: TStringField;
    cdsClientesbairro_cobranca: TStringField;
    cdsClientesidUf_cobranca: TIntegerField;
    cdsClientesestado_civil: TStringField;
    cdsClientespai: TStringField;
    cdsClientesmae: TStringField;
    cdsClientesconjude: TStringField;
    cdsClientestrabalho: TStringField;
    cdsClientesnaturalidade: TStringField;
    cdsClientesdependentes: TIntegerField;
    ACBrCEP1: TACBrCEP;
    imgPespCNPJ: TImage;
    Image2: TImage;
    edtContato: TDBEdit;
    edtDddTelJur: TDBEdit;
    edtCelularJur: TDBEdit;
    edtDddCel: TDBEdit;
    Label1: TLabel;
    edtCNAE: TDBEdit;
    procedure imgSairClick(Sender: TObject);
    procedure imgPesqCepClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCepCobClick(Sender: TObject);
    procedure imgPesqCep2Click(Sender: TObject);
    procedure imgPesqCepCob2Click(Sender: TObject);
    procedure imgPespCNPJClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClientes: TfClientes;

implementation

{$R *.dfm}

procedure TfClientes.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

procedure TfClientes.Image2Click(Sender: TObject);
begin
   if ActiveControl = edtCPF then
  begin
    Application.CreateForm(TfPesqCPF,fPesqCPF);
    fPesqCPF.ShowModal;
    if fPesqCPF.cpf <> '' then
    begin
       edtCpf.text := fPesqCPF.cpf;
       edtRazaoSocial.Text := fPesqCPF.razaosocial;
       edtDataNascimento.Text := fPesqCPF.nascimento;
       edtNumeroJur.Text := fPesqCNPJ.numero;
    end;
    fPesqCPF.release;
    fPesqCPF := nil;
   end;
end;

procedure TfClientes.imgPespCNPJClick(Sender: TObject);
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
       edtCNAE.Text := fPesqCNPJ.cnae;
       edtCep2.Text := fPesqCNPJ.cep;
       edtEmailJur.Text := fPesqCNPJ.email;
    end;
    fPesqCNPJ.release;
    fPesqCNPJ := nil;
   end;
end;

procedure TfClientes.imgPesqCep2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP2.Text)
end;

procedure TfClientes.imgPesqCepClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfClientes.imgPesqCepCob2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepCob2.Text)
end;

procedure TfClientes.imgPesqCepCobClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepCob.Text)
end;

procedure TfClientes.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
