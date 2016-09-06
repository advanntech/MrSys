unit uPesqCPNJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, ACBrBase, ACBrSocket, ACBrConsultaCNPJ;

type
  TfPesqCNPJ = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    img1: TImage;
    lblLabAtualizarCaptcha: TLabel;
    lbl4: TLabel;
    edtCNPJ: TMaskEdit;
    lblRazaoSocial: TLabel;
    lblEndereco: TLabel;
    lblSituacao: TLabel;
    imgPesquisar: TImage;
    edtCaptcha: TMaskEdit;
    Label4: TLabel;
    tmr1: TTimer;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    procedure btnSalvarClick(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure lblLabAtualizarCaptchaClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    cnpj: string;
    razaosocial: string;
    fantasia: string;
    endereco: string;
    numero: string;
    complemento: string;
    bairro: string;
    cidade: string;
    uf: string;
    cep: string;
    situacao: string;
    cnae: string;
    email: string;
    telefone: string;
  end;

var
  fPesqCNPJ: TfPesqCNPJ;

implementation

{$R *.dfm}

procedure TfPesqCNPJ.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfPesqCNPJ.btnSalvarClick(Sender: TObject);
begin
  Close;
end;


procedure TfPesqCNPJ.edtCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    imgPesquisarClick(imgPesquisar);
end;

procedure TfPesqCNPJ.FormCreate(Sender: TObject);
begin
  cnpj        := EmptyStr;
  razaosocial := EmptyStr;
  fantasia    := EmptyStr;
  endereco    := EmptyStr;
  numero      := EmptyStr;
  complemento := EmptyStr;
  bairro      := EmptyStr;
  cidade      := EmptyStr;
  uf          := EmptyStr;
  cep         := EmptyStr;
  cnae        := EmptyStr;
  email       := EmptyStr;
  Telefone    := EmptyStr;
end;

procedure TfPesqCNPJ.imgPesquisarClick(Sender: TObject);
begin
  if edtCaptcha.Text <> EmptyStr then
  begin
    if ACBrConsultaCNPJ1.Consulta(edtCNPJ.Text, edtCaptcha.Text, true) then
    begin
      razaosocial := ACBrConsultaCNPJ1.RazaoSocial;
      fantasia    := ACBrConsultaCNPJ1.Fantasia;
      endereco    := ACBrConsultaCNPJ1.Endereco;
      numero      := ACBrConsultaCNPJ1.Numero;
      complemento := ACBrConsultaCNPJ1.Complemento;
      bairro      := ACBrConsultaCNPJ1.Bairro;
      cidade      := ACBrConsultaCNPJ1.Cidade;
      uf          := ACBrConsultaCNPJ1.UF;
      cep         := ACBrConsultaCNPJ1.CEP;
      cnae        := ACBrConsultaCNPJ1.CNAE1;
      email       := ACBrConsultaCNPJ1.EndEletronico;
      Telefone    := ACBrConsultaCNPJ1.Telefone;

      lblSituacao.Caption := ACBrConsultaCNPJ1.Situacao;
      lblRazaoSocial.Caption := ACBrConsultaCNPJ1.RazaoSocial;
      lblEndereco.Caption := ACBrConsultaCNPJ1.Endereco;
      cnpj := edtCNPJ.Text
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EdtCaptcha.SetFocus;
  end;
end;

procedure TfPesqCNPJ.lblLabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Img1.Picture.LoadFromFile( ImgArq );

    edtCaptcha.Clear;
  finally
    Stream.Free;
  end;
end;

procedure TfPesqCNPJ.tmr1Timer(Sender: TObject);
begin
  Tmr1.Enabled:= False;
  lblLabAtualizarCaptchaClick(lblLabAtualizarCaptcha);
end;

end.
