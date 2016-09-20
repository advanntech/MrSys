unit u_PesqForncedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Vcl.StdCtrls,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, dmPrincipal,
  Datasnap.Provider, Datasnap.DBClient;

type
  TfPesqFornecedores = class(TForm)
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
  fPesqFornecedores: TfPesqFornecedores;

implementation

{$R *.dfm}

procedure TfPesqFornecedores.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfPesqFornecedores.btnSelecionarClick(Sender: TObject);
begin
   if not cdsPesq.IsEmpty then
   begin
      cnpj_retorno     := grid_pesq.Fields[0].AsString;
      desc_retorno     := grid_pesq.Fields[1].AsString;
      fantasia_retorno := grid_pesq.Fields[2].AsString;
   end;
   Close;
end;

procedure TfPesqFornecedores.FormCreate(Sender: TObject);
begin
  desc_retorno         := '';
  fantasia_retorno     := '';
  cnpj_retorno         := '';
end;

procedure TfPesqFornecedores.FormShow(Sender: TObject);
begin
   ordem.ItemIndex := 0; // por Cnpj
end;

procedure TfPesqFornecedores.imgPesquisarClick(Sender: TObject);
begin
  cdsPesq.close;

  qrPesq.close;
  qrPesq.sql.clear;
  qrPesq.sql.add('Select    e.rasaosocial,     '+
                 '          e.fantasia,        '+
                 '          e.cdg_fornecedor '+
                 'from      fornecedores e     '+
                 'where                        ');

  // CNPJ/CPF
  if ordem.ItemIndex = 0 then
  begin
     qrPesq.sql.add('upper(e.cdg_forenecedor) like upper(' + '''' + '%' + procura.text + '%' + '''' + ') order by e.cdg_fornecedor');
  end;

  // Razão Social/Nome
  if ordem.ItemIndex = 1 then
  begin
     qrPesq.sql.add('upper(e.rasaosocial) like upper(' + '''' + '%' + procura.text + '%' + '''' + ') order by e.razaosocial');
  end;

  cdsPesq.open;
  grid_pesq.setfocus;
end;

procedure TfPesqFornecedores.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
