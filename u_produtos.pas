unit u_produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, uGrupo, uEmbalagem,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfProdutos = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pgcCliente: TPageControl;
    tsProduto: TTabSheet;
    lbl9: TLabel;
    img2: TImage;
    img3: TImage;
    edtRG: TDBEdit;
    grp1: TGroupBox;
    imgFoto: TImage;
    lbl5: TLabel;
    cbbLookupGrupo: TDBLookupComboBox;
    imgCadConvenio: TImage;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Image2: TImage;
    Edit1: TEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    grptipo_produto: TDBRadioGroup;
    tsTributacao: TTabSheet;
    lbl2: TLabel;
    edtrg1: TDBEdit;
    lbl3: TLabel;
    edtrg2: TDBEdit;
    img1: TImage;
    GroupBox1: TGroupBox;
    lbl4: TLabel;
    cbbLookupidcargo: TDBLookupComboBox;
    lbl6: TLabel;
    cbbLookupidcargo1: TDBLookupComboBox;
    grp2: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    cbbLookupidcargo2: TDBLookupComboBox;
    cbbLookupidcargo3: TDBLookupComboBox;
    grp3: TGroupBox;
    lbl10: TLabel;
    cbbLookupidcargo4: TDBLookupComboBox;
    grp4: TGroupBox;
    lbl12: TLabel;
    cbbLookupidcargo6: TDBLookupComboBox;
    lbl14: TLabel;
    cbbLookupidcargo8: TDBLookupComboBox;
    lbl15: TLabel;
    cbbLookupidcargo9: TDBLookupComboBox;
    Label5: TLabel;
    chkContIcmsJur: TDBCheckBox;
    grp5: TGroupBox;
    lbl16: TLabel;
    lbl17: TLabel;
    cbbLookupidcargo11: TDBLookupComboBox;
    grp6: TGroupBox;
    lbl19: TLabel;
    cbbLookupidcargo13: TDBLookupComboBox;
    cbb1: TComboBox;
    edtrg3: TDBEdit;
    edtrg4: TDBEdit;
    lbl18: TLabel;
    grptipo_produto1: TDBRadioGroup;
    lbl20: TLabel;
    edtrg5: TDBEdit;
    tsAssociacao: TTabSheet;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    lbl11: TLabel;
    edtrg6: TDBEdit;
    lbl13: TLabel;
    edtnome1: TDBEdit;
    img5: TImage;
    grd1: TDBGrid;
    Image1: TImage;
    procedure imgSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure imgCadConvenioClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProdutos: TfProdutos;

implementation

{$R *.dfm}

procedure TfProdutos.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfProdutos.img1Click(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfEmbalagem, fEmbalagem);
  fEmbalagem.ShowModal;
end;

procedure TfProdutos.imgCadConvenioClick(Sender: TObject);
begin
  Application.Initialize;
  Application.CreateForm(TfGrupo, fGrupo);
  fGrupo.ShowModal;
 // cdsConvenio.Refresh;
end;

procedure TfProdutos.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
