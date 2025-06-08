object AddContactForm: TAddContactForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'New Contact'
  ClientHeight = 201
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 66
    Height = 15
    Caption = 'First Name : '
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 38
    Height = 15
    Caption = 'Email : '
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 90
    Height = 15
    Caption = 'Phone Number : '
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 65
    Height = 15
    Caption = 'Last Name : '
  end
  object SubmitButton: TButton
    Left = 8
    Top = 168
    Width = 233
    Height = 25
    Caption = 'Submit'
    Enabled = False
    TabOrder = 0
    OnClick = SubmitButtonClick
  end
  object EmailField: TEdit
    Left = 104
    Top = 133
    Width = 137
    Height = 23
    TabOrder = 4
    OnChange = FieldChange
  end
  object PhoneNumberField: TEdit
    Left = 104
    Top = 93
    Width = 137
    Height = 23
    TabOrder = 3
    OnChange = FieldChange
  end
  object LastNameField: TEdit
    Left = 104
    Top = 53
    Width = 137
    Height = 23
    TabOrder = 2
    OnChange = FieldChange
  end
  object FirstNameField: TEdit
    Left = 104
    Top = 13
    Width = 137
    Height = 23
    TabOrder = 1
    OnChange = FieldChange
  end
end
