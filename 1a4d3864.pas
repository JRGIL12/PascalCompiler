program manejarString;
var
  frase: string;
  numero, i:longint;
  
  
 procedure contarLetra(frase: string);
 var
   control,contador, posicion: integer;
   letra: char;
   
 begin
   control:=1;
   repeat 
       letra:= frase[control]; contador:=0;
       if letra <> ' ' then
           begin
              repeat
                  posicion:= pos(letra,frase);
                  if posicion <> 0 then
                     begin
                        contador:=contador+1; 
                        delete(frase,posicion,1);
                     end;
              until posicion=0;
              write(letra,'=',contador,' ');
           end
       else
          control:=control+1;
          
    until control>length(frase);      

 
 end;
 
 function contarDigitos(numero:longint):integer;
   var
     contador:integer;
   begin
      contador:=0;
      while numero <> 0 do
         begin
            contador:=contador+1;
            numero:=numero div 10;
         end;
     contarDigitos:= contador;   
   end;
     

function digitoMenor(numero:longint): integer;
 var 
   menor,digito: integer;
 begin
    menor:=99;
    while numero <> 0 do
       begin
          digito:= numero mod 10;
          if digito < menor then 
             menor:= digito;
          numero:=numero div 10;     
       end;
    digitoMenor:= menor;
 
 end;
   

 procedure multiplicaDigi(numero:longint);
   var
     multi,digito,totaldigitos: longint;
     resultado: real;
     
   begin
     multi:=1; totaldigitos:= contarDigitos(numero);
     while numero <> 0 do
        begin
           digito:= numero mod 10;
           multi:= multi * digito;
           numero:=numero div 10;
        end;
    
     resultado:= multi/totaldigitos;
     writeln('La multiplicación de los dígitos entre el total de dígitos es: ', resultado :2 :2);
   
   end;
     

 begin
  { writeln('Indica frase: ');
   readln(frase);
   frase:=upcase(frase);
   contarLetra(frase);
   writeln;}
   writeln('Indica número a procesar: ');
   readln(numero);
   writeln('Cantidad de dígitos del número es: ', contarDigitos(numero));
   writeln('El menor dígito del número es: ', digitoMenor(numero));
   multiplicaDigi(numero); 
   repeat
     writeln('Indica posicion i cuyo dígito deseas conocer: ');
     readln(i);
     if i > contarDigitos(numero) then
        writeln('Error la posición i supera la cantidad de dígitos del número ');
   until i<=  contarDigitos(numero);        
    
 
 
 end.

