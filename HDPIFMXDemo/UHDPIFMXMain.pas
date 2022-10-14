unit UHDPIFMXMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  Winapi.Windows, Winapi.Messages, FMX.Platform.Win, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Platform, FMX.Layouts, FMX.Objects;

type
  TFormHDPIFMXMain = class(TForm)
    Button1: TButton;
    MemoLog: TMemo;
    Button2: TButton;
    LayoutMeasure: TLayout;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHDPIFMXMain: TFormHDPIFMXMain;

implementation

{$R *.fmx}

uses USecondForm;

procedure TFormHDPIFMXMain.Button1Click(Sender: TObject);
begin
 FormSecond.Show;
end;

procedure TFormHDPIFMXMain.Button2Click(Sender: TObject);
var
  ScreenSvc: IFMXScreenService;
  ScreenSize: TSize;
begin
 MemoLog.Lines.Add('GetSystemMetrics(SM_CXVSCROLL) = ' + GetSystemMetrics(SM_CXVSCROLL).ToString);
 MemoLog.Lines.Add('Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL) = ' + Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL).ToString);


  if TPlatformServices.Current.
     SupportsPlatformService(IFMXScreenService,IInterface(ScreenSvc))
  then
  begin
    MemoLog.Lines.Add(Format('GetScreenSize.X x GetScreenSize.Y = %f x %f', [ScreenSvc.GetScreenSize.X,
        ScreenSvc.GetScreenSize.Y]));
    MemoLog.Lines.Add('GetScreenScale = '+ScreenSvc.GetScreenScale.ToString);
  end;
  MemoLog.Lines.Add(Format('ClientWidth x ClientHeight = %d x %d', [FormHDPIFMXMain.ClientWidth,FormHDPIFMXMain.ClientHeight]));
  MemoLog.Lines.Add(Format('LayoutMeasure.Width x LayoutMeasure.Height =  %f x %f', [LayoutMeasure.Width,LayoutMeasure.Height]));
  MemoLog.Lines.Add('TForm.Handle.Scale = '+FormHDPIFMXMain.Handle.Scale.ToString);

end;

procedure TFormHDPIFMXMain.FormResize(Sender: TObject);
begin
 MemoLog.Lines.Add('FormResize');
end;

end.
