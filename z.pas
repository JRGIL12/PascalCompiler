{
 A partir de dos enteros positivos X e Y, se genera un tercer número Z que
 contiene solamente los dígitos de Y que se encuentran en la posición
 indicada en los dígitos de X. Para tomar en cuenta la posición se toma la
 posición de la representación decimal del número, es decir, para un
 número con n dígitos expresado como
 dndn-1.....d2d1do siendo i >= 0 y i <n, i representa la posición del dígito. 
 Si la posición indicada en X no se encuentra en Y, se asume el dígito cero.
 Se pide que desarrolles un programa que dados dos números X e Y, se genere Z.
 Ejemplos:
    x= 3524 & y=486951 :z=6498;
    x=19620 & y=153894 :z=90084;
    x=205 & y=15023 :z=30;

 Requerimento:
    Debes manejar N como número entero, no como string. No se permite convertirlos a string.
}
program Ejercicio3; 

uses
  crt;


var
  x, y, z, posi, cont, auxy, potencia, aux: integer;
  encontrada: boolean;
  seguir: char;


begin
  repeat 
    repeat 
      // lee x
      write('INTRODUZCA UN NUMERO POSITIVO X = ');
      readln(x);
    until (x > 0);
    repeat 
      //lee y
      write('INTRODUZCA UN NUMERO POSITIVO Y = ');
      readln(y);
    until (y > 0);
    z := 0;
    //calculamos la potencia de 10 de x
    potencia := 1;
    aux := x;
    while (aux > 9) do 
      begin
        aux := aux div 10;
        potencia := potencia * 10;
      end;
    while (potencia > 0) do 
      begin
        posi := x div potencia;
        cont := 0;
        auxy := y;
        encontrada := false;
        while ((not (encontrada)) and (auxy > 0)) do 
          begin
            if (cont = posi) then
              begin
                z := z * 10 + (auxy mod 10);
                encontrada := true;
              end ;
            cont := cont + 1;
            auxy := auxy div 10;
          end;
        if (not (encontrada)) then
          z := z * 10 ;
        x := x mod potencia;
        potencia := potencia div 10;
      end;
    writeln('EL NUMERO RESULTANTE Z ES = ', z);
    writeln;
    writeln('Desea continuar con otro dato? Introduzca N si no lo desea');
    readln(seguir);
  until (upcase(seguir) = 'N');
  writeln('GRACIAS...');
  delay(2000);
end.
