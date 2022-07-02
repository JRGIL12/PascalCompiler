Program EJERCICIO1;
uses crt;

var
   afirma: string;
   i, x, n, contador : integer;

BEGIN

  REPEAT
    repeat
        write ('Introduzca un valor positivo = ');
        readln (n);
    until (n > 0);

    X := 1;
    Contador := n;

    while (contador > 0) do
    begin
       For i:= 1 to contador do
       begin
               Write (x mod 10, ' ');
               X := x + 1;
       end;
       X := x - 2;

       if (contador > 0) then
       begin
          Writeln;
          For i:= 1 to contador-1 do
          begin
               Write (x mod 10, ' ');
               X := x - 1;
          end;
          X := x + 2;
          Writeln;
       end;
       Contador := contador - 2;

    end;
    writeln('Desea ingresar otro n',chr(163),'mero?');
    write('Indique NO para salir y cualquier otra cosa para seguir = ');
    readln(afirma);

  UNTIL(UPCASE(afirma)='NO');
  readkey;
END.
