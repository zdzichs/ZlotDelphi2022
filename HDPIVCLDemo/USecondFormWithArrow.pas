unit USecondFormWithArrow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TF2WithArrow = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormBeforeMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
  private
    { Private declarations }
    DrawScale : double;
    function ComputeDrawScale : double;

  public
    { Public declarations }
  end;

var
  F2WithArrow: TF2WithArrow;

implementation

{$R *.dfm}

procedure TF2WithArrow.FormCreate(Sender: TObject);
begin
 DrawScale := ComputeDrawScale;
end;

function TF2WithArrow.ComputeDrawScale : double;
begin
  result := CurrentPPI/Screen.DefaultPixelsPerInch;
end;

procedure TF2WithArrow.FormBeforeMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  DrawScale := ComputeDrawScale;
end;

procedure TF2WithArrow.PaintBox1Paint(Sender: TObject);
begin
with PaintBox1.Canvas do
 begin
   TextOut(0,0,PaintBox1.CurrentPPI.ToString);
   Brush.Style := bsSolid;
   Brush.Color := clRed;
   Pen.Color := clRed;
   var rightm := (PaintBox1.Width) - Round(40 * DrawScale);
   FillRect(Rect(0,
     (PaintBox1.Height div 2)-Round(30 * DrawScale),
     rightm,
     (PaintBox1.Height div 2) + Round(30 * DrawScale)));
   Polygon( [Point(rightm,(PaintBox1.Height div 2)-Round(60 * DrawScale)),
      Point((PaintBox1.Width),(PaintBox1.Height div 2)), Point(rightm,(PaintBox1.Height div 2)+Round(60 * DrawScale))]);
 end;
end;

end.
