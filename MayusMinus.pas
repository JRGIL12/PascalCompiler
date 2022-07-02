program MayusculasMinisculas; 
{
const 
  Mayus ='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Minus = 'abcdefghijklmnopkrstuvwxyz';
}
var
  Frase: String;
  I,ContMayus, ContMinus: Integer;
  
begin
  repeat 
    //leemos palabra que es lo que ingresa el usuario
    Frase:=' ';
    write('ingrese la palabra a evaluar: ');
    readln(Frase);
    ContMayus:=0;
    ContMinus:=0;
    writeln;
    If Length(Frase)=0 then 
      WriteLn('palabra se encuentra vacia, por favor ingrese una palabra')
      //evaluamos la palabra
     Else
      WriteLn(' la palabra ingresada es:', Frase);
      //la imprimimos

  Until ( Length(Frase) <> 0 );
  For I:=1 to Length(frase)  do
  // tomamos los caracteres de la palabra con un ciclo
    begin
      IF( Frase[I] in [ 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'] )then
       ContMayus:= ContMayus+1
     { else
        IF( Frase[I] in [ 'a'..'z' ] )then
        ContMinus= ContMinus+1;}
    end;
  Writeln(' La cantidad de letras mayusculas es ',ContMayus);
  Writeln(' La cantidad de letras minusculas es ',ContMinus);
End.
