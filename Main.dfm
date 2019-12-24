object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 103
  ClientWidth = 383
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniEdit1: TUniEdit
    Left = 24
    Top = 24
    Width = 321
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object UniButton1: TUniButton
    Left = 24
    Top = 52
    Width = 321
    Height = 41
    Hint = ''
    Caption = 'Test'
    TabOrder = 1
    OnClick = UniButton1Click
  end
end
