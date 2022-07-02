uses Graph;

var
  Gd, Gm : Integer;
  Row : Integer;
  Title : String;
  Size : Integer;

begin
  Gd := Detect;
  InitGraph(Gd, Gm, '');

  Row := 0;
  Title := 'Aca';
  Size := 1;
  while TextWidth(Title) < GetMaxX do
   begin
    OutTextXY(0, Row, Title);
    inc(Row, TextHeight('M'));
    Inc(Size);
    SetTextStyle(DefaultFont, HorizDir, Size);
   end;
  ReadLn;
  CloseGraph;
end.

{http://pascal.net.ru/TextWidth}
