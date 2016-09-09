unit u_PesqClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Vcl.StdCtrls,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, dmPrincipal,
  Datasnap.Provider, Datasnap.DBClient;

type
  TfPesqClientes = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    Panel3: TPanel;
    ordem: TComboBox;
    procura: TEdit;
    grid_pesq: TDBGrid;
    qrPesq: TSQLQuery;
    pnl2: TPanel;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    imgPesquisar: TImage;
    cdsPesq: TClientDataSet;
    dspPesq: TDataSetProvider;
    dsPesq: TDataSource;
    procedure btnSelecionarClick(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    desc_retorno     : string;
    fantasia_retorno : string;
    cnpj_retorno     : string;
  end;

var
  fPesqClientes: TfPesqClientes;

implementation

{$R *.dfm}

procedure TfPesqClientes.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfPesqClientes.btnSelecionarClick(Sender: TObject);
begin
   if not cdsPesq.IsEmpty then
   begin
      cnpj_retorno     := grid_pesq.Fields[0].AsString;
      desc_retorno     := grid_pesq.Fields[1].AsString;
      fantasia_retorno := grid_pesq.Fields[2].AsString;
   end;
   Close;
end;

procedure TfPesqClientes.FormCreate(Sender: TObject);
begin
  desc_retorno         := '';
  fantasia_retorno     := '';
  cnpj_retorno         := '';
end;

procedure TfPesqClientes.FormShow(Sender: TObject);
begin
   ordem.ItemIndex := 0; // por Cnpj
end;

procedure TfPesqClientes.imgPesquisarClick(Sender: TObject);
begin
  cdsPesq.close;

  qrPesq.close;
  qrPesq.sql.clear;
  qrPesq.sql.add('Select    e.nome,          '+
                 '          e.fantasia,      '+
                 '          e.cdg_clientes   '+
                 'from      empresa e        '+
                 'where                      ');

  // CNPJ/CPF
  if ordem.ItemIndex = 0 then
  begin
     qrPesq.sql.add('upper(e.cdg_cliente) like upper(' + '''' + '%' + procura.text + '%' + '''' + ') order by e.cnpj');
  end;

  // Razão Social/Nome
  if ordem.ItemIndex = 1 then
  begin
     qrPesq.sql.add('upper(e.nome) like upper(' + '''' + '%' + procura.text + '%' + '''' + ') order by e.razao_social');
  end;

  cdsPesq.open;
  grid_pesq.setfocus;
end;

procedure TfPesqClientes.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
