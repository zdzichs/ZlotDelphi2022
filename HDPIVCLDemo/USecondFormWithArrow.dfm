object F2WithArrow: TF2WithArrow
  Left = 0
  Top = 0
  Caption = 'F2WithArrow'
  ClientHeight = 491
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnBeforeMonitorDpiChanged = FormBeforeMonitorDpiChanged
  OnCreate = FormCreate
  DesignSize = (
    624
    491)
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = 120
    Top = 64
    Width = 373
    Height = 345
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnPaint = PaintBox1Paint
    ExplicitWidth = 377
  end
end
