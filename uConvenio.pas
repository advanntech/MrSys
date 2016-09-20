unit uConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfConvenio = class(TForm)
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    qrConvenio: TSQLQuery;
    dspConvenio: TDataSetProvider;
    cdsConvenio: TClientDataSet;
    dsConvenio: TDataSource;
    btnImprimir: TButton;
    cdsConvenioidconvenio: TIntegerField;
    cdsConvenionome: TStringField;
    cdsConveniodesconto: TFloatField;
    grdConvenio: TDBGrid;
    cdsConveniotelefone: TStringField;
    qrAux: TSQLQuery;
    procedure imgSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConvenioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConvenio: TfConvenio;

implementation

{$R *.dfm}

procedure TfConvenio.btnExcluirClick(Sender: TObject);
begin
  cdsConvenio.Delete;
end;

procedure TfConvenio.btnImprimirClick(Sender: TObject);
begin
  cdsConvenio.Cancel;
end;

procedure TfConvenio.btnNovoClick(Sender: TObject);
begin
  cdsConvenio.Append;
  if cdsConvenio.IsEmpty then
  begin
    cdsConvenioidconvenio.AsInteger := 1;
    grdConvenio.Columns[0].ReadOnly := True;
    grdConvenio.SelectedIndex:= 1;
  end
  else
  begin
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select max(idconvenio) as id from convenios');
    qrAux.Open;
    cdsConvenioidconvenio.AsInteger := qrAux.FieldByName('id').AsInteger + 1;
    grdConvenio.Columns[0].ReadOnly := True;
    grdConvenio.SelectedIndex:= 1;
  end;

end;

procedure TfConvenio.btnSalvarClick(Sender: TObject);
begin
  cdsConvenio.Post;
  cdsConvenio.ApplyUpdates(0);
end;

procedure TfConvenio.FormShow(Sender: TObject);
begin
  cdsConvenio.Open;
end;

procedure TfConvenio.grdConvenioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i : Integer;
begin
  i := grdConvenio.SelectedIndex;
  if Key = VK_TAB then
    grdConvenio.SelectedIndex := i- 1;
end;


procedure TfConvenio.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
