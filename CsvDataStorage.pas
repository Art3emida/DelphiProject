unit CsvDataStorage;

interface

uses
  System.Classes, System.Generics.Collections;

type
  TCsvDataStorage = class
  public
    class procedure SaveToFile(const FileName: string; const Headers: TArray<string>; const Data: TList<TArray<string>>);
    class function LoadFromFile(const FileName: string): TList<TArray<string>>;
  end;

implementation

uses
  System.SysUtils;

class procedure TCsvDataStorage.SaveToFile(const FileName: string; const Headers: TArray<string>; const Data: TList<TArray<string>>);
var
  Writer: TStreamWriter;
  Row: TArray<string>;
  i: Integer;
begin
  Writer := TStreamWriter.Create(FileName, False, TEncoding.UTF8);

  try
    if Length(Headers) > 0 then
      Writer.WriteLine('"' + String.Join('","', Headers) + '"');

    for Row in Data do
      Writer.WriteLine('"' + String.Join('","', Row) + '"');
  finally
    Writer.Free;
  end;
end;

class function TCsvDataStorage.LoadFromFile(const FileName: string): TList<TArray<string>>;
var
  Reader: TStreamReader;
  Line: string;
  Cells: TArray<string>;
begin
  Result := TList<TArray<string>>.Create;
  Reader := TStreamReader.Create(FileName, TEncoding.UTF8);

  try
    if not Reader.EndOfStream then
      Reader.ReadLine;

    while not Reader.EndOfStream do
    begin
      Line := Reader.ReadLine;
      Cells := Line.Replace('"', '').Split([',']);
      Result.Add(Cells);
    end;
  finally
    Reader.Free;
  end;
end;

end.
