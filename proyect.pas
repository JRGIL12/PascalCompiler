program Ejercicio1; 

var
  N, aux, digito, digitoant: integer;


begin
  repeat 
    write('INTRODUZCA UN NUMERO POSITIVO = ');
    readln(N);
  until (N > 0);
  aux := N;
  digitoant := 9;
  digito := aux mod 10;
  while ((aux > 0) and (digito <= digitoant)) do 
    begin
      digitoant := digito;
      digito := aux mod 10;
      aux := aux div 10;
    end;
  if (aux > 0) then
    writeln('EL NUMERO ', N, ' NO ES INCREMENTAL')  
  else 
    writeln('EL NUMERO ', N, ' ES INCREMENTAL');
  readln;
end.
