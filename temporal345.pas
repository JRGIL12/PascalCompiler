program temporal345;
uses crt;
var N: integer;
begin
  N:=253;
  N:=N+(N div 100)-(N div 100 *100)-(N mod 10)+(N mod 10 *100);
  readln;
end.
