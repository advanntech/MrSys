unit uFormaPagRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.pngimage, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TfFormaPagRec = class(TForm)
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pgcFormas: TPageControl;
    tsPagamento: TTabSheet;
    tsRecebimento: TTabSheet;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Image1: TImage;
    DBRadioGroup1: TDBRadioGroup;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBComboBox2: TDBComboBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    Image2: TImage;
    DBRadioGroup2: TDBRadioGroup;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    qrEmpresa: TSQLQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFormaPagRec: TfFormaPagRec;

implementation

{$R *.dfm}

end.
