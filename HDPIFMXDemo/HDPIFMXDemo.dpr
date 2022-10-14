program HDPIFMXDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  UHDPIFMXMain in 'UHDPIFMXMain.pas' {FormHDPIFMXMain},
  USecondForm in 'USecondForm.pas' {FormSecond};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHDPIFMXMain, FormHDPIFMXMain);
  Application.CreateForm(TFormSecond, FormSecond);
  Application.Run;
end.
