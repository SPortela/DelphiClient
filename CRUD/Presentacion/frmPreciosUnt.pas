unit frmPreciosUnt;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmPrecios = class(TForm)
    lvPrecios: TListView;
    BindingsList: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    bsPreciosAlternos: TBindSourceDB;
    LinkPropertyToFieldSearchVisible: TLinkPropertyToField;
    lyContent: TLayout;
    TopToolBar: TToolBar;
    ToolBarLabel: TLabel;
    procedure lvPreciosButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecios: TfrmPrecios;

implementation

{$R *.fmx}

uses ClientModuleUnt, frmMainUnt;

procedure TfrmPrecios.lvPreciosButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
begin
  with ClientModule.tbPreciosAlternos do
  begin
    if (frmMain.FIvaIncluido = 'S') then
    begin
      if FieldByName('PrecioIVA').AsCurrency > 0 then
        frmMain.edPrecio.Text := FieldByName('PrecioIVA').AsString
      else if FieldByName('PrecioVta').AsCurrency > 0 then
        frmMain.edPrecio.Text := (FieldByName('PrecioVta').AsCurrency *
                                 (1 + frmMain.TarifaIva / 100)).ToString;;
    end
    else if FieldByName('PrecioVta').AsCurrency > 0 then
      frmMain.edPrecio.Text := FieldByName('PrecioVta').AsString;

    frmPrecios.Close;
  end;
end;

end.
