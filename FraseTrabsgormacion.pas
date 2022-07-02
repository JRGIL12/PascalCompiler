program FraseTrabsgormacion;

var
  Frase: String;
  I{Variable control}:integer;
  
begin
  Repeat
    Frase:='';
    write('ingrese la palabra a transformar: ');
    readln(Frase);  
    writeln;
    If Length(Frase)=0 then 
      WriteLn('palabra se encuentra vacia, por favor ingrese una palabra')
      //evaluamos que la frase no este vacia
     Else
      For I:=1 to Length(frase)  do
        // tomamos los caracteres de la palabra con un ciclo
        IF( Frase[I] in [ '0','1','2','3','4','5','6','7','8','9'] )then
          begin
            WriteLn('la variable tiene un numero, no es valida');
            //validamos segun instrucciones
            frase:='';
            writeln;
          end;
  Until ( Length(Frase) <> 0 );
   // introducción de datos y primera condición de validación

  For I:=1 to Length(frase)  do
    // tomamos los caracteres de la palabra con un ciclo nuevamente
    IF( Frase[I] in ['a'] )then
        frase[I]:='*'
      else
        IF( Frase[I] in ['s'] )then
          frase[I]:='!';
   // segunda condición sustitución

  while Pos('que', Frase) > 0 do
    Delete(frase,Pos('que', Frase),3);
  // en caso de existir uno o mas 'que' se eliminan

  while Pos('el', Frase) > 0 do
    Delete(frase,Pos('el', Frase),2);
  //se repite el proceso de eliminación
    
 writeln(' la frase queda: ');
 writeln(' ',frase);
 // imprimir el resultado
end.
