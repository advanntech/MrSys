program Taurus;

uses
  Vcl.Forms,
  uTaurus in 'uTaurus.pas' {Form1},
  u_empresa in 'u_empresa.pas' {fEmpresa},
  dmPrincipal in 'dmPrincipal.pas' {dm_Principal: TDataModule},
  u_pesq_empresa in 'u_pesq_empresa.pas' {fPesqEmpresa},
  u_clientes in 'u_clientes.pas' {fClientes},
  uFormaPagRec in 'uFormaPagRec.pas' {fFormaPagRec},
  uPesqCPF in 'uPesqCPF.pas' {fPesqCPF};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfEmpresa, fEmpresa);
  Application.CreateForm(Tdm_Principal, dm_Principal);
  Application.CreateForm(TfPesqEmpresa, fPesqEmpresa);
  Application.CreateForm(TfClientes, fClientes);
  Application.CreateForm(TfFormaPagRec, fFormaPagRec);
  Application.CreateForm(TfPesqCPF, fPesqCPF);
  Application.Run;
end.
