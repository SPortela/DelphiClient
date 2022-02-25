unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Phys.MSSQLDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin, FireDAC.Stan.Intf, FireDAC.Phys, System.StrUtils,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, Data.FireDACJSONReflect, IdHashMessageDigest, DateUtils;

type
{$METHODINFO ON}
  TServerMethods = class(TDataModule)
    Connection: TFDConnection;
    StanStorageJSON: TFDStanStorageJSONLink;
    MSSQLDriver: TFDPhysMSSQLDriverLink;
    GUIxWaitCursor: TFDGUIxWaitCursor;
    StanStorageBin: TFDStanStorageBinLink;
    queryClientes: TFDQuery;
    queryDetalleFactura: TFDQuery;
    queryFacturas: TFDQuery;
    queryProductos: TFDQuery;
    Transaction: TFDTransaction;
  private
    { Private declarations }
  public
    function GetClientes: TFDJSONDataSets;
    procedure PostCliente(Action: String; Cliente: TDataSet);
    function GetFacturas: TFDJSONDataSets;
    procedure PostFactura(Action: String; Factura: TDataSet);
    function GetProductos: TFDJSONDataSets;
    procedure PostProducto(Action: String; Producto: TDataSet);
    function GetDetalleFacturas(Numero: Integer): TFDJSONDataSets;
    procedure PostDetalleFactura(Action: String; Producto: TDataSet);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

{ TServerMethods }

function TServerMethods.GetFacturas: TFDJSONDataSets;
begin
  queryFacturas.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, queryFacturas);
end;

function TServerMethods.GetProductos: TFDJSONDataSets;
begin
  queryProductos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, queryProductos);
end;

procedure TServerMethods.PostCliente(Action: String; Cliente: TDataSet);
var
  qryAction: String;
  queryDinamico: TFDQuery;
begin
  Transaction.StartTransaction;
  try
    if Action = 'U' then
      qryAction := 'UPDATE Clientes SET Nombre_Cliente = :Nombre, Direccion = :Direccion WHERE Cliente = :Cliente'
    else
      qryAction := 'INSERT INTO Clientes (Cliente, Nombre_Cliente, Direccion) VALUES (:Cliente, :Nombre, :Direccion)';

    queryDinamico := TFDQuery.Create(Nil);
    queryDinamico.Connection := Connection;
    queryDinamico.SQL.Text := qryAction;
    queryDinamico.Active := False;
    queryDinamico.Params.ParamByName('Cliente').Value :=
      Cliente.FieldByName('Cliente').AsInteger;
    queryDinamico.Params.ParamByName('Nombre').Value :=
      Cliente.FieldByName('Nombre_Cliente').AsString;
    queryDinamico.Params.ParamByName('Direccion').Value :=
      Cliente.FieldByName('Direccion').AsString;
    queryDinamico.ExecSQL;

    Transaction.Commit;
  except
    on E:Exception do
    begin
      Transaction.Rollback;
      raise Exception.Create('Error: ' + E.Message);
      queryDinamico.Free;
    end;
  end;
end;

procedure TServerMethods.PostDetalleFactura(Action: String; Producto: TDataSet);
var
  qryAction: String;
  queryDinamico: TFDQuery;
begin
  Transaction.StartTransaction;
  try
    if Action = 'U' then
      qryAction := 'UPDATE Detalle_Factura SET Cantidad = :Cantidad, Valor = :Valor WHERE Numero = :Numero AND Producto = :Producto'
    else
      qryAction := 'INSERT INTO Detalle_Factura (Numero, Producto, Cantidad, Valor) VALUES (:Numero, :Producto, :Cantidad, :Valor)';

    queryDinamico := TFDQuery.Create(Nil);
    queryDinamico.Connection := Connection;
    queryDinamico.SQL.Text := qryAction;
    queryDinamico.Active := False;
    queryDinamico.Params.ParamByName('Numero').Value :=
      Producto.FieldByName('Numero').AsInteger;
    queryDinamico.Params.ParamByName('Producto').Value :=
      Producto.FieldByName('Producto').AsInteger;
    queryDinamico.Params.ParamByName('Cantidad').Value :=
      Producto.FieldByName('Cantidad').AsInteger;
    queryDinamico.Params.ParamByName('Valor').Value :=
      Producto.FieldByName('Valor').AsCurrency;
    queryDinamico.ExecSQL;

    Transaction.Commit;
  except
    on E:Exception do
    begin
      Transaction.Rollback;
      raise Exception.Create('Error: ' + E.Message);
      queryDinamico.Free;
    end;
  end;
end;

procedure TServerMethods.PostFactura(Action: String; Factura: TDataSet);
var
  qryAction: String;

  queryDinamico: TFDQuery;
begin
  Transaction.StartTransaction;
  try
    if Action = 'U' then
      qryAction := 'UPDATE Cabeza_Factura SET Fecha = :Fecha, Cliente = :Cliente, Nombre_Cliente = :Nombre, Direccion = :Direccion WHERE Numero = :Numero'
    else
      qryAction := 'INSERT INTO Cabeza_Factura (Numero, Fecha, Cliente, Nombre_Cliente, Direccion) VALUES (:Numero, :Fecha, :Cliente, :Nombre, :Direccion)';

    queryDinamico := TFDQuery.Create(Nil);
    queryDinamico.Connection := Connection;
    queryDinamico.SQL.Text := qryAction;
    queryDinamico.Active := False;
    queryDinamico.Params.ParamByName('Numero').Value :=
      Factura.FieldByName('Numero').AsInteger;
    queryDinamico.Params.ParamByName('Cliente').Value :=
      Factura.FieldByName('Cliente').AsInteger;
    queryDinamico.Params.ParamByName('Nombre').Value :=
      Factura.FieldByName('Nombre_Cliente').AsString;
    queryDinamico.Params.ParamByName('Direccion').Value :=
      Factura.FieldByName('Direccion').AsString;
    queryDinamico.ExecSQL;

    Transaction.Commit;
  except
    on E:Exception do
    begin
      Transaction.Rollback;
      raise Exception.Create('Error: ' + E.Message);
      queryDinamico.Free;
    end;
  end;
end;

procedure TServerMethods.PostProducto(Action: String; Producto: TDataSet);
var
  qryAction: String;
  queryDinamico: TFDQuery;
begin
  Transaction.StartTransaction;
  try
    if Action = 'U' then
      qryAction := 'UPDATE Productos SET Nombre_Producto = :Nombre, Valor = :Valor WHERE Producto = :Producto'
    else
      qryAction := 'INSERT INTO Productos (Producto, Nombre_Producto, Valor) VALUES (:Producto, :Nombre, :Valor)';

    queryDinamico := TFDQuery.Create(Nil);
    queryDinamico.Connection := Connection;
    queryDinamico.SQL.Text := qryAction;
    queryDinamico.Active := False;
    queryDinamico.Params.ParamByName('Producto').Value :=
      Producto.FieldByName('Producto').AsInteger;
    queryDinamico.Params.ParamByName('Nombre').Value :=
      Producto.FieldByName('Nombre_Producto').AsString;
    queryDinamico.Params.ParamByName('Valor').Value :=
      Producto.FieldByName('Valor').AsCurrency;
    queryDinamico.ExecSQL;

    Transaction.Commit;
  except
    on E:Exception do
    begin
      Transaction.Rollback;
      raise Exception.Create('Error: ' + E.Message);
      queryDinamico.Free;
    end;
  end;
end;

function TServerMethods.GetDetalleFacturas(Numero: Integer): TFDJSONDataSets;
begin
  queryDetalleFactura.Active := False;
  queryDetalleFactura.Params.ParamByName('Num').Value := Numero;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, queryDetalleFactura);
end;

function TServerMethods.GetClientes: TFDJSONDataSets;
begin
  queryClientes.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, queryClientes);
end;

end.
