program SucesionFibonacci;

uses
  Vcl.Forms,
  Fibonacci in 'Fibonacci.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
