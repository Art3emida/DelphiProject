program DevTrustApp;

uses
  Vcl.Forms,
  MainWnd in 'MainWnd.pas' {MainForm},
  AddContactWnd in 'AddContactWnd.pas' {AddContactForm},
  ListViewHelper in 'ListViewHelper.pas',
  CsvDataStorage in 'CsvDataStorage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddContactForm, AddContactForm);
  Application.Run;
end.
