program whil;

var
i,x:integer;

begin
  WriteLn('x :');
  ReadLn(x);
  i:=0;
  while x<>0 do
   begin
    i:=i+1;
    writeln(' el dígito ',i,' : ',x mod 10);
    x:= x div 10;
   end;
  WriteLn(x);
  readln;
end.
