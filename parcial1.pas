program Supervisar; 

uses
  crt;


var
  p, a: String;
  i, j, s: integer;
  salida: Boolean;


begin
  repeat 
    //leemos p que es lo principal
    write('p: ');
    readln(p);
    writeln;
    if p <> 'fin' then
      begin
        //a es el abecedario
        a := 'abcdefghijklmnopkrstuvwxyz';
        //v es vocales;
        s := 0;
        //primera condición
        for i := 1 to length(a) do 
          for j := 1 to Length(p) do 
            begin
              if (a[i] = p[j]) then
                s := s + 1 ;
              //segunda condición
              for i := 1 to length(v) do 
                for j := 1 to Length(p) do 
                  begin
                    if (v[i] = p[j]) then
                      end ;
                    if s = Length(p) then
                      writeln('es aceptable')  
                    else 
                      writeln('no es aceptable');
                    writeln;
                  endelse writeln('Gracias...');
              delay(500);
              until p = 'fin';
            end;
            end;
end.
 
