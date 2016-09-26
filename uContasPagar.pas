unit uContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfContasPagar = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pgcCliente: TPageControl;
    tsLancamento: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    img4: TImage;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    edtnome: TDBEdit;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    lbl5: TLabel;
    cbbLookupGrupo: TDBLookupComboBox;
    imgCadConvenio: TImage;
    GroupBox1: TGroupBox;
    img1: TImage;
    Image1: TImage;
    img2: TImage;
    grdParcelas: TDBGrid;
    tsPagamentos: TTabSheet;
    tsListagem: TTabSheet;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    lbl7: TLabel;
    cbbLookupidcargo: TDBLookupComboBox;
    img3: TImage;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    edtcod_barra_doc: TDBEdit;
    lbl8: TLabel;
    grd1: TDBGrid;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl6: TLabel;
    edtnome3: TDBEdit;
    edtnome4: TDBEdit;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox4: TGroupBox;
    DBEdit10: TDBEdit;
    Image3: TImage;
    img6: TImage;
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContasPagar: TfContasPagar;

implementation

{$R *.dfm}

procedure TfContasPagar.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
