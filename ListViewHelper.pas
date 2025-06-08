unit ListViewHelper;

interface

uses
  System.Generics.Collections, Vcl.ComCtrls;

type
  TListViewHelper = class
  public
    class function ToArrayList(ListView: TListView): TList<TArray<string>>;
    class procedure LoadFromArrayList(ListView: TListView; const Data: TList<TArray<string>>);
  end;

implementation

uses
  System.SysUtils;

class function TListViewHelper.ToArrayList(ListView: TListView): TList<TArray<string>>;
var
  i, j: Integer;
  Row: TArray<string>;
begin
  Result := TList<TArray<string>>.Create;

  for i := 0 to ListView.Items.Count - 1 do
  begin
    SetLength(Row, ListView.Columns.Count);
    Row[0] := ListView.Items[i].Caption;

    for j := 1 to ListView.Columns.Count - 1 do
      Row[j] := ListView.Items[i].SubItems[j - 1];

    Result.Add(Row);
  end;
end;

class procedure TListViewHelper.LoadFromArrayList(ListView: TListView; const Data: TList<TArray<string>>);
var
  Row: TArray<string>;
  Item: TListItem;
  i: Integer;
begin
  ListView.Items.BeginUpdate;

  try
    ListView.Items.Clear;

    for Row in Data do
    begin
      Item := ListView.Items.Add;
      Item.Caption := Row[0];
      for i := 1 to High(Row) do
        Item.SubItems.Add(Row[i]);
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

end.
