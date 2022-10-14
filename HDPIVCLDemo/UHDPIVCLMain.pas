unit UHDPIVCLMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, Vcl.StdActns, Vcl.ActnList,
  System.Actions, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.VirtualImage;

const
  UM_RELOADFORM = WM_USER +  321;

type
  TFormHDPIVCLMain = class(TForm)
    MemoLog: TMemo;
    ButtonZoomIn: TButton;
    ButtonPrintInfo: TButton;
    SearchBox1: TSearchBox;
    Shape1: TShape;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    BitBtnNewWindow: TBitBtn;
    ButtonZoomOut: TButton;
    ButtonRestore: TButton;
    ActionManager1: TActionManager;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    ActionSmthSpecial: TAction;
    MainMenu1: TMainMenu;
    PLik1: TMenuItem;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    Edycja1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    VirtualImage1: TVirtualImage;
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
    procedure FormShow(Sender: TObject);
    procedure ButtonZoomInClick(Sender: TObject);
    procedure ButtonPrintInfoClick(Sender: TObject);
    procedure PrintDPIInfo(AMemo : TMemo);
    procedure BitBtnNewWindowClick(Sender: TObject);
    procedure ButtonZoomOutClick(Sender: TObject);
    procedure ButtonRestoreClick(Sender: TObject);
  private
    { Private declarations }
    procedure UMReloadForm(var msg: TMessage); message UM_RELOADFORM;
  public
    { Public declarations }
  end;

var
  FormHDPIVCLMain: TFormHDPIVCLMain;

implementation

{$R *.dfm}

uses UFormWithArrow;

procedure TFormHDPIVCLMain.BitBtnNewWindowClick(Sender: TObject);
begin
 FWithArrow.Show;
end;

procedure TFormHDPIVCLMain.ButtonZoomInClick(Sender: TObject);
begin
 self.ScaleBy(120,100);
end;

procedure TFormHDPIVCLMain.PrintDPIInfo(AMemo : TMemo);
begin
 AMemo.Lines.Add('GetSystemMetrics(SM_CXVSCROLL) = ' + GetSystemMetrics(SM_CXVSCROLL).ToString);
 AMemo.Lines.Add('Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL) = ' + Winapi.Windows.GetSystemMetrics(SM_CXVSCROLL).ToString);
 AMemo.Lines.Add('Screen.PixelsPerInch = '+Screen.PixelsPerInch.ToString);
 AMemo.Lines.Add('Mno¿nik = ' + MulDiv(100, Screen.PixelsPerInch, Screen.DefaultPixelsPerInch).ToString);
 AMemo.Lines.Add('self.CurrentPPI = ' + self.CurrentPPI.ToString);
 AMemo.Lines.Add('self.GetDesignDpi = ' + self.GetDesignDpi.ToString);
 AMemo.Lines.Add('Screen.DefaultPixelsPerInch = ' + Screen.DefaultPixelsPerInch.ToString);
 
 if CheckPerMonitorV2SupportForWindow(self.Handle) then
  AMemo.Lines.Add('PerMonitorV2 supported');
end;

//getallocatedwindowhandle

//http://delphi-kb.blogspot.com/2004/01/revert-all-controls-on-tform-to-design.html
procedure TFormHDPIVCLMain.UMReloadForm(var msg: TMessage);
var
  i: Integer;
  rs: TResourceStream;
begin
  //ugly hack ;)
  self.MakeFullyVisible(Screen.Monitors[0]);
  {Block form redrawing}
  Perform(WM_SETREDRAW, 0, 0);
  try
    {Delete all components on the form}
    for i := ComponentCount - 1 downto 0 do
      Components[i].Free;
    {Find the forms resource}
    rs := TResourceStream.Create(FindClassHInstance(TFormHDPIVCLMain),
                                 Classname, RT_RCDATA);
    try
      rs.ReadComponent(self);
    finally
      rs.free
    end;
  finally
    {Redisplay form}
    self.ScaleBy(MulDiv(100, self.CurrentPPI, Screen.DefaultPixelsPerInch),100);
    Perform(WM_SETREDRAW, 1, 0);
    Invalidate;
    self.Left := (self.Monitor.Width  - self.Width)  div 2;
    self.Top  := (self.Monitor.Height - self.Height) div 2;
  end;
end;

procedure TFormHDPIVCLMain.ButtonPrintInfoClick(Sender: TObject);
begin
  PrintDPIInfo(MemoLog);
end;

procedure TFormHDPIVCLMain.ButtonZoomOutClick(Sender: TObject);
begin
   self.ScaleBy(100,120);
end;

procedure TFormHDPIVCLMain.ButtonRestoreClick(Sender: TObject);
begin
  {Delay action until button click code has finished executing}
  PostMessage(handle, UM_RELOADFORM, 0, 0);
end;

procedure TFormHDPIVCLMain.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  PrintDPIInfo(MemoLog);
end;

procedure TFormHDPIVCLMain.FormShow(Sender: TObject);
begin
  PrintDPIInfo(MemoLog);
end;

end.
