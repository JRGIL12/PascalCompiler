Program Taller;
uses crt;
const
 max = 10;
type
 vector = array [1..20] of integer;
 matriz = array [1..max, 1..max] of integer;
var
 opciones: string;
 A: vector;
 n: integer;
 c: matriz;
 
procedure Bienvenida; //(trashcode) mensaje de indentificacion
begin
 textcolor(white);
 writeln('Universidad Catolica Andres Bello');
 writeln('Ingenieria Informatica');
 writeln('Integrantes:');
 writeln('Jesus Gil - Juan Hedderich - Luis Cabrera');
 writeln(' ');
end;

procedure dimenciones(var n: Integer);
begin
 Repeat // Cantidad de elementos y verificar si la cantidad es aceptable
  writeln();
  write ('Por favor introduzca las dimenciones a trabajar (entre 0 y 10) = ');
  readln (n);
  writeln('');
 until ((n > 0) and (n <= max));
end;

procedure llenado(var aleatorio:boolean); 
var
mdl: string;//modo de llenar
begin
 aleatorio:=true;
 writeln(' por defecto entro en el modo de creacion aleatorio y se inicializa como tal');
 writeln();
 writeln(' ingrese Manual para cambiar a creacion manual o otro para continuar :');
 readln(Mdl); 
 writeln();  
 Mdl := upcase(Mdl); 
 if (Mdl= 'MANUAL') then //modo manual
  aleatorio:= false;
end;

procedure llenarv (var A:vector; n:integer); //llena el vector de forma aleatoria 
var
 i: integer;
 aleatorio: boolean;
begin
 llenado(aleatorio);
 if (aleatorio = true) then
  begin
   randomize; //asegura que el numero 'random' se distinto en cada corrida
   for i := 1 to n do //recorre las posiciones del vector 
    A[i] := random (15); //genera un numero alzar en el rango
  end
 else
  begin
   write('A: ');
   for i := 1 to n do //ciclo para llenar casillas del vector
    begin
     Repeat
      write(' ');
      read(A[i]);
      if (A[i]<0) then // si el dato es menor que 0 lo muestra como invalido
       write(' EL valor ',A[i],' es invalido ');
     until (A[i]>=0) // en caso de que un dato sea invalido lo ignora
    end;
  end;
end;

procedure llenarm (var C:matriz; n:integer); //llenar matriz
var
i,j:integer;
aleatorio:boolean;
begin
 llenado(aleatorio);
 if (aleatorio = true) then
  begin
   randomize; 
   for j := 1 to n do //recorre las columnas 
    for i := 1 to n do //recorre las filas 
     C[j,i] := random (50);
  end
 else
  begin
   for j := 1 to n do
    begin
     for i := 1 to n do 
      begin
       Repeat
        read(C[i,j]);
        if (C[j,i] <0) then // si el dato es menor que 0 lo muestra como invalido
         writeln(' EL valor ',C[i,j],' es invalido (debe ser mayor que 0 ');
       until (C[j,i]>=0) // en caso de que un dato sea invalido lo ignora
      end;
     writeln();
    end;
  end;
end;

procedure imprimirv (A:vector; n:integer); //imprime el vector
var
 i: integer;
begin
 for i := 1 to n do //recorre las posiciones del vector
    write(A[i], ' | '); //imprime la posicion i del vector
 writeln;
end;

procedure rotacion (var A:vector; n:integer); //rota los valores dentro del vector e imprime
var
 i, j, x, rotar:integer;
begin
 write('Indique la cantidad de rotaciones que debe hacer el vector ');
 readln(x);
 writeln();
 for j:=1 to x do 
    begin
     rotar:= A[n]; //almacena el último valor del vector
     for i := n downto 1 do //lee el vector de derecha a izquierda
         A[i+1]:=A[i]; //rota las posiciones del vector en 1
     A[1]:= rotar;// modifica el valor no rotado
     imprimirv(A,n);
     writeln();
    end;
end;

procedure ImprimirM(C:matriz; n:integer);
var
i,j:integer;
begin
for i := 1 to n do
 begin
  for j := 1 to n do
   write (C[i,j]:3, '|');
   writeln();
 end;
end;

function peculiar (C:matriz; n:integer) :vector;
var
i,l,j,fli,cli,fld,cld,aux:integer; 
multiplo,divisor: boolean;
begin
 multiplo:=true;
 i:=1;
 l:=0;
 for j:=n downto 1 do
  begin
   l:=l+1;
   if (multiplo=false) then
    begin
     peculiar[i]:=0;
     i:=i+1;
     peculiar[i]:=0;
    end
   else
    begin
     if (l mod 2<> 0) then
      peculiar[l]:=C[j,l]; //copiamos de la diagonal
     divisor:=false;
     fli:=n; //fila lateral izquierda
     cli:=0; //columna lateral izquierda
     fld:=1; //fila lateral derecha
     cld:=n+1; //columna lateral derecha
     while (divisor=false) and (fli >1) do
      begin
       fli:=fli-1;
       cli:=cli+1;
       if(peculiar[i] mod C[fli,cli] = 0)then
        begin
         divisor:=true;
         aux:=C[fli,cli];
        end;
      end;
     while (divisor=false) and (cld >1) do
      begin
       fld:=fld+1;
       cld:=cld-1;
       if (peculiar [i] > 0) and (C[fld,cld] >0) then
        if(peculiar[i] mod C[fld,cld] = 0)then
         begin
          divisor:=true;
          aux:=C[fld,cld];
         end;
      end;
     i:=i+1;
     if divisor=true then
      peculiar[i]:=aux
     else
     multiplo:=false;
    end;
   i:=i+1
  end;
end;

BEGIN //Programa Principal
 Bienvenida; 
 Repeat
  Writeln('Taller 2');
  writeln('');
  writeln('-R1: Rotacion (proceso rotacion)');
  writeln('-R2: peculiar (funcion peculiar)');
  readln (opciones);
  opciones:=upcase(opciones);
  
  if (opciones='R1') then
   begin
    dimenciones(n); 
    llenarv (A, n );
    writeln ('EL VECTOR A ES: ');
    imprimirv (A,n); 
    writeln();
    rotacion (A,n); // rotacion
    writeln('');
   end;
   
  if (opciones='R2') then
   begin
   dimenciones(n);
   llenarm (C,n);
   writeln();
   imprimirM(C,n);
   writeln('B= ');
   imprimirv(peculiar(C,n),n*2);
   end;
   
  if (opciones <> 'SALIR') then
   begin
    writeln('Para finalizar ingrese Salir (caso contratio se volvera al menu)');
    readln (opciones);
    clrscr;
   end
   
 until (upcase(opciones) = 'SALIR');
 writeln ('HASTA LUEGO........');
 delay (1500);
END.
