unit uPesqCPF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  ACBrConsultaCPF;

type
  TfPesqCPF = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    img1: TImage;
    lblLabAtualizarCaptcha: TLabel;
    lbl4: TLabel;
    edtCPF: TMaskEdit;
    lblRazaoSocial: TLabel;
    lblEndereco: TLabel;
    lblSituacao: TLabel;
    imgPesquisar: TImage;
    edtCaptcha: TMaskEdit;
    Label4: TLabel;
    tmr1: TTimer;
    lbl2: TLabel;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    edtDataNascimento: TMaskEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure lblLabAtualizarCaptchaClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure edtCaptchaExit(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    cpf: string;
    razaosocial: string;
    emissao: string;
    controle: string;
    digito: string;
    inscricao: string;
    situacao: string;
    rg: string;
    nascimento : string;
  end;

var
  fPesqCPF: TfPesqCPF;

implementation

{$R *.dfm}

procedure TfPesqCPF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfPesqCPF.btnSalvarClick(Sender: TObject);
begin
  Close;
end;


procedure TfPesqCPF.edtCaptchaExit(Sender: TObject);
begin
 imgPesquisarClick(imgPesquisar);
end;

procedure TfPesqCPF.edtCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    imgPesquisarClick(imgPesquisar);
end;

procedure TfPesqCPF.FormCreate(Sender: TObject);
begin
  cpf         := EmptyStr;
  razaosocial := EmptyStr;
  emissao     := EmptyStr;
  controle    := EmptyStr;
  digito      := EmptyStr;
  inscricao   := EmptyStr;
  situacao    := EmptyStr;
end;

procedure TfPesqCPF.imgPesquisarClick(Sender: TObject);
begin
  if edtCaptcha.Text <> EmptyStr then
  begin
    if ACBrConsultaCPF1.Consulta(edtCPF.Text, edtDataNascimento.Text, edtCaptcha.Text) then
    begin
      razaosocial := ACBrConsultaCPF1.Nome;
      situacao     := ACBrConsultaCPF1.Situacao;
      emissao     := ACBrConsultaCPF1.Emissao;
      controle    := ACBrConsultaCPF1.CodCtrlControle;
      digito      := ACBrConsultaCPF1.DigitoVerificador;
      inscricao   := ACBrConsultaCPF1.DataInscricao;


      lblSituacao.Caption := ACBrConsultaCPF1.Situacao;
      lblRazaoSocial.Caption := ACBrConsultaCPF1.Nome;
      lblEndereco.Caption := ACBrConsultaCPF1.Emissao;
      cpf := edtCPF.Text;
      nascimento  := edtDataNascimento.Text
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EdtCaptcha.SetFocus;
  end;
end;

procedure TfPesqCPF.imgSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPesqCPF.lblLabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCPf1.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Img1.Picture.LoadFromFile( ImgArq );

    edtCaptcha.Clear;
  finally
    Stream.Free;
  end;
end;

procedure TfPesqCPF.tmr1Timer(Sender: TObject);
begin
  Tmr1.Enabled:= False;
  lblLabAtualizarCaptchaClick(lblLabAtualizarCaptcha);
end;

end.
