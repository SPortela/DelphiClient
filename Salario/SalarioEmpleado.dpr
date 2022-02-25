program SalarioEmpleado;

uses
  Vcl.Forms,
  Salario in 'Salario.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
