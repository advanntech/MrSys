unit uTaurus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, u_empresa, u_clientes,
  Vcl.ExtCtrls, u_funcionarios, u_fornecedores;

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
    lbl2: TLabel;
    procedure img1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
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

end.
