program Pedidos_Local;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmMainUnt in 'frmMainUnt.pas' {frmMain},
  ClientModuleUnt in 'ClientModuleUnt.pas' {ClientModule: TDataModule},
  ClientClassesUnt in 'ClientClassesUnt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
