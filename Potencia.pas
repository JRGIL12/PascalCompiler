program PruebaDePotencia;


function potencia(a,b: integer): integer;   (* Definimos la funcion *)
var
    i: integer;                      (* Locales: para bucles *)
    temporal: integer;               (* y para el valor temporal *)
begin
    temporal := 1;                    (* Inicializacion *)
    for i := 1 to b do
        temporal := temporal * a;     (* multiplicamos "b" veces por "a" *)
    potencia := temporal;             (* y finalmente devolvemos el valor *)
end;


var
    numero1, numero2: integer;

begin                                (* Cuerpo del programa *)
    writeLn('Potencia de un numero entero');
    writeLn;
    writeLn('Introduce el primer numero');
    readLn( numero1 );
    writeLn('Introduce el segundo numero');
    readLn( numero2 );
    writeLn( numero1 ,' elevado a ', numero2 ,' vale ',
        potencia (numero1, numero2) )
end. 
