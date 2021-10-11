object Form1: TForm1
  Left = 214
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Circle 3 points'
  ClientHeight = 484
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 696
    Top = 26
    Width = 113
    Height = 79
    Caption = ' Point A '
    TabOrder = 0
    object Panel3: TPanel
      Left = 10
      Top = 20
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'X :'
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 39
      Top = 20
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 10
      Top = 49
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'Y :'
      TabOrder = 2
    end
    object Panel6: TPanel
      Left = 39
      Top = 49
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 696
    Top = 112
    Width = 113
    Height = 81
    Caption = ' Point B '
    TabOrder = 1
    object Panel7: TPanel
      Left = 10
      Top = 20
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'X :'
      TabOrder = 0
    end
    object Panel8: TPanel
      Left = 39
      Top = 20
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel9: TPanel
      Left = 10
      Top = 49
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'Y :'
      TabOrder = 2
    end
    object Panel10: TPanel
      Left = 39
      Top = 49
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 696
    Top = 200
    Width = 113
    Height = 81
    Caption = ' Point C '
    TabOrder = 2
    object Panel11: TPanel
      Left = 10
      Top = 20
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'X :'
      TabOrder = 0
    end
    object Panel12: TPanel
      Left = 39
      Top = 20
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel13: TPanel
      Left = 10
      Top = 49
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'Y :'
      TabOrder = 2
    end
    object Panel14: TPanel
      Left = 39
      Top = 49
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 696
    Top = 288
    Width = 113
    Height = 105
    Caption = ' Circle '
    TabOrder = 3
    object Panel15: TPanel
      Left = 10
      Top = 20
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'X :'
      TabOrder = 0
    end
    object Panel16: TPanel
      Left = 39
      Top = 20
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel17: TPanel
      Left = 10
      Top = 49
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'Y :'
      TabOrder = 2
    end
    object Panel18: TPanel
      Left = 39
      Top = 49
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Panel19: TPanel
      Left = 10
      Top = 79
      Width = 31
      Height = 21
      BevelOuter = bvNone
      Caption = 'R :'
      TabOrder = 4
    end
    object Panel20: TPanel
      Left = 39
      Top = 79
      Width = 61
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 465
    Width = 818
    Height = 19
    Panels = <
      item
        Text = 'En attente du premier point'
        Width = 365
      end
      item
        Text = 'X : 0'
        Width = 150
      end
      item
        Text = 'Y : 0'
        Width = 50
      end>
  end
  object Button2: TButton
    Left = 696
    Top = 432
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = 'Clear'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 696
    Top = 400
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = 'Next >>'
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 681
    Height = 449
    Cursor = crHandPoint
    ActivePage = TabSheet1
    TabOrder = 7
    object TabSheet1: TTabSheet
      Caption = ' Dessin '
      object Image1: TImage
        Left = 0
        Top = 3
        Width = 673
        Height = 415
        Cursor = crCross
        Align = alBottom
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' Etapes de calcul '
      ImageIndex = 1
      object RichEdit1: TRichEdit
        Left = 10
        Top = 10
        Width = 651
        Height = 405
        Lines.Strings = (
          'Soit 3 points A,B,C tels que :')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 264
    Top = 184
  end
end
