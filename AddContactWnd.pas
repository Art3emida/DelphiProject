unit AddContactWnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAddContactForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FirstNameField: TEdit;
    LastNameField: TEdit;
    PhoneNumberField: TEdit;
    EmailField: TEdit;
    SubmitButton: TButton;
    procedure SubmitButtonClick(Sender: TObject);
    procedure FieldChange(Sender: TObject);
  private
    FSubmitted: Boolean;
  public
    property Submitted: Boolean read FSubmitted;
  end;

var
  AddContactForm: TAddContactForm;

implementation

{$R *.dfm}

procedure TAddContactForm.SubmitButtonClick(Sender: TObject);
begin
  FSubmitted := True;
  Close;
end;

procedure TAddContactForm.FieldChange(Sender: TObject);
begin
  SubmitButton.Enabled :=
    (Trim(FirstNameField.Text) <> '') and
    (Trim(LastNameField.Text) <> '') and
    (Trim(PhoneNumberField.Text) <> '') and
    (Trim(EmailField.Text) <> '');
end;

end.
