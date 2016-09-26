program Taurus;

uses
  Vcl.Forms,
  uTaurus in 'uTaurus.pas' {Form1},
  u_empresa in 'u_empresa.pas' {fEmpresa},
  dmPrincipal in 'dmPrincipal.pas' {dm_Principal: TDataModule},
  u_funcionarios in 'u_funcionarios.pas' {fFuncionarios},
  uPesqCPF in 'uPesqCPF.pas' {fPesqCPF},
  u_clientes in 'u_clientes.pas' {fClientes},
  u_pesq_empresa in 'u_pesq_empresa.pas' {fPesqEmpresa},
  u_PesqClientes in 'u_PesqClientes.pas' {fPesqClientes},
  u_PesqForncedores in 'u_PesqForncedores.pas' {fPesqFornecedores},
  uConvenio in 'uConvenio.pas' {fConvenio},
  u_fornecedores in 'u_fornecedores.pas' {fFornecedores},
  uContasReceber in 'uContasReceber.pas' {fContasReceber},
  uCstPis in 'uCstPis.pas' {fCstPis},
  u_produtos in 'u_produtos.pas' {fProdutos},
  uBanco in 'uBanco.pas' {fBancos},
  uSetor in 'uSetor.pas' {fSetor},
  uCargo in 'uCargo.pas' {fCargo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfEmpresa, fEmpresa);
  Application.CreateForm(Tdm_Principal, dm_Principal);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfFuncionarios, fFuncionarios);
  Application.CreateForm(TfCstPis, fCstPis);
  Application.CreateForm(TfPesqCPF, fPesqCPF);
  Application.CreateForm(TfClientes, fClientes);
  Application.CreateForm(TfPesqEmpresa, fPesqEmpresa);
  Application.CreateForm(TfPesqClientes, fPesqClientes);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfPesqClientes, fPesqClientes);
  Application.CreateForm(TfPesqFornecedores, fPesqFornecedores);
  Application.CreateForm(TfConvenio, fConvenio);
  Application.CreateForm(TfBancos, fBancos);
  Application.CreateForm(TfFornecedores, fFornecedores);
  Application.CreateForm(TfProdutos, fProdutos);
  Application.CreateForm(TfContasReceber, fContasReceber);
  Application.CreateForm(TfCargo, fCargo);
  Application.CreateForm(TfProdutos, fProdutos);
  Application.CreateForm(TfSetor, fSetor);
  Application.CreateForm(TfSetor, fSetor);
  Application.CreateForm(TfCargo, fCargo);
  Application.Run;
end.
