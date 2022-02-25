unit ClientModuleUnt;

interface

uses
  System.SysUtils, System.Classes, System.ZLib, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DSClientRest, IPPeerClient,
  System.Sensors, System.Sensors.Components, ClientClassesUnt, REST.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys;

type
  TClientModule = class(TDataModule)
    SvrConn: TDSRestConnection;
    ClientesData: TFDMemTable;
    Facturas: TFDMemTable;
    Detalle_Factura: TFDMemTable;
    Productos: TFDMemTable;
  private
    FInstanceOwner: Boolean;
    FServerMethodsClient: TServerMethodsClient;
    function GetServerMethodsClient: TServerMethodsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsClient: TServerMethodsClient
      read GetServerMethodsClient write FServerMethodsClient;

  end;

var
  ClientModule: TClientModule;
  Path: String;
implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
  Path := GetHomePath + System.SysUtils.PathDelim
end;

destructor TClientModule.Destroy;
begin
  FServerMethodsClient.Free;
  inherited;
end;

function TClientModule.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
    FServerMethodsClient := TServerMethodsClient.Create(SvrConn, FInstanceOwner);
  Result := FServerMethodsClient;
end;

end.
