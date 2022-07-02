program Ejercicio2; 

uses
  crt;


var
  N, aux, digito, digitoant: integer;
  incremental: boolean;
  seguir: char;


begin
  repeat 
    repeat 
      write('INTRODUZCA UN NUMERO POSITIVO = ');
      readln(N);
    until (N > 0);
    aux := N;
    digitoant := 9;
    incremental := true;
    while ((aux > 0) and incremental) do 
      begin
        digito := aux mod 10;
        if (digito > digitoant) then
          incremental := false  
        else 
          aux := aux div 10;
        digitoant := digito;
      end;
    if (incremental) then
      writeln('EL NUMERO ', N, ' ES INCREMENTAL')  
    else 
      writeln('EL NUMERO ', N, ' NO ES INCREMENTAL');
    writeln;
    writeln('Desea continuar con otro dato? Introduzca N si no lo desea');
    readln(seguir);
  until (upcase(seguir) = 'N');
  writeln('GRACIAS...');
  delay(2000);
end.
