{
Definiremos como número de dígitos incrementales a todo 
número natural N tal que N = dm dm-1 ... d1 d0 siendo di+1 
≤ di para 0 ≤ i < m.
Por ejemplo:
13357, 267, 889, 555, 14, son números de dígitos incrementales;
1433, 2517, 771 no lo son.
Desarrolla un programa que determine si un número 
natural N es de dígitos incrementales.

Requerimento:
El número debe tratarse como un entero, no como un string.
}
program Ejercicio1; 

var
  N, Aux, Digito, DigitoAnt: integer;


begin
  repeat 
    write('INTRODUZCA UN NUMERO POSITIVO = ');
    readln(N);
    //leemos N    
  until (N > 0);
  Aux := N;
  // inicializamos Aux en el valor de  N
  DigitoAnt := 9;
  // inicializamos DigitoAnt en 9
  Digito := Aux mod 10;
  //inicializamos Digito en el ultimo Digito de Aux
  while ((Aux > 0) and (Digito <= DigitoAnt)) do 
    // el ciclo Termina  A) si Aux =< 0  B) Digito > DigitoAnt
    begin
      DigitoAnt := Digito;
      //inicializamos DigitoAnt en el valor de digito
      Digito := Aux mod 10;
      //inicializamos Digito en el ultimo Digito de Aux
      Aux := Aux div 10;
      //inicializamos Aux en Aux excluyendo su ultimo digito.
      // Ej; Aux(123) & Aux Div 10 (12)      
    end;
  if (Aux > 0) then
    //Caso A (Existe un digito mayor a su digito Anterior)
    writeln('EL NUMERO ', N, ' NO ES INCREMENTAL')  
  else 
    //Caso B (Todos los Digitos cumplen ser menores que el siguiente )
    writeln('EL NUMERO ', N, ' ES INCREMENTAL');
  readln;
end.
