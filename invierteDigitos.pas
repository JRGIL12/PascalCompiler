program invierteDigitos; 

var
  N, S: integer;


begin
  writeln('Dado un entero positivo N de 2 digitos se intercambiaran el primer y ultimo digito');
  writeln(' ');
  write('Ingrese el valor de N: ');
  readln(N);
  if ((N >= 100) or (N < 10)) then
    WriteLn(' el numero no tiene dos dígitos')  
  else 
    begin
      S := (N mod 10 * 10) + N div 10;
      write(' el numero invertido es ');
      if S<10 then
        write('0');
      write(S);
    end;
  readln;
end.
