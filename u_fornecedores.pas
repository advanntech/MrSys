unit u_fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrSocket, ACBrCEP, uPesqCPNJ, uPesqCPF, u_PesqForncedores;

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
    edtCNPJ: TMaskEdit;
    lbl4: TLabel;
    imgPesqCNPJ: TImage;
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
    grpFornecimento: TGroupBox;
    chkRevendaIndustria: TDBCheckBox;
    chkRevendaAtacado: TDBCheckBox;
    chkRevendaProdutor: TDBCheckBox;
    chkServicosConsumoImobilizado: TDBCheckBox;
    chkImpostosTaxasContribuicoes: TDBCheckBox;
    chkOutraOperacoes: TDBCheckBox;
    chkExterior: TDBCheckBox;
    chkMicroEmpresa: TDBCheckBox;
    chkTransportador: TDBCheckBox;
    Label1: TLabel;
    edtSuframa: TDBEdit;
    cdsFornecedorescdg_fornecedor: TStringField;
    cdsFornecedoresrazaosocial: TStringField;
    cdsFornecedoresfantasia: TStringField;
    cdsFornecedorescontato: TStringField;
    cdsFornecedorescep: TStringField;
    cdsFornecedoresendereco: TStringField;
    cdsFornecedoresnumero: TStringField;
    cdsFornecedoresidUf: TIntegerField;
    cdsFornecedoresidCidade: TIntegerField;
    cdsFornecedorescomplemento: TStringField;
    cdsFornecedoresdddfone: TStringField;
    cdsFornecedoresfone: TStringField;
    cdsFornecedoresddcelular: TStringField;
    cdsFornecedorescelular: TStringField;
    cdsFornecedoresie: TStringField;
    cdsFornecedoresim: TStringField;
    cdsFornecedoresbairro: TStringField;
    cdsFornecedoresemail: TStringField;
    cdsFornecedorescontribuinte_icms: TStringField;
    cdsFornecedoressimples_nacional: TStringField;
    cdsFornecedoresmicroempresa: TStringField;
    cdsFornecedorestransportador: TStringField;
    cdsFornecedoresindustria: TStringField;
    cdsFornecedoresatacado: TStringField;
    cdsFornecedoresprodutor: TStringField;
    cdsFornecedoresservicos: TStringField;
    cdsFornecedoresimpostos: TStringField;
    cdsFornecedoresoutros: TStringField;
    cdsFornecedoresexterior: TStringField;
    cdsFornecedoressuframa: TStringField;
    procedure imgSairClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCNPJClick(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure imgPesqCliente2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure limparJuridica;

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

procedure TfFornecedores.imgPesqCliente2Click(Sender: TObject);
begin
  if ActiveControl = edtCNPJ then
  begin
    Application.CreateForm(TfPesqFornecedores,fPesqFornecedores);
    fPesqFornecedores.ShowModal;
    if fPesqFornecedores.cnpj_retorno <> '' then
       edtCNPJ.text := fPesqFornecedores.cnpj_retorno;
    fPesqFornecedores.release;
    fPesqFornecedores := nil;

    edtCNPJExit(edtCNPJ);
   end;
end;

procedure TfFornecedores.imgPesqCNPJClick(Sender: TObject);
begin
  if (ActiveControl = edtCnpj) or (edtCNPJ.Text <> EmptyStr) then
  begin
    Application.CreateForm(TfPesqCNPJ,fPesqCNPJ);
    if (edtCNPJ.Text <> EmptyStr) then
    begin
      fPesqCNPJ.edtCNPJ.Text := edtCNPJ.Text;
    end;
    fPesqCNPJ.ShowModal;
    if fPesqCNPJ.cnpj <> EmptyStr then
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
       edtDddTelJur.Text := copy(fPesqCNPJ.telefone,1,4);
       edtTelefoneJur.Text := copy(fPesqCNPJ.telefone,6,9);
       edtCepJur.Text := fPesqCNPJ.cep;
       edtEmailJur.Text := fPesqCNPJ.email;
       if (edtRazaoSocial.Text <> EmptyStr) then
       begin
         edtContato.SetFocus;
       end;

       edtContato.SetFocus;
    end;
    fPesqCNPJ.release;
    fPesqCNPJ := nil;
   end;
end;

procedure TfFornecedores.imgSairClick(Sender: TObject);
begin
  Close;
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

procedure TfFornecedores.btnCancelarClick(Sender: TObject);
begin
  cdsFornecedores.Cancel;
  limparJuridica;
end;

procedure TfFornecedores.btnExcluirClick(Sender: TObject);
begin
  // busca id uf de estados
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id_uf from estados where uf = :uf');
  qrAux.Params.ParamByName('uf').AsString := cbbUFJur.Text;
  qrAux.Open;

  cdsFornecedoresidUf.AsInteger := qrAux.FieldByName('id_uf').AsInteger;

    // busca id uf de cidade
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where id_estado = :id_estado and nome = :nome');
  qrAux.Params.ParamByName('id_estado').AsInteger := cdsFornecedoresidUF.AsInteger;
  qrAux.Params.ParamByName('nome').AsString := cbbCidadeJur.Text;
  qrAux.Open;

  cdsFornecedoresidCidade.AsInteger := qrAux.FieldByName('id').AsInteger;

  cdsFornecedores.Post;
  cdsFornecedores.ApplyUpdates(0);
end;

procedure TfFornecedores.btnNovoClick(Sender: TObject);
begin
  habilitaCamposJuridica;
  desabilitaCamposFisica;
  edtCNPJ.SetFocus;
  limparJuridica;
end;

procedure TfFornecedores.btnSalvarClick(Sender: TObject);
begin
  cdsFornecedores.Delete;
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

procedure TfFornecedores.edtCNPJExit(Sender: TObject);
begin
  if (edtCNPJ.Text <> EmptyStr) then
  begin

    cdsFornecedores.Close;
    cdsFornecedores.Params.ParamByName('cdg_fornecedor').AsString := edtCNPJ.Text;
    cdsFornecedores.Open;

    qrEstados.open;

    while not qrEstados.Eof do
    begin
      cbbUFJur.Items.Add(qrEstadosuf.AsString);
      qrEstados.Next;
    end;

    if (cdsFornecedores.IsEmpty) then
    begin
      cdsFornecedores.Append;
      imgPesqCNPJClick(imgPesqCNPJ);
      cdsFornecedorescdg_fornecedor.AsString := edtCNPJ.Text;
    end
    else
    begin
      cdsFornecedores.Edit;
    end;
  end;
end;

procedure TfFornecedores.FormCreate(Sender: TObject);
begin
  desabilitaCamposJuridica;
  limparJuridica;
end;

end.
