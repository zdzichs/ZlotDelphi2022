unit USecondForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Platform, Winapi.Windows;

type
  TFormSecond = class(TForm)
    Button2: TButton;
    MemoLog: TMemo;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSecond: TFormSecond;

implementation

{$R *.fmx}

procedure TFormSecond.Button2Click(Sender: TObject);
var
  ScreenSvc: IFMXScreenService;
  ScreenSize: TSize;
begin
  MemoLog.Lines.Add('GetSystemMetrics(SM_CXVSCROLL) = ' + GetSystemMetrics(SM_CXVSCROLL).ToString);
  MemoLog.Lines.Add('Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL) = ' +
                                           Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL).ToString);
  if TPlatformServices.Current.
     SupportsPlatformService(IFMXScreenService,IInterface(ScreenSvc))
  then
  begin
    MemoLog.Lines.Add(Format('GetScreenSize.X x GetScreenSize.Y = %f x %f', [ScreenSvc.GetScreenSize.X,
        ScreenSvc.GetScreenSize.Y]));
    MemoLog.Lines.Add('GetScreenScale = '+ScreenSvc.GetScreenScale.ToString);
  end;
  MemoLog.Lines.Add(Format('ClientWidth x ClientHeight = %d x %d',
                                                     [FormSecond.ClientWidth,FormSecond.ClientHeight]));
  MemoLog.Lines.Add('TForm.Handle.Scale = '+FormSecond.Handle.Scale.ToString);
end;

end.
