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
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    tmr1: TTimer;
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
    if ACBrConsultaCNPJ1.Consulta(edtCNPJ.Text, edtCaptcha.Text) then
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
//  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ENDIF}
begin
  Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);

  {$IFDEF DELPHI2009_UP}
    //Use esse código quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);

      EditCaptcha.Clear;
      EditCaptcha.SetFocus;
    finally
      png.Free;
    end;
  {$ELSE}
    ShowMessage('Atenção: Seu Delphi não dá suporte nativo a imagens PNG. Queira verificar o código fonte deste exemplo para saber como proceder.');
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

    //Use esse código quando a imagem do site for do tipo JPG
    //Jpg:= TJPEGImage.Create;
    //try
    //  Jpg.LoadFromStream(Stream);
    //  Image1.Picture.Assign(Jpg);
    //   //    EditCaptcha.Clear;
    //  EditCaptcha.SetFocus;
    //finally
    //  Jpg.Free;
    //end;

  finally
    Stream.Free;
  end;
end;

procedure TfPesqCNPJ.tmr1Timer(Sender: TObject);
begin
  Tmr1.Enabled:= False;
  lblLabAtualizarCaptchaClick(lblLabAtualizarCaptcha);
  edtCNPJ.SetFocus;
end;

end.
