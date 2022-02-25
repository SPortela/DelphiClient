unit Fibonacci;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    numCalc: TSpinEdit;
    lbCaptura: TLabel;
    lbResponse: TLabel;
    pTop: TPanel;
    pClient: TPanel;
    btnCalc: TSpeedButton;
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCalcClick(Sender: TObject);
var
  fibonacci: Array of Integer;
  I, nextNumber, numberSuccession: Integer;
  ResultSuccession: String;
begin
  numberSuccession := numCalc.Value;
  if(numberSuccession <= 20) then
  begin
    if(numberSuccession >= 1) then
    begin
      SetLength(fibonacci, numberSuccession);
      fibonacci[0] := 0;
      fibonacci[1] := 1;
      for I := 2 to numberSuccession do
        fibonacci[I] := fibonacci[I-1] + fibonacci[I-2];
      for I := 0 to numberSuccession do
        ResultSuccession := ResultSuccession + IntToStr(fibonacci[I]) + ', ';
      lbResponse.Caption := Copy(ResultSuccession, 0, ResultSuccession.Length-2);
    end
    else
     ShowMessage('El número no puede ser menor a 1.');
  end
  else
   ShowMessage('El número no puede ser mayor a 20.');
end;

end.
