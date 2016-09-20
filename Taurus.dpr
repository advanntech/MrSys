program Taurus;

uses
  Vcl.Forms,
  uTaurus in 'uTaurus.pas' {Form1},
  u_empresa in 'u_empresa.pas' {fEmpresa},
  dmPrincipal in 'dmPrincipal.pas' {dm_Principal: TDataModule},
  u_funcionarios in 'u_funcionarios.pas' {fFuncionarios},
  uCargo in 'uCargo.pas' {fCargo},
  uPesqCPF in 'uPesqCPF.pas' {fPesqCPF},
  u_clientes in 'u_clientes.pas' {fClientes},
  u_pesq_empresa in 'u_pesq_empresa.pas' {fPesqEmpresa},
  u_PesqClientes in 'u_PesqClientes.pas' {fPesqClientes},
  u_PesqForncedores in 'u_PesqForncedores.pas' {fPesqFornecedores},
  uConvenio in 'uConvenio.pas' {fConvenio},
  uSetor in 'uSetor.pas' {fSetor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfEmpresa, fEmpresa);
  Application.CreateForm(Tdm_Principal, dm_Principal);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfFuncionarios, fFuncionarios);
  Application.CreateForm(TfCargo, fCargo);
  Application.CreateForm(TfPesqCPF, fPesqCPF);
  Application.CreateForm(TfClientes, fClientes);
  Application.CreateForm(TfPesqEmpresa, fPesqEmpresa);
  Application.CreateForm(TfPesqClientes, fPesqClientes);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfPesqClientes, fPesqClientes);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfConvenio, fConvenio);
  Application.CreateForm(TfSetor, fSetor);
  Application.Run;
end.
