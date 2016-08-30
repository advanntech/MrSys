unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  Tdm_Principal = class(TDataModule)
    Taurus: TSQLConnection;
    imlBotoes: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Principal: Tdm_Principal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
