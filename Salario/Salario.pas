unit Salario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Samples.Spin,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pMain: TPanel;
    textEmp: TEdit;
    lbHour: TLabel;
    numberHour: TSpinEdit;
    btnCalc: TSpeedButton;
    lbResponse: TLabel;
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
  hourLab: Integer;
  salaryEmployee: Currency;
begin
  if textEmp.Text = EmptyStr then
    raise Exception.Create('Por favor ingrese el nombre del empleado');

  if numberHour.Value <= 0 then
    raise Exception.Create('Por favor ingrese el numero de horas trabajadas');

  salaryEmployee := 0;
  hourLab := numberHour.Value;
  if hourLab < 1 then
    hourLab := 0;
  if hourLab > 35 then
  begin
    hourLab := hourLab - 35;
    salaryEmployee := (35 * 15000);
    salaryEmployee := salaryEmployee + (hourLab * 19000);
  end
  else
    salaryEmployee := (hourLab * 15000);

  lbResponse.Caption := 'Al empleado ' + textEmp.Text + ' se le debe pagar la suma de ' + CurrToStr(salaryEmployee) + ' pesos.';
  textEmp.Text := '';
  numberHour.Value := 0;
end;

end.
