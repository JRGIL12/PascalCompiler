program ParesCartesianos;
{
  Dados dos números (cuya cantidad de dígitos es desconocida) imprimir los pares cartesianos de los
mismos. Ejemplos:
- Para 1234 y 234, sus pares cartesianos son: (1,2),(1,3),(1,4),(2,2),(2,3),(2,4),
(3,2),(3,3),(3,4),(4,2),(4,3),(4,4).
- Para 13 y 98, sus pares cartesianos son: (1,9),(1,8),(3,9),(3,8)
- Para 567 y 25, sus pares cartesianos son: (5,2),(5,5), (6,2),(6,5), (7,2),(7,5)
Observación: No importa el orden de los pares, es decir, puedes empezar a combinar desde los últimos
dígitos. Ejemplo: 123 y 45 serían: (3,5),(3,4), (2,5),(2,4), (1,5),(1,4). Recuerda el algoritmo para
separar un número en dígitos dado en clase.
}

var
  x,y,auxX, auxY, AuxY2:integer;
  // para no complicar el programa se usaran 2 auxiliares

begin
  writeln (' ingrese el primer par a evaluar X');
  readln(x);
  writeln (' ingrese el primer par a evaluar Y');
  readln(Y);
  // lectura de datos
  writeln(' los pares cartesianos de x: ',x,' Y: ',y,' son :');
  //se escribe antes de las instrucciones para no tener que conservar el valor d x o Y
  while (X<> 0 ) do
  // entramos en ciclos para descomponer los dígitos
    begin
      AuxX:= X mod 10;
      // tomamos el último digito se X ya que no importa el orden
      x:= x div 10;
      // eliminamos el número tomado para no generar un ciclo infinito
      AuxY2:=Y;
      // inicializamos la variable en auxY2 por que al finalizar el siguiente ciclo esta quedara en 0
      writeln('');
      // por estetica se agrega una linea 
      while (Auxy2<> 0) do
      // se repite el proceso anterior
        begin
           AuxY:= AuxY2 mod 10;
           AuxY2:= AuxY2 div 10;
           // comenzamos a imprimir los pares
           write(' (', AuxX,',',AuxY,') ');
        end;
    end;
  readln;
// Jr Gil
end.
