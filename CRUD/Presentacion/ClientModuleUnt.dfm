object ClientModule: TClientModule
  OldCreateOrder = True
  Height = 334
  Width = 89
  object SvrConn: TDSRestConnection
    Host = '192.168.1.14'
    Port = 8080
    LoginPrompt = False
    SecureProtocols = []
    Left = 25
    Top = 16
    UniqueId = '{F2302FE5-0065-41C3-BB4B-2A8EAA1A95EB}'
  end
  object ClientesData: TFDMemTable
    FieldDefs = <
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Nombre_Cliente'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 24
    Top = 80
  end
  object Facturas: TFDMemTable
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Nombre_Cliente'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 24
    Top = 144
  end
  object Detalle_Factura: TFDMemTable
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Producto'
        DataType = ftInteger
      end
      item
        Name = 'Cantidad'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 24
    Top = 208
  end
  object Productos: TFDMemTable
    FieldDefs = <
      item
        Name = 'Producto'
        DataType = ftInteger
      end
      item
        Name = 'Nombre_Producto'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 24
    Top = 272
  end
end
