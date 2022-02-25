object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 306
  Width = 197
  object Connection: TFDConnection
    Params.Strings = (
      'Database=CRUD_Clientes'
      'Server=LOCALHOST'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object StanStorageJSON: TFDStanStorageJSONLink
    Left = 40
    Top = 64
  end
  object MSSQLDriver: TFDPhysMSSQLDriverLink
    Left = 40
    Top = 120
  end
  object GUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 176
  end
  object StanStorageBin: TFDStanStorageBinLink
    Left = 40
    Top = 232
  end
  object queryClientes: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM Clientes')
    Left = 128
    Top = 8
  end
  object queryDetalleFactura: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM Detalle_Factura WHERE Numero = :Num')
    Left = 128
    Top = 120
    ParamData = <
      item
        Name = 'NUM'
        ParamType = ptInput
      end>
  end
  object queryFacturas: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM Cabeza_Factura')
    Left = 128
    Top = 64
  end
  object queryProductos: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM Productos'
      '')
    Left = 128
    Top = 176
  end
  object Transaction: TFDTransaction
    Connection = Connection
    Left = 128
    Top = 240
  end
end
