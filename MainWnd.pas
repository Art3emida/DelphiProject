unit MainWnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  AddContactWnd, ListViewHelper, CsvDataStorage, System.Generics.Collections;

type
  TMainForm = class(TForm)
    DeleteButton: TButton;
    SaveToFileButton: TButton;
    LoadFromFileButton: TButton;
    ContactsListView: TListView;
    AddButton: TButton;
    procedure SaveToFileButtonClick(Sender: TObject);
    procedure LoadFromFileButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AddButtonClick(Sender: TObject);
var
  AddForm: TAddContactForm;
  Item: TListItem;
begin
  AddForm := TAddContactForm.Create(self);

  try
    AddForm.ShowModal;

    if AddForm.Submitted then
    begin
      Item := ContactsListView.Items.Add;
      Item.Caption := AddForm.FirstNameField.Text;
      Item.SubItems.Add(AddForm.LastNameField.Text);
      Item.SubItems.Add(AddForm.PhoneNumberField.Text);
      Item.SubItems.Add(AddForm.EmailField.Text);
    end;
  finally
    AddForm.Free;
  end;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
var
  i: Integer;
begin
  for i := ContactsListView.Items.Count - 1 downto 0 do
  begin
    if ContactsListView.Items[i].Selected then
      ContactsListView.Items[i].Delete;
  end;
end;

procedure TMainForm.LoadFromFileButtonClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  Data: TList<TArray<string>>;
begin
  OpenDialog := TOpenDialog.Create(self);

  try
    OpenDialog.Filter := 'CSV files (*.csv)|*.csv';

    if OpenDialog.Execute then
    begin
      Data := TCsvDataStorage.LoadFromFile(OpenDialog.FileName);

      try
        TListViewHelper.LoadFromArrayList(ContactsListView, Data);
        ShowMessage('CSV file successfully imported.');
      finally
        Data.Free;
      end;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TMainForm.SaveToFileButtonClick(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  Headers: TArray<string>;
  Data: TList<TArray<string>>;
  i: Integer;
begin
  SaveDialog := TSaveDialog.Create(self);

  try
    SaveDialog.Filter := 'CSV files (*.csv)|*.csv';
    SaveDialog.DefaultExt := 'csv';

    if SaveDialog.Execute then
    begin
      SetLength(Headers, ContactsListView.Columns.Count);

      for i := 0 to ContactsListView.Columns.Count - 1 do
        Headers[i] := ContactsListView.Columns[i].Caption;

      Data := TListViewHelper.ToArrayList(ContactsListView);

      try
        TCsvDataStorage.SaveToFile(SaveDialog.FileName, Headers, Data);
        ShowMessage('CSV file successfully exported.');
      finally
        Data.Free;
      end;
    end;
  finally
    SaveDialog.Free;
  end;
end;

end.
