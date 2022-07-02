program ParesXPalabrasxFrase;
{
  4. Desarrolle un programa que genere y muestre todas las posibles parejas de caracteres por palabra en un texto T que introduce el usuario. Las parejas se realizan combinando cada carácter de la palabra con los caracteres siguientes de la misma. Se asumirá que cada palabra se distingue de otra porque están separadas por uno o más espacios en blanco. La salida debe quedar en un string S. No debe modificarse el string de entrada T y en S cada combinación debe estar separada por un sólo espacio en blanco.

Ejemplo:

Entrada : T = LAS LEYES DEL PAIS

Salida: S = LA LS LE LY LE LS EY EE ES YE YS ES DE DL EL PAPI PS AI AS IS

NOTA: T es un string y sólo se permitirá el uso de length y concatenación.

Profesora Gloria Tarrio
 }
 var
 T,S, palabra: string;
 
function ParesXPalabra(Palabra:String):string;
 var 
 j,l{ variables control}:integer;
 begin
 for j:=1 to length(palabra) do
    for l:=1 to length (palabra) do
      If J<>l then
        ParesXPalabra:=ParesXPalabra+palabra[j]+palabra[l]+' ';
 end;

function PalabraxFrases (frase:string):string;
 var
 i,j{variables control}: integer;
 begin
  j:=1;
  for i:=1 to length (frase) do
    If Frase[i]=' ' then
      begin
        palabra:=copy(frase,j,I-1);
        j:=i+1;
        PalabraxFrases:=PalabraxFrases+ParesXPalabra(Palabra);
      end;
 end;
 
Begin
  Write('T: ');
  Readln(T);
  writeln;

  S:=PalabraxFrases(T);
  writeln(S);     
  readln;
End.
