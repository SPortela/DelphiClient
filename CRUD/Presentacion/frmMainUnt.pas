unit frmMainUnt;

interface

uses {$IFDEF ANDROID} Posix.Unistd, {$ENDIF}
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Actions, System.Rtti, System.Bindings.Outputs,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.TabControl,
  FMX.ActnList, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Bind.Editors, FMX.Bind.DBEngExt, Data.FireDACJSONReflect,
  Data.Bind.EngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.Client, FMX.Gestures, FMX.ListBox, FMX.EditBox, FMX.SpinBox,
  FMX.DateTimeCtrls, FMX.ComboEdit, FMX.Layouts, FMX.MultiView,
  System.ImageList, FMX.ImgList, FMX.DialogService, Datasnap.DSClientRest,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, FMX.Menus,
  FMX.NumberBox, Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient,
  FireDAC.Comp.DataSet;

type
  TfrmMain = class(TForm)
    TopToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl: TTabControl;
    StyleBook: TStyleBook;
    lyContent: TLayout;
    listClientes: TListView;
    Clientes: TTabItem;
    Facturas: TTabItem;
    listFacturas: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    Label2: TLabel;
    BindSourceDB: TBindSourceDB;
    LinkListControlToFieldNombre_Cliente: TLinkListControlToField;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    btNuevaFactura: TSpeedButton;
    Productos: TTabItem;
    listProductos: TListView;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    TabFactura: TTabControl;
    Cabecera: TTabItem;
    Detalle: TTabItem;
    listDetalle: TListView;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    LinkPropertyToFieldItemSpacesLeft: TLinkPropertyToField;
    LinkPropertyToFieldItemSpacesRight: TLinkPropertyToField;
    btNuevoCliente: TSpeedButton;
    TabClientes: TTabControl;
    TabListClientes: TTabItem;
    TabNuevoCliente: TTabItem;
    NumberBoxCliente: TNumberBox;
    LabelCliente: TLabel;
    LinkControlToFieldCliente: TLinkControlToField;
    EditNombre_Cliente: TEdit;
    LabelNombre_Cliente2: TLabel;
    LinkControlToFieldNombre_Cliente2: TLinkControlToField;
    EditDireccion: TEdit;
    LabelDireccion: TLabel;
    LinkControlToFieldDireccion: TLinkControlToField;
    Guardar: TSpeedButton;
    TabProductos: TTabControl;
    TabListProductos: TTabItem;
    ToolBar3: TToolBar;
    Label3: TLabel;
    btNuevoProducto: TSpeedButton;
    TabProducto: TTabItem;
    btGuardaProducto: TSpeedButton;
    NumberBoxProducto: TNumberBox;
    LabelProducto: TLabel;
    LinkControlToFieldProducto: TLinkControlToField;
    EditNombre_Producto: TEdit;
    LabelNombre_Producto: TLabel;
    LinkControlToFieldNombre_Producto: TLinkControlToField;
    NumberBoxValor: TNumberBox;
    LabelValor: TLabel;
    LinkControlToFieldValor: TLinkControlToField;
    Cancelar: TSpeedButton;
    CancelarProducto: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure listFacturasButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure btNuevoClienteClick(Sender: TObject);
    procedure GuardarClick(Sender: TObject);
    procedure listClientesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btNuevoProductoClick(Sender: TObject);
    procedure btGuardaProductoClick(Sender: TObject);
    procedure listProductosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure CancelarClick(Sender: TObject);
    procedure CancelarProductoClick(Sender: TObject);

  private
    Action: String;
    procedure CargarDatos;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses ClientModuleUnt, StrUtils, DateUtils, FMX.Dialogs, ClientClassesUnt;


procedure TfrmMain.btGuardaProductoClick(Sender: TObject);
var
  DataTemp: TFDMemTable;
begin
  DataTemp := TFDMemTable.Create(nil);
  with ClientModule do
  begin
    Productos.Post;
    DataTemp.CopyDataSet(Productos, [coStructure]);
    DataTemp.Insert;
    DataTemp.CopyRecord(Productos);
    DataTemp.Post;
    ServerMethodsClient.PostProducto(Action, DataTemp);
    TabProductos.ActiveTab := TabListProductos;
  end;
end;

procedure TfrmMain.btNuevoClienteClick(Sender: TObject);
begin
  with ClientModule do
  begin
    Action := 'I';
    NumberBoxCliente.Enabled := True;
    ClientesData.Append;
    TabClientes.ActiveTab := TabNuevoCliente;
  end;
end;

procedure TfrmMain.btNuevoProductoClick(Sender: TObject);
begin
  with ClientModule do
  begin
    Action := 'I';
    NumberBoxProducto.Enabled := True;
    Productos.Append;
    TabProductos.ActiveTab := TabProducto;
  end;
end;

procedure TfrmMain.CancelarClick(Sender: TObject);
begin
  ClientModule.ClientesData.RevertRecord;
  TabClientes.ActiveTab := TabListClientes;
end;

procedure TfrmMain.CancelarProductoClick(Sender: TObject);
begin
  ClientModule.Productos.RevertRecord;
  TabProductos.ActiveTab := TabListProductos;
end;

procedure TfrmMain.CargarDatos;
var
  DataSet: TFDJSONDataSets;
begin
  with ClientModule, ServerMethodsClient, TFDJSONDataSetsReader do
    try
      DataSet := GetClientes();
      ClientesData.Close;
      ClientesData.AppendData(GetListValue(DataSet, 0));
      ClientesData.Open;

      DataSet.CleanupInstance;

      DataSet := GetFacturas();
      Facturas.Close;
      Facturas.AppendData(GetListValue(DataSet, 0));
      Facturas.Open;

      DataSet.CleanupInstance;

      DataSet := GetProductos();
      Productos.Close;
      Productos.AppendData(GetListValue(DataSet, 0));
      Productos.Open;
    finally

    end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Action := '';
  CargarDatos;
end;

procedure TfrmMain.GuardarClick(Sender: TObject);
var
  DataTemp: TFDMemTable;
begin
  DataTemp := TFDMemTable.Create(nil);
  with ClientModule do
  begin
    ClientesData.Post;
    DataTemp.CopyDataSet(ClientesData, [coStructure]);
    DataTemp.Insert;
    DataTemp.CopyRecord(ClientesData);
    DataTemp.Post;
    ServerMethodsClient.PostCliente(Action, DataTemp);
    TabClientes.ActiveTab := TabListClientes;
  end;
end;

procedure TfrmMain.listClientesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  with ClientModule do
  begin
    Action := 'U';
    NumberBoxCliente.Enabled := False;
    ClientesData.Edit;
    TabClientes.ActiveTab := TabNuevoCliente;
  end;
end;

procedure TfrmMain.listFacturasButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
var
  DataSet: TFDJSONDataSets;
begin
  with ClientModule, ServerMethodsClient, TFDJSONDataSetsReader do
    try
      DataSet := GetDetalleFacturas(Facturas.FieldByName('Numero').AsInteger);
      Detalle_Factura.Close;
      Detalle_Factura.AppendData(GetListValue(DataSet, 0));
      Detalle_Factura.Open;
    finally

    end;
end;

procedure TfrmMain.listProductosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  with ClientModule do
  begin
    Action := 'U';
    NumberBoxProducto.Enabled := True;
    Productos.Edit;
    TabProductos.ActiveTab := TabProducto;
  end;
end;

end.
