{
 Dado un archivo tipo texto A que contiene enteros,
 se pide desarrollar un programa que seleccione
 los pares e impares que contenga el archivo A y
 genere dos archivos B y C, uno que contenga los 
 numeros pares (B) y otro con los numeros impares (C).
  Ejemplo:
  A = |1 | 5 | 3 | 2 | 2 | 5 | 7 | 2 | 8 |
  B = |2 | 2 | 2 | 8 |
  C = |1 | 5 | 3 | 5 | 7 | 
 
 Requerimento:
  No se permite utilizar estructuras auxiliares,tales como arreglos.
}
program Archivos_Pares_e_Impares;

Var A, B, C:text;
  //Declaramos los archivos

Procedure Asignar (var A:text);
 var
  arch:string;
  
 begin write ('Ingrese la Ruta y el Archivo: ');
  readln (arch);
  assign (A, arch);
     //assignammos los archivos logicos(variables) a los fisicos
 end;

Procedure Par_Impar (Var A,B,C: text);
 var
    x:integer;
 begin
    while (not EOF (A)) do
         //Mientras no sea fin de archivo
            begin
                readln (A, x);
                 //Leemos en la linea del archivo
                If ((x mod 2) = 0) then
                    writeln (B, x)
                      //Si es Par lo escrbimos en B
                else
                    writeln (C, x);
                      // si es impar lo escribimos en C
            end;
 end;
 
Begin  //programa principal
  Asignar (A);
  Asignar (B);
  Asignar (C);
  
    //desactivamos los parametros de error
  reset(A);
  
    //activamos los parametros desactivados
  //if (IOResult <> 0) then
   // writeln ('El archivo no existe')
//  else
    begin
        rewrite (B);
         //abre o crea el archivo B
        rewrite (C);
         //abre o crea el archivo C
        Par_Impar(A,B,C);
        close(A);
         //Cerramos el archivo A para evitar dañarlo
        Close (B);
          //Cerramos el archivo B para evitar dañarlo
        Close (C);
         //Cerramos el archivo C para evitar dañarlo
    end;
  readln();
End.
