object FWithArrow: TFWithArrow
  Left = 0
  Top = 0
  Caption = 'FWithArrow'
  ClientHeight = 509
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    624
    509)
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = 120
    Top = 64
    Width = 369
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnPaint = PaintBox1Paint
    ExplicitWidth = 381
  end
  object ButtonSecondFormArrow: TButton
    Left = 536
    Top = 476
    Width = 75
    Height = 25
    Caption = '2 wersja'
    TabOrder = 0
    OnClick = ButtonSecondFormArrowClick
  end
end
