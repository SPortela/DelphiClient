program ServerProject;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule},
  ServerUnt in 'ServerUnt.pas' {frmServer},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
