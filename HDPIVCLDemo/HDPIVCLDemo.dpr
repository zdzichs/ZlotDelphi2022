program HDPIVCLDemo;

uses
  Vcl.Forms,
  UHDPIVCLMain in 'UHDPIVCLMain.pas' {FormHDPIVCLMain},
  UFormWithArrow in 'UFormWithArrow.pas' {FWithArrow},
  Winapi.Windows,
  USecondFormWithArrow in 'USecondFormWithArrow.pas' {F2WithArrow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_UNAWARE);
  Application.CreateForm(TFormHDPIVCLMain, FormHDPIVCLMain);

  //SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2);
  Application.CreateForm(TF2WithArrow, F2WithArrow);
  Application.CreateForm(TFWithArrow, FWithArrow);
  //SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_UNAWARE);
  Application.Run;
end.
