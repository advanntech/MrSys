unit uTaurus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, u_empresa, u_clientes,
  Vcl.ExtCtrls, u_funcionarios, u_fornecedores, u_produtos, uContasReceber, uCOntasPagar, uBanco;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    lbl1: TLabel;
    img2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    img3: TImage;
    Label4: TLabel;
    Image4: TImage;
    Image5: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image6: TImage;
    Label7: TLabel;
    procedure img1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Image1Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfEmpresa, fEmpresa);
  fEmpresa.ShowModal;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfClientes, fClientes);
  fClientes.ShowModal;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfFuncionarios, fFuncionarios);
  fFuncionarios.ShowModal;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfContasPagar, fContasPagar);
  fContasPagar.ShowModal;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfContasReceber, fContasReceber);
  fContasReceber.ShowModal;
end;
procedure TForm1.Image6Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfBancos, fBancos);
  fBancos.ShowModal;
end;

procedure TForm1.img1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.img2Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfFornecedores, fFornecedores);
  fFornecedores.ShowModal;
end;

procedure TForm1.img3Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfProdutos, fProdutos);
  fProdutos.ShowModal;
end;

end.
