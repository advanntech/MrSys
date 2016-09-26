unit uBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfBancos = class(TForm)
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    qrSetor: TSQLQuery;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    btnImprimir: TButton;
    grdSetor: TDBGrid;
    qrAux: TSQLQuery;
    cdsSetoridsetor: TIntegerField;
    cdsSetornome: TStringField;
    procedure imgSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdSetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBancos: TfBancos;

implementation

{$R *.dfm}

procedure TfBancos.btnExcluirClick(Sender: TObject);
begin
  cdsSetor.Delete;
end;

procedure TfBancos.btnImprimirClick(Sender: TObject);
begin
  cdsSetor.Cancel;
end;

procedure TfBancos.btnNovoClick(Sender: TObject);
begin
  cdsSetor.Append;
  if cdsSetor.IsEmpty then
  begin
    cdsSetoridsetor.AsInteger := 1;
    grdSetor.Columns[0].ReadOnly := True;
    grdSetor.SelectedIndex:= 1;
  end
  else
  begin
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select max(idconvenio) as id from setores');
    qrAux.Open;
    cdsSetoridsetor.AsInteger := qrAux.FieldByName('id').AsInteger + 1;
    grdSetor.Columns[0].ReadOnly := True;
    grdSetor.SelectedIndex:= 1;
  end;

end;

procedure TfBancos.btnSalvarClick(Sender: TObject);
begin
  cdsSetor.Post;
  cdsSetor.ApplyUpdates(0);
end;

procedure TfBancos.FormShow(Sender: TObject);
begin
  cdsSetor.Open;
end;

procedure TfBancos.grdSetorKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
var i : Integer;
begin
  i := grdSetor.SelectedIndex;
  if Key = VK_TAB then
    grdSetor.SelectedIndex := i- 1;
end;

procedure TfBancos.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
