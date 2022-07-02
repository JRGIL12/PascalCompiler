program Letras;

var
frase,Letra{auxiliar para cada letra},aux,utilizadas{auxiliar donde se almacenan las letras utilizadas}: string;
i,j{variables control},c{contador de letra}:integer;

begin
 writeln('Frase: ');
 readln(frase);
 aux:=frase;
 utilizadas:=' ';
   For I:=1 to length(frase) do
      begin
        Letra:= upcase(Frase[i]);
        if pos(letra,utilizadas)=0 then
         begin
           c:=0;
           For j:=1 to length(frase) do
             begin
                if  upcase(aux[j])=letra then
                     begin
                              c:=c+1;
                              aux[j]:=' ';
                     end;
             end;
        utilizadas:=utilizadas+letra;
        Writeln(letra,': ',c);
        end;
      end;
  readln;
end.