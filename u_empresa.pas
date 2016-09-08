unit u_empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls, dmPrincipal, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient, Data.DB, Data.SqlExpr, u_pesq_empresa;

type
  TfEmpresa = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl13: TLabel;
    lbl15: TLabel;
    lbl11: TLabel;
    lbl9: TLabel;
    lbl6: TLabel;
    pnl2: TPanel;
    edtRazaoSocial: TDBEdit;
    edtFantasia: TDBEdit;
    Label1: TLabel;
    edtResponsavel: TDBEdit;
    edtEndereco: TDBEdit;
    edtNumero: TDBEdit;
    edtComplemento: TDBEdit;
    Label2: TLabel;
    edtBairro: TDBEdit;
    Label3: TLabel;
    edtCEP: TDBEdit;
    Label4: TLabel;
    edtIE: TDBEdit;
    edtIM: TDBEdit;
    edtCnae: TDBEdit;
    edtIESubstituto: TDBEdit;
    edtFone: TDBEdit;
    edtFax: TDBEdit;
    edtemail: TDBEdit;
    Label5: TLabel;
    cbbRamoAtividade: TDBComboBox;
    grpCRT: TGroupBox;
    chkSimplesNacional: TCheckBox;
    chkRegimeNormal: TCheckBox;
    chkSimplesExcesso: TCheckBox;
    lblAliquotaSimples: TLabel;
    chkSubstitutoTributario: TCheckBox;
    qrEmpresa: TSQLQuery;
    dsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    dspEmpresa: TDataSetProvider;
    cdsEmpresacnpj: TStringField;
    cdsEmpresatipo: TStringField;
    cdsEmpresarazao_social: TStringField;
    cdsEmpresafantasia: TStringField;
    cdsEmpresaramoatividade: TStringField;
    cdsEmpresaresponsavel: TStringField;
    cdsEmpresanumero: TStringField;
    cdsEmpresacomplemento: TStringField;
    cdsEmpresabairro: TStringField;
    cdsEmpresaid_uf: TIntegerField;
    cdsEmpresaid_cidade: TIntegerField;
    cdsEmpresacep: TStringField;
    cdsEmpresaie: TStringField;
    cdsEmpresaim: TStringField;
    cdsEmpresaie_substituto: TStringField;
    cdsEmpresacnae: TStringField;
    cdsEmpresacrt: TStringField;
    cdsEmpresasubstituto_tributario: TStringField;
    cdsEmpresaaliquota_simples: TFloatField;
    cdsEmpresatelefone: TStringField;
    cdsEmpresafax: TStringField;
    cdsEmpresaemail: TStringField;
    cdsEmpresaendereco: TStringField;
    rdgTipo: TDBRadioGroup;
    qrEstados: TSQLQuery;
    qrEstadosuf: TStringField;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    cbbUF: TComboBox;
    cbbCidades: TComboBox;
    qrAux: TSQLQuery;
    edtCnpj: TMaskEdit;
    edtAliquotaSimplies: TDBEdit;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnNovo: TButton;
    imgPesquisar: TImage;
    procedure imgSairClick(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
    procedure cbbUFExit(Sender: TObject);
    procedure cbbUFKeyPress(Sender: TObject; var Key: Char);
    procedure chkSimplesNacionalClick(Sender: TObject);
    procedure chkSimplesExcessoClick(Sender: TObject);
    procedure chkRegimeNormalClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure imgExcluirClick(Sender: TObject);
    procedure cbbRamoAtividadeEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpar;
    procedure habilitaCampos;
    procedure desabilitaCampos;
  public
    { Public declarations }
  end;

var
  fEmpresa: TfEmpresa;

implementation

{$R *.dfm}

procedure TfEmpresa.btnExcluirClick(Sender: TObject);
begin
  cdsEmpresa.Delete;
end;

procedure TfEmpresa.btnNovoClick(Sender: TObject);
begin
  habilitaCampos;
  edtCnpj.SetFocus;
end;

procedure TfEmpresa.btnSalvarClick(Sender: TObject);
begin
  cdsEmpresa.Post;
  cdsEmpresa.ApplyUpdates(0);
end;

procedure TfEmpresa.cbbRamoAtividadeEnter(Sender: TObject);
begin
//  cbbRamoAtividade.Items.Add('Indústria');
//  cbbRamoAtividade.Items.Add('Comércio');
//  cbbRamoAtividade.Items.Add('Transportadora');
//  cbbRamoAtividade.Items.Add('Prestação de serviços');
//  cbbRamoAtividade.Items.Add('Outros');
end;

procedure TfEmpresa.cbbUFExit(Sender: TObject);
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

procedure TfEmpresa.cbbUFKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    cdsempresa.Close;
    cdsEmpresa.Params.ParamByName('cnpj').AsString := edtCnpj.Text;
    cdsEmpresa.Open;

    qrEstados.open;

    while not qrEstados.Eof do
    begin
      cbbUF.Items.Add(qrEstadosuf.AsString);
      qrEstados.Next;
    end;

    if (cdsEmpresa.IsEmpty) then
    begin
      cdsEmpresa.Append;
      cdsEmpresacnpj.AsString := edtCnpj.Text;
    end
    else
    begin
      cdsEmpresa.Edit;
    end;
  end;
end;

procedure TfEmpresa.chkRegimeNormalClick(Sender: TObject);
begin
  if chkRegimeNormal.Checked then
  begin
    lblAliquotaSimples.Visible := False;
    edtAliquotaSimplies.Visible := False;
    edtAliquotaSimplies.Clear;
    chkSimplesExcesso.Enabled := False;
    chkSimplesNacional.Enabled := False;
    chkSubstitutoTributario.Enabled := False;
    chkSimplesExcesso.Checked := False;
    chkSimplesNacional.Checked := False;
    chkSubstitutoTributario.Checked := False;
  end
  else
  begin
    lblAliquotaSimples.Visible := False;
    edtAliquotaSimplies.Visible := False;
    edtAliquotaSimplies.Clear;

    chkSimplesNacional.Enabled := True;
    chkSimplesExcesso.Enabled := True;
    chkSubstitutoTributario.Enabled := True;
  end;
end;

procedure TfEmpresa.chkSimplesExcessoClick(Sender: TObject);
begin
  if chkSimplesExcesso.Checked then
  begin
    lblAliquotaSimples.Visible := False;
    edtAliquotaSimplies.Visible := False;
    edtAliquotaSimplies.Clear;
    chkRegimeNormal.Enabled := False;
    chkSimplesNacional.Enabled := False;
    chkSubstitutoTributario.Enabled := False;
    chkRegimeNormal.Checked := False;
    chkSimplesNacional.Checked := False;
    chkSubstitutoTributario.Checked := False;
  end
  else
  begin
    lblAliquotaSimples.Visible := False;
    edtAliquotaSimplies.Visible := False;
    edtAliquotaSimplies.Clear;
    chkRegimeNormal.Enabled := True;
    chkSimplesNacional.Enabled := True;
    chkSubstitutoTributario.Enabled := True;
  end;
end;

procedure TfEmpresa.chkSimplesNacionalClick(Sender: TObject);
begin
  if chkSimplesNacional.Checked then
  begin
    lblAliquotaSimples.Visible := True;
    edtAliquotaSimplies.Visible := True;
    chkRegimeNormal.Enabled := False;
    chkSimplesExcesso.Enabled := False;
    chkSubstitutoTributario.Enabled := False;
    chkRegimeNormal.Checked := False;
    chkSimplesExcesso.Checked:= False;
    chkSubstitutoTributario.Checked := False;
  end
  else
  begin
    lblAliquotaSimples.Visible := False;
    edtAliquotaSimplies.Visible := False;
    edtAliquotaSimplies.Clear;
    chkRegimeNormal.Enabled := True;
    chkSimplesExcesso.Enabled := True;
    chkSubstitutoTributario.Enabled := True;
  end;

end;

procedure TfEmpresa.edtCnpjExit(Sender: TObject);
begin
  cdsempresa.Close;
  cdsEmpresa.Params.ParamByName('cnpj').AsString := edtCnpj.Text;
  cdsEmpresa.Open;

  qrEstados.open;

  while not qrEstados.Eof do
  begin
    cbbUF.Items.Add(qrEstadosuf.AsString);
    qrEstados.Next;
  end;

  if (cdsEmpresa.IsEmpty) then
  begin
    cdsEmpresa.Append;
    cdsEmpresacnpj.AsString := edtCnpj.Text;
  end
  else
  begin
    cdsEmpresa.Edit;
  end;
end;

procedure TfEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ((cdsEmpresa.State = dsInsert) or (cdsEmpresa.State = dsEdit)) then
  begin
    if MessageBox(handle,'Seus dados serão perdidos. Deseja fechar a tela sem Salvar?','Confirmação',mb_YesNo+mb_IconQuestion)=idyes then
    begin
      cdsEmpresa.Cancel;
      cdsEmpresa.Close;
      qrAux.Close;
      qrEstados.Close;
      qrCidades.Close;
      limpar;
    end
    else
    begin
      Abort;
    end;
  end
  else
  begin
    cdsEmpresa.Close;
    qrAux.Close;
    qrEstados.Close;
    qrCidades.Close;
    limpar;
  end;
end;

procedure TfEmpresa.FormShow(Sender: TObject);
begin
  desabilitaCampos;
end;

procedure TfEmpresa.imgCancelarClick(Sender: TObject);
begin
  cdsEmpresa.Close;
  qrAux.Close;
  qrEstados.Close;
  qrCidades.Close;
  limpar;
end;

procedure TfEmpresa.imgExcluirClick(Sender: TObject);
begin
  cdsEmpresa.Delete;
  limpar;
end;

procedure TfEmpresa.imgNovoClick(Sender: TObject);
begin
  limpar;
end;

procedure TfEmpresa.imgPesquisarClick(Sender: TObject);
begin
  if ActiveControl = edtCnpj then
  begin
    Application.CreateForm(TfPesqEmpresa,fPesqEmpresa);
    fPesqEmpresa.ShowModal;
    if fPesqEmpresa.cnpj_retorno <> '' then
       edtCNPJ.text := fPesqEmpresa.cnpj_retorno;
    fPesqEmpresa.release;
    fPesqEmpresa := nil;

    edtCnpjExit(edtCnpj);
   end;
end;

procedure TfEmpresa.imgSairClick(Sender: TObject);
begin
  close;
  cdsEmpresa.Cancel;
  cdsEmpresa.Close;
end;

procedure TfEmpresa.imgSalvarClick(Sender: TObject);
begin
  if ((cdsEmpresa.State = dsInsert) or (cdsEmpresa.State = dsEdit)) then
  begin
    //pega id da cidade
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select id from cidades where nome = :nome');
    qrAux.Params.ParamByName('nome').AsString := cbbCidades.Text;
    qrAux.Open;

    cdsEmpresaid_cidade.AsInteger := qrAux.FieldByName('id').AsInteger;

    //pega id do estado
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select id from estados where uf = :uf');
    qrAux.Params.ParamByName('uf').AsString := cbbUF.Text;
    qrAux.Open;

    cdsEmpresaid_uf.AsInteger := qrAux.FieldByName('id').AsInteger;

    cdsEmpresa.Post;
    cdsEmpresa.ApplyUpdates(0);

    limpar;
    desabilitaCampos;
  end;

end;

procedure TfEmpresa.limpar;
begin
  edtCnpj.Clear;
  edtRazaoSocial.Clear;
  edtFantasia.Clear;
  edtResponsavel.Clear;
  edtEndereco.Clear;
  edtNumero.Clear;;
  edtComplemento.Clear;
  edtBairro.Clear;
  cbbUF.Clear;
  cbbCidades.Clear;
  edtCEP.Clear;
  edtIE.Clear;
  edtIM.Clear;
  edtCnae.Clear;
  edtIESubstituto.Clear;
  edtFone.Clear;
  edtFax.Clear;
  edtemail.Clear;
  cbbRamoAtividade.Clear;
  chkSimplesNacional.Checked := False;
  chkRegimeNormal.Checked := False;
  chkSimplesExcesso.Checked := False;
  edtAliquotaSimplies.Clear;
end;

procedure TfEmpresa.habilitaCampos;
begin
  edtCnpj.Enabled := True;
  edtRazaoSocial.enabled := True;
  edtFantasia.enabled := True;
  edtResponsavel.enabled := True;
  edtEndereco.enabled := True;
  edtNumero.enabled := True;
  edtComplemento.enabled := True;
  edtBairro.enabled := True;
  cbbUF.enabled := True;
  cbbCidades.enabled := True;
  edtCEP.enabled := True;
  edtIE.enabled := True;
  edtIM.enabled := True;
  edtCnae.enabled := True;
  edtIESubstituto.enabled := True;
  edtFone.enabled := True;
  edtFax.enabled := True;
  edtemail.enabled := True;
  cbbRamoAtividade.enabled := True;
  grpCRT.Enabled := True;
end;


procedure TfEmpresa.desabilitaCampos;
begin
  edtCnpj.Enabled := False;
  edtRazaoSocial.enabled := False;
  edtFantasia.enabled := False;
  edtResponsavel.enabled := False;
  edtEndereco.enabled := False;
  edtNumero.enabled := False;
  edtComplemento.enabled := False;
  edtBairro.enabled := False;
  cbbUF.enabled := False;
  cbbCidades.enabled := False;;
  edtCEP.enabled := False;
  edtIE.enabled := False;
  edtIM.enabled := False;
  edtCnae.enabled := False;
  edtIESubstituto.enabled := False;
  edtFone.enabled := False;
  edtFax.enabled := False;
  edtemail.enabled := False;
  cbbRamoAtividade.enabled := False;
  grpCRT.Enabled := False;
end;

end.
