program Numero_opcion_LS6;

var
Num:int64;
opcion:byte;
Salir:boolean;

Procedure menu(var Salir:boolean; var opcion:byte );
begin
 Writeln('****************************');
 writeln('Eliga una de las siguientes opciones');
 WriteLn;
 writeln(' 1. Suma de los digitos del número a ingresar');
 writeln(' 2. Diferencia entre el factorial del primer digto y factorial del último');
 writeln(' 3. Numeros pares a partir de 2 hasta d2+(dn-1) ');
 writeln(' 4. verificar si el número es mltiplo de 4 y todos sus digitos son pares');
 writeln;
 writeln('  ingrese 0 para finalizar ');
 repeat
  readln(opcion);
  Salir:=(opcion=0);
  if (opcion>4) or (opcion<0) then
    writeln('por favor ingrese una opción valida');
 until (opcion>=0)and (opcion<5);
end;

procedure LeerNum(var Num: int64; opcion:byte;);
begin
 writeln(' Ingrese el valor del numero a evaluar');
 readln(Num);
 if opcion<>1 then
  num:=num;
end;

function SumaDigitos(Num:int64):int64;
var
 aux: int64;
begin
 aux:=0;
 while (Num>0) do
  begin
    aux:=aux+( Num mod 10);
    Num:=Num div 10;
  end;
 SumaDigitos:=aux;
end;

function Factorial(var Num:int64):int64;
var 
n:integer;
temporal:int64; 
//int64 ya que factorial es un numeor exponencial
begin
 Temporal:=Num;
 n:=Num;
 while n>1 do
  begin
    n:=n-1;
    temporal:=temporal*n;
  end;
  Num:=temporal;
end;
function Diferencia_Digitos_factorial(Num:int64):int64;
var
PD,UD{ Primer/Utimo digito}: int64;
begin
 PD:= Num mod 10;
 while Num>9 do
  begin
    Num:=Num div 10;
    Ud:= Num;
  end;
 Diferencia_Digitos_factorial:=( Factorial(PD)-Factorial(UD) );
end;

Begin
 opcion:=5;
 salir:=false;
  Repeat
  menu(salir,opcion);
  case opcion of
   1:
    begin
     LeerNum(Num,opcion);
     writeln(' la suma de los digitos de ',Num,' es ', SumaDigitos(Num));
    end;
   2:
    begin
    LeerNum(Num,opcion);
    //validar
    write(' la diferencia del factorial del primer y último número es: ');
    writeln( Diferencia_Digitos_factorial(Num) );
    end;
  end;
  
  until(salir=true);
 writeln(' enter para salir');
 readln;
End.
{JR.G}
