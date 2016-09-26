unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  ACBrBase, ACBrSocket, ACBrCEP, uPesqCPNJ, uPesqCPF, u_PesqClientes, uConvenio;

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
    dsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    dspClientes: TDataSetProvider;
    qrEstados: TSQLQuery;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    qrAux: TSQLQuery;
    pgcCliente: TPageControl;
    tsFisica: TTabSheet;
    tsJuridica: TTabSheet;
    lbl2: TLabel;
    edtCpf: TMaskEdit;
    lbl3: TLabel;
    edtNome: TDBEdit;
    lbl10: TLabel;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    lbl12: TLabel;
    edtRG: TDBEdit;
    Label4: TLabel;
    lbl17: TLabel;
    edtFoneFis: TDBEdit;
    Label3: TLabel;
    edtNumero: TDBEdit;
    lbl15: TLabel;
    lbl11: TLabel;
    edtEmailFis: TDBEdit;
    lbl19: TLabel;
    Label2: TLabel;
    edtComplemento: TDBEdit;
    lbl13: TLabel;
    edtCEP: TDBEdit;
    imgPesqCliente: TImage;
    Label27: TLabel;
    Label28: TLabel;
    edtImFis: TDBEdit;
    edtIeFis: TDBEdit;
    chkContIcmsFis: TDBCheckBox;
    imgPesqCep: TImage;
    Label34: TLabel;
    edtDataNascimento: TDBEdit;
    grp1: TGroupBox;
    imgFotoFis: TImage;
    imgCaregaFotoFis: TImage;
    img3: TImage;
    lbl4: TLabel;
    edtCNPJ: TMaskEdit;
    imgPesqCliente2: TImage;
    lbl5: TLabel;
    edtRazaoSocial: TDBEdit;
    lbl14: TLabel;
    edtCepJur: TDBEdit;
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
    imgFotoJur: TImage;
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
    edtCepCobJur: TDBEdit;
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
    edtCepCobFis: TDBEdit;
    edtEnderecoCobFis: TDBEdit;
    edtNumeroCobFis: TDBEdit;
    edtComplementoCobFis: TDBEdit;
    edtBairroCobFis: TDBEdit;
    DBGrid1: TDBGrid;
    chkSimplesFis: TDBCheckBox;
    ACBrCEP1: TACBrCEP;
    imgPesqCNPJ: TImage;
    imgPesqCPF: TImage;
    edtContato: TDBEdit;
    edtDddTelJur: TDBEdit;
    edtDddCelJur: TDBEdit;
    edtCelularJur: TDBEdit;
    edtCelularFis: TDBEdit;
    edtDddCelFis: TDBEdit;
    lbl18: TLabel;
    edtDddFoneFis: TDBEdit;
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
    cdsClientescep_cobranca: TStringField;
    cdsClientesendereco_cobranca: TStringField;
    cdsClientesbairro_cobranca: TStringField;
    cdsClientesidUf_cobranca: TIntegerField;
    cdsClientesidCidade_cobranca: TIntegerField;
    cdsClientesestado_civil: TStringField;
    cdsClientespai: TStringField;
    cdsClientesmae: TStringField;
    cdsClientesconjude: TStringField;
    cdsClientestrabalho: TStringField;
    cdsClientesnaturalidade: TStringField;
    cdsClientesdatanascimento: TDateField;
    cdsClientesnumero_cobranca: TStringField;
    cdsClientescomplemento_cobranca: TStringField;
    cdsClientescomplemento: TStringField;
    cdsClientescdg_cliente: TStringField;
    cdsClientescontrib_icms: TStringField;
    cdsClientessimples_nacional: TStringField;
    cdsClientesdependentes: TStringField;
    cdsClientesbairro: TStringField;
    dlgOpen1: TOpenDialog;
    cdsClientesfoto: TMemoField;
    Label5: TLabel;
    cdsClientesrenda: TFloatField;
    cdsClientesprofissao: TStringField;
    cdsClientesmoradia: TStringField;
    cdsClientescep_entrega: TStringField;
    cdsClientesendereco_entrega: TStringField;
    cdsClientesnumero_entrega: TStringField;
    cdsClientesbairro_entrega: TStringField;
    cdsClientescomplemento_entrega: TStringField;
    cdsClientesiduf_entrega: TIntegerField;
    cdsClientesidcidade_entegra: TIntegerField;
    cdsClientesqtdedependentes: TIntegerField;
    tsEntrega: TTabSheet;
    lbl47: TLabel;
    edtCEPEntregaFis: TDBEdit;
    imgPesqCepEntrega: TImage;
    edtComplEntregaFis: TDBEdit;
    lbl48: TLabel;
    lbl49: TLabel;
    edtBairroEntregaFis: TDBEdit;
    edtEndEntregaFis: TDBEdit;
    lbl50: TLabel;
    lbl51: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    edtNumEntregaFis: TDBEdit;
    tsEndEntrega: TTabSheet;
    lbl54: TLabel;
    edtcepEntregaJur: TDBEdit;
    imgPesqEntregaJur: TImage;
    lbl55: TLabel;
    edtEndEntregaJur: TDBEdit;
    edtBairroEntregaJur: TDBEdit;
    edtComplEntregaJur: TDBEdit;
    lbl56: TLabel;
    lbl57: TLabel;
    cbbUfEntregaJur: TComboBox;
    lbl58: TLabel;
    cbbCidadeEntregaJur: TComboBox;
    lbl59: TLabel;
    edtNumEntregaJur: TDBEdit;
    lbl60: TLabel;
    qrConvenio: TSQLQuery;
    qrConvenioidconvenio: TIntegerField;
    qrConvenionome: TStringField;
    lbl61: TLabel;
    cbbLookConvenio: TDBLookupComboBox;
    cdsConvenio: TClientDataSet;
    dspConvenio: TDataSetProvider;
    dsConvenio: TDataSource;
    cdsClientesidconvenio: TIntegerField;
    cdsConvenioidconvenio: TIntegerField;
    cdsConvenionome: TStringField;
    imgCadConvenio: TImage;
    qrEstadosid: TIntegerField;
    qrEstadosuf: TStringField;
    dsCidades: TDataSource;
    qrCidadesid: TIntegerField;
    cbbUF: TComboBox;
    cbbCidades: TComboBox;
    cbbUfEntregaFis: TComboBox;
    cbbCidadeEntregaFis: TComboBox;
    cbbUfCobFis: TComboBox;
    cbbCidadeCobFis: TComboBox;
    grpDadosPessoais: TGroupBox;
    Label26: TLabel;
    Label29: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl7: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    lbl9: TLabel;
    lbl46: TLabel;
    lblQtos: TLabel;
    edtConjuge: TDBEdit;
    cbbEstadoCivil: TDBComboBox;
    edtNomePai: TDBEdit;
    edtNomeMae: TDBEdit;
    edtTrabalho: TDBEdit;
    edtNaturalidade: TDBEdit;
    grpdependentes: TDBRadioGroup;
    edtProfissao: TDBEdit;
    edtRenda: TDBEdit;
    cbbMoradia: TDBComboBox;
    edtQtdDependentes: TDBEdit;
    qrCidadePost: TSQLQuery;
    qrCidadePostid: TIntegerField;
    procedure imgSairClick(Sender: TObject);
    procedure imgPesqCepClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCepCobClick(Sender: TObject);
    procedure imgPesqCep2Click(Sender: TObject);
    procedure imgPesqCepCob2Click(Sender: TObject);
    procedure imgPesqCNPJClick(Sender: TObject);
    procedure imgPesqCPFClick(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbbUFJurExit(Sender: TObject);
    procedure cbbUFCobJurExit(Sender: TObject);
    procedure cbbUFExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure grpdependentesClick(Sender: TObject);
    procedure imgCaregaFotoFisClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtRGExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure imgPesqClienteClick(Sender: TObject);
    procedure imgPesqCliente2Click(Sender: TObject);
    procedure edtContatoExit(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure imgPesqCepEntregaClick(Sender: TObject);
    procedure cbbUfEntregaJurExit(Sender: TObject);
    procedure cbbUFEntregaFisExit(Sender: TObject);
    procedure imgCadConvenioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  fClientes: TfClientes;

implementation

{$R *.dfm}

procedure TfClientes.ACBrCEP1BuscaEfetuada(Sender: TObject);
var i : Integer;
begin
  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    if (ActiveControl = edtCEP) or (ActiveControl = edtCepJur)  then
    begin
      edtCEP.Text := ACBrCEP1.Enderecos[i].CEP;
      edtEndereco.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
      cbbUF.Text :=  ACBrCEP1.Enderecos[i].UF;
      cbbCidades.Text :=  ACBrCEP1.Enderecos[i].Municipio;
      edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
    end;

    if (ActiveControl = edtCepCobFis) then
    begin
      edtCepCobFis.Text := ACBrCEP1.Enderecos[i].CEP;
      edtEnderecoCobFis.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
      cbbUFCobFis.Text := ACBrCEP1.Enderecos[i].UF;
      cbbCidadeCobFis.Text := ACBrCEP1.Enderecos[i].Municipio;
      edtBairroCobFis.Text := ACBrCEP1.Enderecos[i].Bairro;
    end;

    if (ActiveControl = edtCepCobJur) then
    begin
      edtCepCobJur.Text := ACBrCEP1.Enderecos[i].CEP;
      edtEnderecoCobJur.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
      cbbUFCobJur.Text := ACBrCEP1.Enderecos[i].UF;
      cbbCidadeCobJur.Text := ACBrCEP1.Enderecos[i].Municipio;
      edtBairroCobJur.Text := ACBrCEP1.Enderecos[i].Bairro;
    end;


    if (ActiveControl = edtCEPEntregaFis) then
    begin
      edtCEPEntregaFis.Text := ACBrCEP1.Enderecos[i].CEP;
      edtEndEntregaFis.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
      cbbUFEntregaFis.Text := ACBrCEP1.Enderecos[i].UF;
      cbbCidadeEntregaFis.Text := ACBrCEP1.Enderecos[i].Municipio;
      edtBairroEntregaFis.Text := ACBrCEP1.Enderecos[i].Bairro;
    end;

    if (ActiveControl = edtCEPEntregaFis) then
    begin
      edtcepEntregaJur.Text := ACBrCEP1.Enderecos[i].CEP;
      edtEndEntregaJur.Text := ACBrCEP1.Enderecos[i].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[i].Logradouro;
      cbbUFEntregaJur.Text := ACBrCEP1.Enderecos[i].UF;
      cbbCidadeEntregaJur.Text := ACBrCEP1.Enderecos[i].Municipio;
      edtBairroEntregaJur.Text := ACBrCEP1.Enderecos[i].Bairro;
    end;
  end;
end;

procedure TfClientes.edtCEPExit(Sender: TObject);
begin
  if (edtEndereco.Text <> EmptyStr) then
  begin
    edtNumero.SetFocus;
  end;

end;

procedure TfClientes.edtCNPJExit(Sender: TObject);
begin
 if (edtCNPJ.Text <> EmptyStr) then
  begin
    edtCpf.Text := EmptyStr;

    cdsClientes.Close;
    cdsClientes.Params.ParamByName('cdg_cliente').AsString := edtCNPJ.Text;
    cdsClientes.Open;

    qrEstados.open;

    while not qrEstados.Eof do
    begin
      cbbUFJur.Items.Add(qrEstadosuf.AsString);
      cbbUFCobJur.Items.Add(qrEstadosuf.AsString);
      qrEstados.Next;
    end;

    if (cdsClientes.IsEmpty) then
    begin
      cdsClientes.Append;
      imgPesqCNPJClick(imgPesqCNPJ);
      cdsClientescdg_cliente.AsString := edtCNPJ.Text;
    end
    else
    begin
      cdsClientes.Edit;
    end;
  end;
end;

procedure TfClientes.edtComplementoExit(Sender: TObject);
begin
  if (edtBairro.Text <> EmptyStr) then
  begin
    edtIeFis.SetFocus;
  end;

end;

procedure TfClientes.edtContatoExit(Sender: TObject);
begin
  if (edtCepJur.Text <> EmptyStr) then
  begin
    edtIeJur.SetFocus;
  end;
end;

procedure TfClientes.edtCpfExit(Sender: TObject);
begin
  if (edtCpf.Text <> EmptyStr) then
  begin
    edtCNPJ.Text := EmptyStr;

    cdsClientes.Close;
    cdsClientes.Params.ParamByName('cdg_cliente').AsString := edtCpf.Text;
    cdsClientes.Open;

    qrEstados.open;

    while not qrEstados.Eof do
    begin
      cbbUF.Items.Add(qrEstadosuf.AsString);
      cbbUfCobFis.Items.Add(qrEstadosuf.AsString);
      cbbUFEntregaFis.Items.Add(qrEstadosuf.AsString);
      qrEstados.Next;
    end;

    if (cdsClientes.IsEmpty) then
    begin
      cdsClientes.Append;
      imgPesqCPFClick(imgPesqCPF);
      cdsClientescdg_cliente.AsString := edtCpf.Text;
    end
    else
    begin
      cdsClientes.Edit;

      if cdsClientesdependentes.AsString = '1' then
      begin
         grpdependentes.ItemIndex := 0;
      end
      else
      begin
        grpdependentes.ItemIndex := 1;
      end;
    end;
  end;
end;

procedure TfClientes.edtRGExit(Sender: TObject);
begin
  if (edtDataNascimento.Text <> EmptyStr) then
  begin
    edtCEP.SetFocus;
  end;
end;

procedure TfClientes.FormShow(Sender: TObject);
begin
  desabilitaCamposJuridica;
  desabilitaCamposFisica;
end;

procedure TfClientes.grpdependentesClick(Sender: TObject);
begin
  if grpdependentes.ItemIndex = 0 then
  begin
    cdsClientesdependentes.AsString := '0';
    lblQtos.Visible := True;
    edtQtdDependentes.Visible := True;
  end
  else
  begin
    cdsClientesdependentes.AsString := '1';
    lblQtos.Visible := False;
    edtQtdDependentes.Visible := False;
  end;
end;

procedure TfClientes.imgPesqCPFClick(Sender: TObject);
begin
  if (ActiveControl = edtCPF) or (edtCpf.Text <> EmptyStr) then
  begin
    Application.CreateForm(TfPesqCPF,fPesqCPF);
    if (edtCpf.Text <> EmptyStr) then
    begin
      fPesqCPF.edtCPF.Text := edtCpf.Text;
    end;
    fPesqCPF.ShowModal;
    if fPesqCPF.cpf <> EmptyStr then
    begin
       edtCpf.text := fPesqCPF.cpf;
       edtNome.Text := fPesqCPF.razaosocial;
       edtDataNascimento.Text := fPesqCPF.nascimento;
       if edtNome.Text <> EmptyStr then
       begin
        edtRG.SetFocus;
       end;

       edtRG.SetFocus
    end;
    fPesqCPF.release;
    fPesqCPF := nil;
   end;
end;

procedure TfClientes.imgPesqCNPJClick(Sender: TObject);
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

procedure TfClientes.img3Click(Sender: TObject);
begin
  imgFotoFis.Picture.Destroy;
  cdsClientesfoto.Clear;
end;

procedure TfClientes.img6Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    cdsClientesfoto.LoadFromFile(dlgOpen1.FileName);
    imgFotoJur.Picture.LoadFromFile(dlgOpen1.FileName);
  end;
end;

procedure TfClientes.img7Click(Sender: TObject);
begin
  imgFotoJur.Picture.Destroy;
  cdsClientesfoto.Clear;
end;

procedure TfClientes.imgCadConvenioClick(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfConvenio, fConvenio);
  fConvenio.ShowModal;
  cdsConvenio.Refresh;
end;

procedure TfClientes.imgCaregaFotoFisClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    cdsClientesfoto.LoadFromFile(dlgOpen1.FileName);
    imgFotoFis.Picture.LoadFromFile(dlgOpen1.FileName);
  end;
end;

procedure TfClientes.imgPesqCep2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepJur.Text)
end;

procedure TfClientes.imgPesqCepClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEP.Text)
end;

procedure TfClientes.imgPesqCepCob2Click(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepCobJur.Text)
end;

procedure TfClientes.imgPesqCepCobClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCepCobFis.Text)
end;

procedure TfClientes.imgPesqCepEntregaClick(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(edtCEPEntregaFis.Text)
end;

procedure TfClientes.imgPesqCliente2Click(Sender: TObject);
begin
  if ActiveControl = edtCNPJ then
  begin
    Application.CreateForm(TfPesqClientes,fPesqClientes);
    fPesqClientes.ShowModal;
    if fPesqClientes.cnpj_retorno <> '' then
       edtCNPJ.text := fPesqClientes.cnpj_retorno;
    fPesqClientes.release;
    fPesqClientes := nil;

    edtCNPJExit(edtCNPJ);
   end;
end;

procedure TfClientes.imgPesqClienteClick(Sender: TObject);
begin
  if ActiveControl = edtCpf then
  begin
    Application.CreateForm(TfPesqClientes,fPesqClientes);
    fPesqClientes.ShowModal;
    if fPesqClientes.cnpj_retorno <> '' then
       edtCpf.text := fPesqClientes.cnpj_retorno;
    fPesqClientes.release;
    fPesqClientes := nil;

    edtCpfExit(edtCpf);
   end;

end;

procedure TfClientes.imgSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfClientes.limparFisica;
begin
  edtCpf.Clear;
  edtNome.Clear;
  edtEndereco.Clear;
  edtBairro.Clear;
  edtRG.Clear;
  cbbUF.ItemIndex := -1;
  cbbCidades.ItemIndex := -1;
  edtNumero.Clear;
  edtComplemento.Clear;
  edtCEP.Clear;
  edtDataNascimento.Clear;
  edtConjuge.Clear;
  cbbMoradia.ItemIndex := -1;
  cbbEstadoCivil.ItemIndex := -1;
  edtNomePai.Clear;
  edtNomeMae.Clear;
  edtTrabalho.Clear;
  edtNaturalidade.Clear;
  edtCepCobFis.Clear;
  edtEnderecoCobFis.Clear;
  edtNumeroCobFis.Clear;
  edtComplementoCobFis.Clear;
  edtBairroCobFis.Clear;
  cbbUfCobFis.ItemIndex := -1;
  cbbCidadeCobFis.ItemIndex := -1;
  cbbUfEntregaFis.Clear;
  cbbCidadeEntregaFis.Clear;
  chkSimplesFis.Checked := False;
  chkContIcmsFis.Checked := False;
  edtDddCelFis.Clear;
  edtCelularFis.Clear;
  edtDddCelFis.Clear;
  edtDddFoneFis.Clear;
end;


procedure TfClientes.limparJuridica;
begin
  edtCNPJ.Clear;
  edtRazaoSocial.Clear;
  edtEndereco.Clear;
  edtBairro.Clear;
  edtNumeroJur.Clear;
  edtCepCobJur.Clear;
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
  edtCepCobJur.Clear;
  edtEnderecoCobJur.Clear;
  edtNumeroCobJur.Clear;
  edtComplementoCobJur.Clear;
  edtBairroCobJur.Clear;
  cbbUFCobJur.Clear;
  cbbCidadeCobJur.Clear;
  edtContato.Clear;
  edtDddCelJur.Clear;
  edtCelularJur.Clear;
  edtcepEntregaJur.Clear;
  edtEndEntregaJur.Clear;
  edtNumEntregaJur.Clear;
  edtBairroEntregaJur.Clear;
  edtComplEntregaJur.Clear;
  cbbUfEntregaJur.Clear;
  cbbCidadeEntregaJur.Clear;
end;

procedure TfClientes.habilitaCamposFisica;
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
  cbbMoradia.Enabled := True;
  edtNomePai.Enabled := True;
  edtNomeMae.Enabled := True;
  edtTrabalho.Enabled := True;
  edtNaturalidade.Enabled := True;
  edtCepCobFis.Enabled := True;
  edtEnderecoCobFis.Enabled := True;
  edtNumeroCobFis.Enabled := True;
  edtComplementoCobFis.Enabled := True;
  edtBairroCobFis.Enabled := True;
  cbbUfCobFis.Enabled := True;
  cbbCidadeCobFis.Enabled := True;
  chkSimplesFis.Enabled := True;
  chkContIcmsFis.Enabled := True;
  edtDddCelFis.Enabled := True;
  edtCelularFis.Enabled := True;
  edtDddCelFis.Enabled := True;
  edtDddFoneFis.Enabled := True;
  edtCEPEntregaFis.Clear;
  edtEndEntregaFis.Clear;
  edtNumEntregaFis.Clear;
  edtBairroEntregaFis.Clear;
  edtComplEntregaFis.Clear;
  edtImFis.Enabled := True;
  edtIeFis.Enabled := True;
  edtFoneFis.Enabled := True;
  edtProfissao.Enabled := True;
  edtRenda.Enabled := True;
  edtCEPEntregaFis.Enabled := True;
  edtEndEntregaFis.Enabled := True;
  edtBairroCobFis.Enabled := True;
  edtNumEntregaFis.Enabled := True;
  edtComplEntregaFis.Enabled := True;
  cbbUFEntregaFis.Enabled := True;
  cbbEstadoCivil.Enabled := True;
  cbbCidadeEntregaFis.Enabled := True;
end;

procedure TfClientes.btnCancelarClick(Sender: TObject);
begin
  cdsClientes.Cancel;
  limparJuridica;
  limparFisica;
end;

procedure TfClientes.btnExcluirClick(Sender: TObject);
begin
  cdsClientes.Delete;
end;

procedure TfClientes.btnNovoClick(Sender: TObject);
begin
  cdsConvenio.Open;

  if (tsFisica.Showing = True) then
  begin
    habilitaCamposFisica;
    desabilitaCamposJuridica;
    edtCpf.SetFocus;
    limparFisica;
    limparJuridica;
  end;

  if (tsJuridica.Showing = True) then
  begin
    habilitaCamposJuridica;
    desabilitaCamposFisica;
    edtCNPJ.SetFocus;
    limparFisica;
    limparJuridica;
  end;

end;

procedure TfClientes.btnSalvarClick(Sender: TObject);

begin
  if (edtCpf.Text <> EmptyStr) then
  begin

    edtCNPJ.EditMask := EmptyStr;

    // busca id uf de estados
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select id from estados where uf = :uf');
    qrAux.Params.ParamByName('uf').AsString := cbbUF.Text;
    qrAux.Open;

    cdsClientesidUF.AsInteger := qrAux.FieldByName('id').AsInteger;

//
//    // busca id uf de cidade
//    qrCidadePost.Close;
//    qrCidadePost.SQL.Clear;
//    qrCidadePost.SQL.Add('select id from cidades where id_estado = :id and nome like  (' + '''' + '%' + cbbCidades.Text + '%' + '''');
//    qrCidadePost.Params.ParamByName('id').AsInteger := vIdUf;
//    qrCidadePost.Open;

    cdsClientesidCidade.AsInteger := 20448;


    if cbbUfCobFis.Text <> EmptyStr then
    begin
      // busca id uf de estado cobrança
      qrAux.Close;
      qrAux.SQL.Clear;
      qrAux.SQL.Add('select id from estados where uf = :uf');
      qrAux.Params.ParamByName('uf').AsString := cbbUfCobFis.Text;
      qrAux.Open;

      cdsClientesidUf_cobranca.AsInteger := qrAux.FieldByName('id').AsInteger;
    end;



    if cbbUfEntregaFis.Text <> EmptyStr then
    begin
      // busca id uf de estado de entrega
      qrAux.Close;
      qrAux.SQL.Clear;
      qrAux.SQL.Add('select uf from estados where uf = :uf');
      qrAux.Params.ParamByName('uf').AsString := cbbUFEntregaFis.Text;
      qrAux.Open;
    end;

  end;

  if (edtCNPJ.Text <> EmptyStr) then
  begin
    // busca id uf de estados
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select uf from estados where uf = :uf');
    qrAux.Params.ParamByName('uf').AsString := cbbUFJur.Text;
    qrAux.Open;

    cdsClientesidUF.AsInteger := qrAux.FieldByName('id').AsInteger;

//    // busca id uf de cidade
//    qrAux.Close;
//    qrAux.SQL.Clear;
//    qrAux.SQL.Add('select id from cidades where id_estado = :id_estado and nome = :nome');
//    qrAux.Params.ParamByName('id_estado').AsInteger := cdsClientesidUF.AsInteger;
//    qrAux.Params.ParamByName('nome').AsString := cbbCidadeJur.Text;
//    qrAux.Open;
//
//    cdsClientesidCidade.AsInteger := qrAux.FieldByName('id').AsInteger;

    // busca id uf de estados cobranca
    if cbbUFCobJur.Text <> EmptyStr then
    begin
      qrAux.Close;
      qrAux.SQL.Clear;
      qrAux.SQL.Add('select uf from estados where uf = :uf');
      qrAux.Params.ParamByName('uf').AsString := cbbUFCobJur.Text;
      qrAux.Open;

      cdsClientesidUf_cobranca.AsInteger := qrAux.FieldByName('id_uf').AsInteger;
    end;

//    // busca id uf de cidade cobranca
//    qrAux.Close;
//    qrAux.SQL.Clear;
//    qrAux.SQL.Add('select id from cidades where id_estado = :id_estado and nome = :nome');
//    qrAux.Params.ParamByName('id_estado').AsInteger := cdsClientesidUf_cobranca.AsInteger;
//    qrAux.Params.ParamByName('nome').AsString := cbbCidadeCobJur.Text;
//    qrAux.Open;
//
//    cdsClientesidCidade_cobranca.AsInteger := qrAux.FieldByName('id').AsInteger;

    if cbbUfEntregaJur.Text <> EmptyStr then
    begin
      // busca id uf de estados entrega
      qrAux.Close;
      qrAux.SQL.Clear;
      qrAux.SQL.Add('select uf from estados where uf = :uf');
      qrAux.Params.ParamByName('uf').AsString := cbbUfEntregaJur.Text;
      qrAux.Open;

      cdsClientesiduf_entrega.AsInteger := qrAux.FieldByName('id_uf').AsInteger;
    end;

//    // busca id uf de cidade entrega
//    qrAux.Close;
//    qrAux.SQL.Clear;
//    qrAux.SQL.Add('select id from cidades where id_estado = :id_estado and nome = :nome');
//    qrAux.Params.ParamByName('id_estado').AsInteger := cdsClientesiduf_entrega.AsInteger;
//    qrAux.Params.ParamByName('nome').AsString := cbbCidadeEntregaJur.Text;
//    qrAux.Open;
//
//    cdsClientesidcidade_entegra.AsInteger := qrAux.FieldByName('id').AsInteger;
  end;

  cdsClientes.Post;
  cdsClientes.ApplyUpdates(0);
  limparFisica;
  desabilitaCamposFisica;
end;

procedure TfClientes.cbbUFCobJurExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbCidadeCobJur.Text;
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

procedure TfClientes.cbbUFEntregaFisExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUfEntregaFis.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCIdadeEntregaFis.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfClientes.cbbUfEntregaJurExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUfEntregaJur.Text;
  qrAux.Open;

  qrCidades.Close;
  qrCidades.Params.ParamByName('id_estado').AsInteger := qrAux.FieldByName('id').AsInteger;
  qrCidades.Open;

  while not qrCidades.eof do
  begin
    cbbCidadeEntregaJur.Items.Add(qrCidadesnome.AsString);
    qrCidades.Next;
  end;
end;

procedure TfClientes.cbbUFExit(Sender: TObject);
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

procedure TfClientes.cbbUFJurExit(Sender: TObject);
begin
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.ParamByName('uf').AsString := cbbUFJur.Text;
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

procedure TfClientes.desabilitaCamposFisica;
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
  cbbMoradia.Enabled := False;
  edtNomePai.Enabled := False;
  edtNomeMae.Enabled := False;
  edtTrabalho.Enabled := False;
  edtNaturalidade.Enabled := False;
  edtCepCobFis.Enabled := False;
  edtEnderecoCobFis.Enabled := False;
  edtNumeroCobFis.Enabled := False;
  edtComplementoCobFis.Enabled := False;
  edtBairroCobFis.Enabled := False;
  cbbUfCobFis.Enabled := False;
  cbbCidadeCobFis.Enabled := False;
  chkSimplesFis.Enabled := False;
  chkContIcmsFis.Enabled := False;
  edtDddCelFis.Enabled := False;
  edtCelularFis.Enabled := False;
  edtDddCelFis.Enabled := False;
  edtDddFoneFis.Enabled := False;
  edtImFis.Enabled := False;
  edtIeFis.Enabled := False;
  edtFoneFis.Enabled := False;
  edtProfissao.Enabled := False;
  edtRenda.Enabled := False;
  edtCEPEntregaFis.Enabled := False;
  edtEndEntregaFis.Enabled := False;
  edtBairroCobFis.Enabled := False;
  edtNumEntregaFis.Enabled := False;
  edtComplEntregaFis.Enabled := False;
  cbbUFEntregaFis.Enabled := False;
  cbbEstadoCivil.Enabled := False;
  cbbCidadeEntregaFis.Enabled := False;
end;

procedure TfClientes.habilitaCamposJuridica;
begin
  edtCNPJ.Enabled := True;
  edtRazaoSocial.Enabled := True;
  edtEndereco.Enabled := True;
  edtBairro.Enabled := True;
  edtNumeroJur.Enabled := True;
  edtCepCobJur.Enabled := True;
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
  edtCepCobJur.Enabled := True;
  edtEnderecoCobJur.Enabled := True;
  edtNumeroCobJur.Enabled := True;
  edtComplementoCobJur.Enabled := True;
  edtBairroCobJur.Enabled := True;
  cbbUFCobJur.Enabled := True;
  cbbCidadeCobJur.Enabled := True;
  edtContato.Enabled := True;
  edtDddCelJur.Enabled := True;
  edtCelularJur.Enabled := True;
  edtcepEntregaJur.Enabled := True;
  edtEndEntregaJur.Enabled := True;
  edtBairroEntregaJur.Enabled := True;
  edtNumEntregaJur.Enabled := True;
  edtComplEntregaJur.Enabled := True;
  cbbUfEntregaJur.Enabled := True;
  cbbCidadeEntregaJur.Enabled := True;
end;

procedure TfClientes.desabilitaCamposJuridica;
begin
  edtCNPJ.Enabled := False;
  edtRazaoSocial.Enabled := False;
  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtNumeroJur.Enabled := False;
  edtCepCobJur.Enabled := False;
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
  edtCepCobJur.Enabled := False;
  edtEnderecoCobJur.Enabled := False;
  edtNumeroCobJur.Enabled := False;
  edtComplementoCobJur.Enabled := False;
  edtBairroCobJur.Enabled := False;
  cbbUFCobJur.Enabled := False;
  cbbCidadeCobJur.Enabled := False;
  edtContato.Enabled := False;
  edtDddCelJur.Enabled := False;
  edtCelularJur.Enabled := False;
  edtCepJur.Enabled := False;
  edtCepEntregaJur.Enabled := False;
  edtEndEntregaJur.Enabled := False;
  edtBairroEntregaJur.Enabled := False;
  edtNumEntregaJur.Enabled := False;
  edtComplEntregaJur.Enabled := False;
  cbbUfEntregaJur.Enabled := False;
  cbbCidadeEntregaJur.Enabled := False;
end;

end.
