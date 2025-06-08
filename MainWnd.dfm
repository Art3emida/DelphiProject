object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'DevTrust App'
  ClientHeight = 339
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object DeleteButton: TButton
    Left = 231
    Top = 279
    Width = 194
    Height = 25
    Caption = 'Delete'
    TabOrder = 0
    OnClick = DeleteButtonClick
  end
  object SaveToFileButton: TButton
    Left = 8
    Top = 310
    Width = 217
    Height = 25
    Caption = 'Save to File'
    TabOrder = 1
    OnClick = SaveToFileButtonClick
  end
  object LoadFromFileButton: TButton
    Left = 231
    Top = 310
    Width = 194
    Height = 25
    Caption = 'Load from File'
    TabOrder = 2
    OnClick = LoadFromFileButtonClick
  end
  object ContactsListView: TListView
    Left = 8
    Top = 8
    Width = 417
    Height = 265
    Columns = <
      item
        AutoSize = True
        Caption = 'First Name'
      end
      item
        AutoSize = True
        Caption = 'Last Name'
      end
      item
        AutoSize = True
        Caption = 'Phone Number'
      end
      item
        AutoSize = True
        Caption = 'Email'
      end>
    MultiSelect = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
  end
  object AddButton: TButton
    Left = 8
    Top = 279
    Width = 217
    Height = 25
    Caption = 'Add'
    TabOrder = 4
    OnClick = AddButtonClick
  end
end
