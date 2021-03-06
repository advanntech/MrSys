unit uCST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfCSTICMS = class(TForm)
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    qrCargos: TSQLQuery;
    dspCargos: TDataSetProvider;
    cdsCargos: TClientDataSet;
    dsCargos: TDataSource;
    btnImprimir: TButton;
    grdCargo: TDBGrid;
    qrAux: TSQLQuery;
    cdsCargosidcargo: TIntegerField;
    cdsCargosnome: TStringField;
    procedure imgSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCSTICMS: TfCSTICMS;

implementation

{$R *.dfm}

procedure TfCSTICMS.btnExcluirClick(Sender: TObject);
begin
  cdsCargos.Delete;
end;

procedure TfCSTICMS.btnImprimirClick(Sender: TObject);
begin
  cdsCargos.Cancel;
end;

procedure TfCSTICMS.btnNovoClick(Sender: TObject);
begin
  cdsCargos.Append;
  if cdsCargos.IsEmpty then
  begin
    cdsCargosidcargo.AsInteger := 1;
    grdCargo.Columns[0].ReadOnly := True;
    grdCargo.SelectedIndex:= 1;
  end
  else
  begin
    qrAux.Close;
    qrAux.SQL.Clear;
    qrAux.SQL.Add('select max(idconvenio) as id from cargos');
    qrAux.Open;
    cdsCargosidcargo.AsInteger := qrAux.FieldByName('id').AsInteger + 1;
    grdCargo.Columns[0].ReadOnly := True;
    grdCargo.SelectedIndex:= 1;
  end;

end;

procedure TfCSTICMS.btnSalvarClick(Sender: TObject);
begin
  cdsCargos.Post;
  cdsCargos.ApplyUpdates(0);
end;

procedure TfCSTICMS.FormShow(Sender: TObject);
begin
  cdsCargos.Open;
end;

procedure TfCSTICMS.grdCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i : Integer;
begin
  i := grdCargo.SelectedIndex;
  if Key = VK_TAB then
    grdCargo.SelectedIndex := i- 1;
end;

procedure TfCSTICMS.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
