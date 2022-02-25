//
// Created by the DataSnap proxy generator.
// 25/02/2022 05:32:40 p. m.
//

unit ClientClassesUnt;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FGetClientesCommand: TDSRestCommand;
    FGetClientesCommand_Cache: TDSRestCommand;
    FPostClienteCommand: TDSRestCommand;
    FGetFacturasCommand: TDSRestCommand;
    FGetFacturasCommand_Cache: TDSRestCommand;
    FPostFacturaCommand: TDSRestCommand;
    FGetProductosCommand: TDSRestCommand;
    FGetProductosCommand_Cache: TDSRestCommand;
    FPostProductoCommand: TDSRestCommand;
    FGetDetalleFacturasCommand: TDSRestCommand;
    FGetDetalleFacturasCommand_Cache: TDSRestCommand;
    FPostDetalleFacturaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetClientes(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetClientes_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure PostCliente(Action: string; Cliente: TDataSet);
    function GetFacturas(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetFacturas_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure PostFactura(Action: string; Factura: TDataSet);
    function GetProductos(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetProductos_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure PostProducto(Action: string; Producto: TDataSet);
    function GetDetalleFacturas(Numero: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetDetalleFacturas_Cache(Numero: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure PostDetalleFactura(Action: string; Producto: TDataSet);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods_GetClientes: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_GetClientes_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_PostCliente: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Action'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Cliente'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods_GetFacturas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_GetFacturas_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_PostFactura: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Action'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Factura'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods_GetProductos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_GetProductos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_PostProducto: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Action'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Producto'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

  TServerMethods_GetDetalleFacturas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Numero'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_GetDetalleFacturas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Numero'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_PostDetalleFactura: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Action'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Producto'; Direction: 1; DBXType: 23; TypeName: 'TDataSet')
  );

implementation

function TServerMethodsClient.GetClientes(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetClientesCommand = nil then
  begin
    FGetClientesCommand := FConnection.CreateCommand;
    FGetClientesCommand.RequestType := 'GET';
    FGetClientesCommand.Text := 'TServerMethods.GetClientes';
    FGetClientesCommand.Prepare(TServerMethods_GetClientes);
  end;
  FGetClientesCommand.Execute(ARequestFilter);
  if not FGetClientesCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetClientesCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetClientesCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.GetClientes_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetClientesCommand_Cache = nil then
  begin
    FGetClientesCommand_Cache := FConnection.CreateCommand;
    FGetClientesCommand_Cache.RequestType := 'GET';
    FGetClientesCommand_Cache.Text := 'TServerMethods.GetClientes';
    FGetClientesCommand_Cache.Prepare(TServerMethods_GetClientes_Cache);
  end;
  FGetClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetClientesCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TServerMethodsClient.PostCliente(Action: string; Cliente: TDataSet);
begin
  if FPostClienteCommand = nil then
  begin
    FPostClienteCommand := FConnection.CreateCommand;
    FPostClienteCommand.RequestType := 'POST';
    FPostClienteCommand.Text := 'TServerMethods."PostCliente"';
    FPostClienteCommand.Prepare(TServerMethods_PostCliente);
  end;
  FPostClienteCommand.Parameters[0].Value.SetWideString(Action);
  FPostClienteCommand.Parameters[1].Value.SetDBXReader(TDBXDataSetReader.Create(Cliente, FInstanceOwner), True);
  FPostClienteCommand.Execute;
end;

function TServerMethodsClient.GetFacturas(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetFacturasCommand = nil then
  begin
    FGetFacturasCommand := FConnection.CreateCommand;
    FGetFacturasCommand.RequestType := 'GET';
    FGetFacturasCommand.Text := 'TServerMethods.GetFacturas';
    FGetFacturasCommand.Prepare(TServerMethods_GetFacturas);
  end;
  FGetFacturasCommand.Execute(ARequestFilter);
  if not FGetFacturasCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetFacturasCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetFacturasCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetFacturasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.GetFacturas_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetFacturasCommand_Cache = nil then
  begin
    FGetFacturasCommand_Cache := FConnection.CreateCommand;
    FGetFacturasCommand_Cache.RequestType := 'GET';
    FGetFacturasCommand_Cache.Text := 'TServerMethods.GetFacturas';
    FGetFacturasCommand_Cache.Prepare(TServerMethods_GetFacturas_Cache);
  end;
  FGetFacturasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetFacturasCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TServerMethodsClient.PostFactura(Action: string; Factura: TDataSet);
begin
  if FPostFacturaCommand = nil then
  begin
    FPostFacturaCommand := FConnection.CreateCommand;
    FPostFacturaCommand.RequestType := 'POST';
    FPostFacturaCommand.Text := 'TServerMethods."PostFactura"';
    FPostFacturaCommand.Prepare(TServerMethods_PostFactura);
  end;
  FPostFacturaCommand.Parameters[0].Value.SetWideString(Action);
  FPostFacturaCommand.Parameters[1].Value.SetDBXReader(TDBXDataSetReader.Create(Factura, FInstanceOwner), True);
  FPostFacturaCommand.Execute;
end;

function TServerMethodsClient.GetProductos(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetProductosCommand = nil then
  begin
    FGetProductosCommand := FConnection.CreateCommand;
    FGetProductosCommand.RequestType := 'GET';
    FGetProductosCommand.Text := 'TServerMethods.GetProductos';
    FGetProductosCommand.Prepare(TServerMethods_GetProductos);
  end;
  FGetProductosCommand.Execute(ARequestFilter);
  if not FGetProductosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetProductosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetProductosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetProductosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.GetProductos_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetProductosCommand_Cache = nil then
  begin
    FGetProductosCommand_Cache := FConnection.CreateCommand;
    FGetProductosCommand_Cache.RequestType := 'GET';
    FGetProductosCommand_Cache.Text := 'TServerMethods.GetProductos';
    FGetProductosCommand_Cache.Prepare(TServerMethods_GetProductos_Cache);
  end;
  FGetProductosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetProductosCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TServerMethodsClient.PostProducto(Action: string; Producto: TDataSet);
begin
  if FPostProductoCommand = nil then
  begin
    FPostProductoCommand := FConnection.CreateCommand;
    FPostProductoCommand.RequestType := 'POST';
    FPostProductoCommand.Text := 'TServerMethods."PostProducto"';
    FPostProductoCommand.Prepare(TServerMethods_PostProducto);
  end;
  FPostProductoCommand.Parameters[0].Value.SetWideString(Action);
  FPostProductoCommand.Parameters[1].Value.SetDBXReader(TDBXDataSetReader.Create(Producto, FInstanceOwner), True);
  FPostProductoCommand.Execute;
end;

function TServerMethodsClient.GetDetalleFacturas(Numero: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetDetalleFacturasCommand = nil then
  begin
    FGetDetalleFacturasCommand := FConnection.CreateCommand;
    FGetDetalleFacturasCommand.RequestType := 'GET';
    FGetDetalleFacturasCommand.Text := 'TServerMethods.GetDetalleFacturas';
    FGetDetalleFacturasCommand.Prepare(TServerMethods_GetDetalleFacturas);
  end;
  FGetDetalleFacturasCommand.Parameters[0].Value.SetInt32(Numero);
  FGetDetalleFacturasCommand.Execute(ARequestFilter);
  if not FGetDetalleFacturasCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetDetalleFacturasCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetDetalleFacturasCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetDetalleFacturasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsClient.GetDetalleFacturas_Cache(Numero: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetDetalleFacturasCommand_Cache = nil then
  begin
    FGetDetalleFacturasCommand_Cache := FConnection.CreateCommand;
    FGetDetalleFacturasCommand_Cache.RequestType := 'GET';
    FGetDetalleFacturasCommand_Cache.Text := 'TServerMethods.GetDetalleFacturas';
    FGetDetalleFacturasCommand_Cache.Prepare(TServerMethods_GetDetalleFacturas_Cache);
  end;
  FGetDetalleFacturasCommand_Cache.Parameters[0].Value.SetInt32(Numero);
  FGetDetalleFacturasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetDetalleFacturasCommand_Cache.Parameters[1].Value.GetString);
end;

procedure TServerMethodsClient.PostDetalleFactura(Action: string; Producto: TDataSet);
begin
  if FPostDetalleFacturaCommand = nil then
  begin
    FPostDetalleFacturaCommand := FConnection.CreateCommand;
    FPostDetalleFacturaCommand.RequestType := 'POST';
    FPostDetalleFacturaCommand.Text := 'TServerMethods."PostDetalleFactura"';
    FPostDetalleFacturaCommand.Prepare(TServerMethods_PostDetalleFactura);
  end;
  FPostDetalleFacturaCommand.Parameters[0].Value.SetWideString(Action);
  FPostDetalleFacturaCommand.Parameters[1].Value.SetDBXReader(TDBXDataSetReader.Create(Producto, FInstanceOwner), True);
  FPostDetalleFacturaCommand.Execute;
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FGetClientesCommand.DisposeOf;
  FGetClientesCommand_Cache.DisposeOf;
  FPostClienteCommand.DisposeOf;
  FGetFacturasCommand.DisposeOf;
  FGetFacturasCommand_Cache.DisposeOf;
  FPostFacturaCommand.DisposeOf;
  FGetProductosCommand.DisposeOf;
  FGetProductosCommand_Cache.DisposeOf;
  FPostProductoCommand.DisposeOf;
  FGetDetalleFacturasCommand.DisposeOf;
  FGetDetalleFacturasCommand_Cache.DisposeOf;
  FPostDetalleFacturaCommand.DisposeOf;
  inherited;
end;

end.

