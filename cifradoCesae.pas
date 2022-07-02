program cesarfrase; 


procedure desplazamiento( var frase: string; var  n: integer); 
  var 
    pos, cont: integer;

begin
  for cont := 1 to length(frase) do 
    begin
      pos := ord(frase[cont]);
      if (pos >= 65) and (pos <= (90 - n)) or (pos >= 97) and (pos <= (122 - n)) then
        begin
          pos := pos + n;
          write(chr(pos));
        end ;
    end;
end;

var
  frase: string;
  n: integer;

Begin //programa principal
  writeln('Introduzca la frase acabada en punto');
  readln(frase);
  writeln('Introduzca un desplazamiento');
  readln(n);
  desplazamiento(frase, n);
End.
