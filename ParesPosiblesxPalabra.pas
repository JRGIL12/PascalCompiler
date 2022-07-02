program ParesPosiblesxPalabra;
var 
Palabra, ParesPosibles:string;

function ParesXPalabra(Palabra:String):string;
 var 
 j,l{ variables control}:integer;
 begin
 for j:=1 to length(palabra) do
    for l:=1 to length (palabra) do
      If J<>l then
        ParesXPalabra:=ParesXPalabra+palabra[j]+palabra[l]+' ';
 end;
 
begin
  write('ingrese la palabra :');
  readln(Palabra);
  writeln;
  ParesPosibles:=ParesxPalabra(palabra);
  writeln('los pares posible son: ');
  writeln(ParesPosibles);
  readln;
end.
