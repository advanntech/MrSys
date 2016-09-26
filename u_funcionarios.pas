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
    tsFuncionario: TTabSheet;
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
    imgPesqCPF: TImage;
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
    grp1: TGroupBox;
    imgFoto: TImage;
    edtCelularFis: TDBEdit;
    edtDddCelFis: TDBEdit;
    edtDddFoneFis: TDBEdit;
    qrFuncionarios: TSQLQuery;
    dsFuncionarios: TDataSource;
    cdsFuncionarios: TClientDataSet;
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
    cdsFuncionariosidfuncionarios: TIntegerField;
    cdsFuncionarioscpf: TStringField;
    cdsFuncionariosrg: TStringField;
    cdsFuncionariosdatanascimento: TDateField;
    cdsFuncionariospis: TStringField;
    cdsFuncionarioscep: TStringField;
    cdsFuncionariosendereco: TStringField;
    cdsFuncionariosnumero: TStringField;
    cdsFuncionariosbairro: TStringField;
    cdsFuncionarioscomplemento: TStringField;
    cdsFuncionariosiduf: TIntegerField;
    cdsFuncionariosidcidade: TIntegerField;
    cdsFuncionariosdddfone: TStringField;
    cdsFuncionariostelefone: TStringField;
    cdsFuncionariosdddcelular: TStringField;
    cdsFuncionarioscelular: TStringField;
    cdsFuncionariosemail: TStringField;
    cdsFuncionariosdataadmissao: TDateField;
    cdsFuncionariosdatademissao: TDateField;
    cdsFuncionariosapelido: TStringField;
    cdsFuncionariosidSetor: TIntegerField;
    cdsFuncionariosidcargo: TIntegerField;
    cdsFuncionariossalario: TFloatField;
    cdsFuncionariosextra: TFloatField;
    cdsFuncionariosobs: TMemoField;
    lbl7: TLabel;
    edtPis: TDBEdit;
    lbl14: TLabel;
    edtcep3: TDBEdit;
    lbl16: TLabel;
    edtcep4: TDBEdit;
    cbbLookupSetor: TDBLookupComboBox;
    cbbLookupCargo: TDBLookupComboBox;
    imgCadConvenio: TImage;
    Image1: TImage;
    qrSetor: TSQLQuery;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    qrCargo: TSQLQuery;
    dspCargo: TDataSetProvider;
    cdsCargo: TClientDataSet;
    dsCargo: TDataSource;
    cdsSetoridsetor: TIntegerField;
    cdsSetornome: TStringField;
    cdsCargoidcargo: TIntegerField;
    cdsCargonome: TStringField;
    dlgOpen1: TOpenDialog;
    procedure imgSairClick(Sender: TObject);
    procedure imgPesqCepClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure imgPesqCPFClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbbUFExit(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure img2Click(Sender: TObject);
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

procedure TfFuncionarios.imgPesqCPFClick(Sender: TObject);
begin
   if ActiveControl = edtCPF then
  begin
    Application.CreateForm(TfPesqCPF,fPesqCPF);
    fPesqCPF.ShowModal;
    if fPesqCPF.cpf <> '' then
    begin
       edtCpf.text := fPesqCPF.cpf;
       edtNome.Text := fPesqCPF.razaosocial;
       edtDataNascimento.Text := fPesqCPF.nascimento;
       edtNumero.Text := fPesqCNPJ.numero;
    end;
    fPesqCPF.release;
    fPesqCPF := nil;
   end;
end;


procedure TfFuncionarios.img2Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
//    cdsFuncionariosfoto.LoadFromFile(dlgOpen1.FileName);
    imgFoto.Picture.LoadFromFile(dlgOpen1.FileName);
  end;
end;

procedure TfFuncionarios.imgPesqCepClick(Sender: TObject);
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
  edtDddCelFis.Clear;
  edtCelularFis.Clear;
  edtDddCelFis.Clear;
  edtDddFoneFis.Clear;
end;


procedure TfFuncionarios.limparJuridica;
begin
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
  edtDddCelFis.Enabled := True;
  edtCelularFis.Enabled := True;
  edtDddCelFis.Enabled := True;
  edtDddFoneFis.Enabled := True;
end;

procedure TfFuncionarios.btnCancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfFuncionarios.btnNovoClick(Sender: TObject);
begin
  if (tsFuncionario.Showing = True) then
  begin
    habilitaCamposFisica;
    desabilitaCamposJuridica;
    edtCpf.SetFocus;
    limparFisica;
    limparJuridica;
  end;

end;

procedure TfFuncionarios.btnSalvarClick(Sender: TObject);
begin
  // busca id uf de estados
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where uf = :uf');
  qrAux.Params.ParamByName('uf').AsString := cbbUF.Text;
  qrAux.Open;

  cdsFuncionariosiduf.AsInteger := qrAux.FieldByName('id_uf').AsInteger;

    // busca id uf de cidade
  qrAux.Close;
  qrAux.SQL.Clear;
  qrAux.SQL.Add('select id from estados where id_estado = :id_estado and nome = :nome');
  qrAux.Params.ParamByName('id_estado').AsInteger := cdsFuncionariosiduf.AsInteger;
  qrAux.Params.ParamByName('nome').AsString := cbbCidades.Text;
  qrAux.Open;

  cdsFuncionariosidcidade.AsInteger := qrAux.FieldByName('id').AsInteger;

  cdsFuncionarios.Post;
  cdsFuncionarios.ApplyUpdates(0);
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

procedure TfFuncionarios.edtCpfExit(Sender: TObject);
begin
  if (cdsFuncionarios.IsEmpty) then
  begin
    cdsFuncionarios.Append;
    imgPesqCPFClick(imgPesqCPF);
    cdsFuncionarioscpf.AsString := edtCpf.Text;
  end
  else
  begin
    cdsFuncionarios.Edit;
  end;
end;

end.
