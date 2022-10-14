unit UFormWithArrow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TArrowShape = class( TPaintBox )
    procedure Paint;override;
  end;

  TFWithArrow = class(TForm)
    PaintBox1: TPaintBox;
    ButtonSecondFormArrow: TButton;

    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSecondFormArrowClick(Sender: TObject);
  private
    { Private declarations }
    FMyArrow : TArrowShape;
  public
    { Public declarations }
  end;



var
  FWithArrow: TFWithArrow;

implementation

{$R *.dfm}

uses USecondFormWithArrow;

procedure TFWithArrow.ButtonSecondFormArrowClick(Sender: TObject);
begin
 F2WithArrow.Show;
end;

procedure TFWithArrow.FormCreate(Sender: TObject);
begin
  FMyArrow := TArrowShape.Create(self);
  FMyArrow.Parent := self;
  FMyArrow.Top := MulDiv(10, CurrentPPI, Screen.DefaultPixelsPerInch {96});
  FMyArrow.Left := MulDiv(10, CurrentPPI, Screen.DefaultPixelsPerInch {96});
  FMyArrow.Width := MulDiv(120, CurrentPPI, Screen.DefaultPixelsPerInch {96});
  FMyArrow.Height := MulDiv(120, CurrentPPI, Screen.DefaultPixelsPerInch {96});


end;

procedure TFWithArrow.PaintBox1Paint(Sender: TObject);
begin
 with PaintBox1.Canvas do
 begin
   TextOut(0,0,PaintBox1.CurrentPPI.ToString);
   Brush.Style := bsSolid;
   Brush.Color := clRed;
   Pen.Color := clRed;
   var rightm := (PaintBox1.Width) - MulDiv(40, CurrentPPI, Screen.DefaultPixelsPerInch {96});
   FillRect(Rect(MulDiv(0, CurrentPPI, Screen.DefaultPixelsPerInch {96}),
     (PaintBox1.Height div 2)-MulDiv(30, CurrentPPI, Screen.DefaultPixelsPerInch {96}),
     rightm,
     (PaintBox1.Height div 2) + MulDiv(30, CurrentPPI, Screen.DefaultPixelsPerInch {96})));
   Polygon( [Point(rightm,(PaintBox1.Height div 2)-MulDiv(60, CurrentPPI, Screen.DefaultPixelsPerInch {96})),
      Point((PaintBox1.Width),(PaintBox1.Height div 2)),
      Point(rightm,(PaintBox1.Height div 2)+MulDiv(60, CurrentPPI, Screen.DefaultPixelsPerInch {96}))]);
 end;

end;

{ TArrowShape }

procedure TArrowShape.Paint;
begin
  inherited;
  with self.Canvas do
 begin
   TextOut(0,0,self.CurrentPPI.ToString);
   Brush.Style := bsSolid;
   Brush.Color := clRed;
   Pen.Color := clRed;
   var rightm := (self.Width) - MulDiv(40, CurrentPPI, Screen.DefaultPixelsPerInch {96});
   FillRect(Rect(MulDiv(0, CurrentPPI, Screen.DefaultPixelsPerInch {96}),
     (self.Height div 2)-MulDiv(30, CurrentPPI, Screen.DefaultPixelsPerInch {96}),
     rightm,
     (self.Height div 2) + MulDiv(30, CurrentPPI, Screen.DefaultPixelsPerInch {96})));
   Polygon( [Point(rightm,(self.Height div 2)-MulDiv(60, CurrentPPI, Screen.DefaultPixelsPerInch {96})),
      Point((self.Width),(self.Height div 2)),
      Point(rightm,(self.Height div 2)+MulDiv(60, CurrentPPI, Screen.DefaultPixelsPerInch {96}))]);
 end;
end;

end.
