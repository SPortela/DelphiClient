unit myServerModuleUnit;

interface

Uses
  SysUtils, Classes, DateUtils, strUtils, DBXCommon, FireDAC.Comp.Client,
  DSCommonServer;

const
  MAX_ROWS = 500;

type
{$METHODINFO ON}
  TmyServerModule = class(TComponent)
  private
    FSvrConn: TFDConnection;

  protected
    FIPAddress, FAmbienteId: String;
    FSessionId, FEmpresaId, FUsuarioId, FTerceroId, FItemActv: Integer;
    FFechaActv: TDateTime;
    FDSServer: TDSCustomServer;
    procedure DoCreateConexion(); virtual;

  public
    Destructor Destroy; override;
    procedure CreateConexion(DSServer: TDSCustomServer);
    procedure CargarDatosSession(Session: Integer);
    function GenerarContador(Modulo, Contador: String;
      EmpresaId: Integer = 0): Integer;
    function TestServices(): String;

  published
    property svrConn: TFDConnection read FSvrConn;
  end;
{$METHODINFO OFF}

implementation

{ TmyServerModule }

// ------------------------------------------------------------------------------
procedure TmyServerModule.CargarDatosSession(Session: Integer);
Var
  querySession: TFDQuery;

begin
  FSessionId := Session;

  with querySession do
  begin
    SQL.Text := 'SELECT EmpresaId, UsuarioId, Estado, TerceroId, Simulacion, ' +
      '       FechaMod ' + 'FROM DT_Session ' + 'WHERE SessionId = ' + IntToStr(Session);
    Active := False;
    Params.ParamByName('SessionId').Value := FSessionId;
    Open;
    if (RecordCount > 0) AND (FieldByName('Estado').AsString = 'AC') then
    begin
      FEmpresaId := FieldByName('EmpresaId').AsInteger;
      FUsuarioId := FieldByName('UsuarioId').AsInteger;
      FTerceroId := FieldByName('TerceroId').AsInteger;
    end;
  end;
end;

// ------------------------------------------------------------------------------
procedure TmyServerModule.CreateConexion(DSServer: TDSCustomServer);
begin
  FIPAddress := '0.0.0.0';
  FSessionId := 0;
  FEmpresaId := 0;
  FUsuarioId := 0;
  FDSServer := DSServer;

  FSvrConn := TFDConnection.Create(Self);
  DoCreateConexion();
end;

// ------------------------------------------------------------------------------
destructor TmyServerModule.Destroy;
begin
  if Assigned(svrConn) then
    svrConn.Free;
  inherited;
end;

// ------------------------------------------------------------------------------
procedure TmyServerModule.DoCreateConexion;
begin

end;

// ------------------------------------------------------------------------------
function TmyServerModule.GenerarContador(Modulo, Contador: String;
  EmpresaId: Integer): Integer;
var
  querySelect, queryContador: TFDQuery;

begin
  Result := 0;
  try
    querySelect.SQL.Text := 'SELECT ValorInt ' + 'FROM DT_Parametro ' +
      'WHERE EmpresaId = :EmpresaId ' + ' AND Modulo = :Modulo ' +
      ' AND Tabla = ''CONTADOR'' ' + ' AND Codigo = :Contador ';

    querySelect.Active := False;
    querySelect.Params.ParamByName('EmpresaId').Value := EmpresaId;
    querySelect.Params.ParamByName('Modulo').Value := Modulo;
    querySelect.Params.ParamByName('Contador').Value := Contador;
    querySelect.Open;
    Result := querySelect.FieldByName('ValorInt').AsInteger;
  finally
    querySelect.Free;
  end;

  if Result = 0 then
  begin
    try
      querySelect.SQL.Text := 'INSERT INTO DT_Parametro ' +
        '(EmpresaId, Modulo, Tabla, Codigo, NombreParm, ValorInt, ' +
        'UsuarioId, FechaIng, FechaMod) ' +
        'VALUES (:EmpresaId, :Modulo, ''CONTADOR'', :Contador, ' +
        '''ULTIMO '' + :Contador + '' CREADO'', 1, 1, GETDATE(), GETDATE())';

      querySelect.Active := False;
      querySelect.Params.ParamByName('EmpresaId').Value := FEmpresaId;
      querySelect.Params.ParamByName('Modulo').Value := Modulo;
      querySelect.Params.ParamByName('Contador').Value := Contador;
      querySelect.ExecSQL;
    finally
      querySelect.Free;
    end;
  end
  else
  begin
    try
      querySelect.SQL.Text := 'UPDATE DT_Parametro ' +
        'SET ValorInt = ValorInt + 1 ' + 'WHERE EmpresaId = :EmpresaId ' +
        ' AND Modulo = :Modulo ' + ' AND Tabla = ''CONTADOR'' ' +
        ' AND Codigo = :Contador';

      querySelect.Active := False;
      querySelect.Params.ParamByName('EmpresaId').Value := FEmpresaId;
      querySelect.Params.ParamByName('Modulo').Value := Modulo;
      querySelect.Params.ParamByName('Contador').Value := Contador;
      querySelect.ExecSQL;
    finally
      querySelect.Free;
    end;
  end;

  try
    querySelect.SQL.Text := 'SELECT ValorInt ' + 'FROM DT_Parametro ' +
      'WHERE EmpresaId = :EmpresaId ' + ' AND Modulo = :Modulo ' +
      ' AND Tabla = ''CONTADOR'' ' + ' AND Codigo = :Contador ';

    querySelect.Active := False;
    querySelect.Params.ParamByName('EmpresaId').Value := FEmpresaId;
    querySelect.Params.ParamByName('Modulo').Value := Modulo;
    querySelect.Params.ParamByName('Contador').Value := Contador;
    querySelect.Open;

    Result := querySelect.FieldByName('ValorInt').AsInteger;
  finally
    querySelect.Free;
  end;
end;

// ------------------------------------------------------------------------------
function TmyServerModule.TestServices: String;
begin
  Result := 'Test Console Server' + #13 + 'Numero: ' + FloatToStr(88211658.25) +
    #13 + 'Fecha: ' + DateToStr(Now());
end;

end.
