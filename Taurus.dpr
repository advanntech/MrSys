program Taurus;

uses
  Vcl.Forms,
  uTaurus in 'uTaurus.pas' {Form1},
  u_empresa in 'u_empresa.pas' {fEmpresa},
  dmPrincipal in 'dmPrincipal.pas' {dm_Principal: TDataModule},
  u_PesqClientes in 'u_PesqClientes.pas' {fPesqClientes},
  u_funcionarios in 'u_funcionarios.pas' {fFuncionarios},
  uFormaPagRec in 'uFormaPagRec.pas' {fFormaPagRec},
  uPesqCPF in 'uPesqCPF.pas' {fPesqCPF},
  u_clientes in 'u_clientes.pas' {fClientes},
  u_pesq_empresa in 'u_pesq_empresa.pas' {fPesqEmpresa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfEmpresa, fEmpresa);
  Application.CreateForm(Tdm_Principal, dm_Principal);
  Application.CreateForm(TfPesqClientes, fPesqClientes);
  Application.CreateForm(TfFuncionarios, fFuncionarios);
  Application.CreateForm(TfFormaPagRec, fFormaPagRec);
  Application.CreateForm(TfPesqCPF, fPesqCPF);
  Application.CreateForm(TfClientes, fClientes);
  Application.CreateForm(TfPesqEmpresa, fPesqEmpresa);
  Application.Run;
end.
