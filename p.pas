program EjemploArchivos; 

var
  F, G: text;
  x, y: char;

begin
  assign(F, 'C:\Gloria\ARCHIVOS\F.txt');
  assign(G, 'C:\Gloria\ARCHIVOS\G.txt');
  reset(F);
  
if IOResult = 0 then
begin
append (G);
while (not (eof (F))) do
begin
readln (F, x);
writeln (G, x);
end;
close (F); close (G);
end;
End.
