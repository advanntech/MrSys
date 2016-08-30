unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfClientes = class(TForm)
    pnl1: TPanel;
    imgSair: TImage;
    lbl1: TLabel;
    pnl2: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    qrEmpresa: TSQLQuery;
    dsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    cdsEmpresacnpj: TStringField;
    cdsEmpresatipo: TStringField;
    cdsEmpresarazao_social: TStringField;
    cdsEmpresafantasia: TStringField;
    cdsEmpresaramoatividade: TStringField;
    cdsEmpresaresponsavel: TStringField;
    cdsEmpresanumero: TStringField;
    cdsEmpresacomplemento: TStringField;
    cdsEmpresabairro: TStringField;
    cdsEmpresaid_uf: TIntegerField;
    cdsEmpresaid_cidade: TIntegerField;
    cdsEmpresacep: TStringField;
    cdsEmpresaie: TStringField;
    cdsEmpresaim: TStringField;
    cdsEmpresaie_substituto: TStringField;
    cdsEmpresacnae: TStringField;
    cdsEmpresacrt: TStringField;
    cdsEmpresasubstituto_tributario: TStringField;
    cdsEmpresaaliquota_simples: TFloatField;
    cdsEmpresatelefone: TStringField;
    cdsEmpresafax: TStringField;
    cdsEmpresaemail: TStringField;
    cdsEmpresaendereco: TStringField;
    dspEmpresa: TDataSetProvider;
    qrEstados: TSQLQuery;
    qrEstadosuf: TStringField;
    qrCidades: TSQLQuery;
    qrCidadesnome: TStringField;
    qrAux: TSQLQuery;
    pgcCliente: TPageControl;
    tsJuridica: TTabSheet;
    tsFisica: TTabSheet;
    lbl2: TLabel;
    edtCnpj: TMaskEdit;
    lbl3: TLabel;
    edtRazaoSocial: TDBEdit;
    lbl10: TLabel;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    lbl12: TLabel;
    edtIE: TDBEdit;
    Label4: TLabel;
    lbl17: TLabel;
    edtFone: TDBEdit;
    lbl18: TLabel;
    edtFax: TDBEdit;
    Label3: TLabel;
    cbbUF: TComboBox;
    cbbCidades: TComboBox;
    edtNumero: TDBEdit;
    lbl15: TLabel;
    lbl11: TLabel;
    edtemail: TDBEdit;
    lbl19: TLabel;
    Label2: TLabel;
    edtComplemento: TDBEdit;
    lbl13: TLabel;
    edtCEP: TDBEdit;
    imgPesquisar: TImage;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Image4: TImage;
    Label34: TLabel;
    DBEdit26: TDBEdit;
    grpDadosPessoais: TGroupBox;
    Label26: TLabel;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label29: TLabel;
    Label30: TLabel;
    lbl6: TLabel;
    dbedttelefone: TDBEdit;
    lbl8: TLabel;
    dbedttelefone2: TDBEdit;
    lbl7: TLabel;
    dbedttelefone1: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    lbl9: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    grp1: TGroupBox;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    lbl4: TLabel;
    medt1: TMaskEdit;
    img4: TImage;
    lbl5: TLabel;
    dbedtrazao_social: TDBEdit;
    lbl14: TLabel;
    dbedtcep: TDBEdit;
    lbl16: TLabel;
    dbedtcomplemento: TDBEdit;
    lbl20: TLabel;
    dbedtie: TDBEdit;
    lbl21: TLabel;
    dbedttelefone3: TDBEdit;
    lbl22: TLabel;
    dbedtfax: TDBEdit;
    dbedtim: TDBEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    dbedtbairro: TDBEdit;
    lbl25: TLabel;
    dbedtendereco: TDBEdit;
    lbl26: TLabel;
    dbedtie1: TDBEdit;
    dbedtnumero1: TDBEdit;
    lbl28: TLabel;
    cbb1: TComboBox;
    lbl29: TLabel;
    cbb2: TComboBox;
    lbl30: TLabel;
    DBCheckBox2: TDBCheckBox;
    lbl31: TLabel;
    dbedtemail: TDBEdit;
    grp2: TGroupBox;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    DBCheckBox3: TDBCheckBox;
    lbl27: TLabel;
    dbedtie2: TDBEdit;
    pgcComplento: TPageControl;
    ts2: TTabSheet;
    ts1: TTabSheet;
    lbl32: TLabel;
    img9: TImage;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    dbedtcep1: TDBEdit;
    dbedtendereco1: TDBEdit;
    dbedtnumero: TDBEdit;
    dbedtcomplemento1: TDBEdit;
    dbedtbairro1: TDBEdit;
    cbb3: TComboBox;
    cbb4: TComboBox;
    pgc1: TPageControl;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lbl39: TLabel;
    img10: TImage;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    dbedtcep2: TDBEdit;
    dbedtendereco2: TDBEdit;
    dbedtnumero2: TDBEdit;
    dbedtcomplemento2: TDBEdit;
    dbedtbairro2: TDBEdit;
    cbb5: TComboBox;
    cbb6: TComboBox;
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClientes: TfClientes;

implementation

{$R *.dfm}

procedure TfClientes.imgSairClick(Sender: TObject);
begin
  Close;
end;

end.
