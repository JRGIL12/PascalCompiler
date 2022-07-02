program Tipos; 

uses
  crt;


const
  max = 15;


type
  matriz = array [1..max, 1..max] of integer;
  // El mapa es guardado en un tipo de dato especial que lo llamamos matriz, la cual es un array de dos dimensiones de enteros que van del 1 al 15

  

var
  f, c, nminas, npistas, pista, vacio, mina, inicio, tesoro, y: integer;
  // Se guarda en forma de integer todo tipo de elemento que pueda aparacer en el mapa(minas, tesoro, punto de partida, etc)

  n: matriz;
  pistacion, modo, color, minacion, res, creacion, carga: string;
  // Todas las configuraciones las guardamos en modo de strings, en vez de numeros, hace que el codigo facil de entender y usar para el usuario

  
procedure HacerPista(
var
  i, j, k: integer);
  // Aqui se crean y escriben las pistas del mapa

  

const
  abc = 'ABCDEFGHIJKMNLOPQRSTUVWXYZ';
  // Constante para guardar el Abecedario

  

var
  prob: integer;
  Amarillo, Verde, Azul: string;


begin
  prob := random(3);
  // Se genera un numero aleatorio entre 0 al 2
  if (prob = 2) and (modo = 'SUPERVISOR') then
    begin
      textcolor(yellow);
      Amarillo := copy(abc, i, 1);
      // Dependiendo del valor generado, la pista sera de un color
      write(Amarillo);
      i := i + 1;
    end 
  else if (prob = 1) and (modo = 'SUPERVISOR') then
    begin
      textcolor(cyan);
      Azul := copy(abc, j, 1);
      write(Azul);
      j := j + 1;
    end 
  else if (prob = 0) and (modo = 'SUPERVISOR') then
    begin
      textcolor(10);
      Verde := copy(abc, k, 1);
      // Una vez que ya tiene el color, la escribe y avanza a la siguiente letra del Abecedario
      write(Verde);
      k := k + 1;
    end ;
  textcolor(white);
end;
procedure Imprimirmapa(
var
  n: matriz;
  f, c: integer);
  //Aqui se imprime el mapa del tesoro sobre a pantalla

  

var
  i, j, contaminas, cont, aux, o, p, q, h: integer;
  inicializacion, cambio: string;


begin
  inicializacion := 'SI';
  while (inicializacion = 'SI') do 
    begin
      cont := 1;
      //Inicializamos variables
      h := random(20);
      //Numero aleatoria que dicta la posicion del tesoro en el mapa
      o := 1;
      p := 1;
      q := 1;
      inicio := 1;
      tesoro := 0;
      aux := 0;
      contaminas := 0;
      writeln('Modo: ', modo);
      writeln('Dimensiones del Mapa: ', f, ' x ', c);
      if (modo = 'SUPERVISOR') then
        begin
          writeln('Cantidad de Pistas: ', npistas);
          writeln('Cantidad de Minas: ', nminas);
        end ;
      writeln;
      textcolor(cyan);
      writeln('Su color de pistas sera el ', color, '.');
      textcolor(white);
      for i := 1 to f do 
        begin
          write('| ');
          for j := 1 to c do 
            begin
              //El inicio se denota en el mapa con una 'I'
              if (inicio = 1) then
                begin
                  textcolor(magenta);
                  write('I');
                  textcolor(white);
                  inicio := inicio + 1;
                end 
              else if (tesoro = 0) and (cont = f * c - h) and (modo = 'SUPERVISOR') then
                // Debe estar en modo supervisor para poder ver el tesoro, se denota con un $
                begin
                  textcolor(lightred);
                  write('$');
                  textcolor(white);
                end 
              else if (n[i, j] = pista) and (aux < npistas) then
                begin
                  HacerPista(o, p, q);
                  //Proceso para crear las pistas
                  aux := aux + 1;
                  //Debe estar en modo supervisor, si el usuario quiere ver las minas
                  
                end 
              else if (contaminas < nminas) and (modo = 'SUPERVISOR') then
                // Se imprimen las minas si la minacion es aleatoria
                begin
                  textcolor(red);
                  write('*');
                  textcolor(white);
                  contaminas := contaminas + 1;
                end 
              else 
                begin
                  write(' ');
                end;
              write(' | ');
              cont := cont + 1;
            end;
          writeln;
        end;
      writeln('PUNTO DE PARTIDA');
      writeln('[1,1]');
      if (modo = 'JUGADOR') then
        begin
          repeat 
            writeln;
            textcolor(cyan);
            //El usuario puede pasar de modo jugador a supervisor si desea
            writeln('Desea pasar a modo supervisor?');
            textcolor(white);
            readln(cambio);
            cambio := upcase(cambio);
          until (cambio = 'SI') or (cambio = 'NO');
          if (cambio = 'SI') then
            begin
              modo := 'SUPERVISOR';
              imprimirmapa(n, f, c);
            end ;
        end ;
      repeat 
        textcolor(cyan);
        writeln('Desea incializar un nuevo mapa con los mismos parametros?');
        textcolor(white);
        readln(inicializacion);
        inicializacion := upcase(inicializacion);
      until (inicializacion = 'SI') or (inicializacion = 'NO');
    end;
end;
procedure llenarmapa(
var
  n: matriz;
  f, c: integer);
  //Aqui se genera y guarda el mapa del Tesoro

  

var
  i, j: integer;


begin
  for i := 1 to f do 
    begin
      for j := 1 to c do 
        begin
          n[i, j] := random(21);
          if (n[i, j] mod 2 = 0) then
            // Se usa un Indice que dicta que elemento aparecera en el mapa, por ejemplo, si el numero es divisible entre 2, entonces ese valor sera
            begin
              // Ocupado por una pista, por 3 y es una mina, por 5, sera un espacio vacio.
              n[i, j] := pista;
            end 
          else if (n[i, j] mod 3 = 0) then
            begin
              n[i, j] := mina;
            end 
          else if (n[i, j] mod 5 = 0) then
            begin
              n[i, j] := vacio;
            end
 end;
        end;
      imprimirmapa(n, f, c);
      // Despues de crearlo, con se usa la informacion para imprimirlo sobre la pantalla
      
    end;
  begin
    textcolor(white);
    writeln('Universidad Catolica Andres Bello');
    writeln('Ingenieria Informatica');
    writeln('Integrantes:');
    writeln('Juan Hedderich - Jesus Gil - Emiliano Albero - Luis Cabrera');
    writeln;
    textcolor(yellow);
    // Mensaje de Bienvenida
    write('BUSQUEDA ');
    textcolor(cyan);
    write('DEL ');
    textcolor(10);
    write('TESORO!');
    writeln;
    writeln;
    textcolor(white);
    writeln('Antes de empezar el juego, necesitamos que configure el juego a su gusto.');
    writeln('Empezemos con la configuracion.');
    writeln;
    textcolor(lightgray);
    writeln('Futuras configuraciones que va a tener el codigo(En Proceso)');
    // El juego no esta listo, pero aqui se listan varias configuariones que se le haran en el futuro(proxima entrega)
    writeln;
    writeln('COMPORTAMIENTO DE MINAS(las minas pueden ser fijas o en movimiento');
    writeln;
    writeln('VULNERABILIDAD(Puedes elegir ser invulnerable a las minas)');
    writeln;
    writeln('CORRIDA(El juego puede ser corrido de manera automatica o manual)');
    writeln;
    writeln('CAMINOS(Se podra seleccionar si se muestra un solo camino, todos o cuantos usted quiera)');
    writeln;
    textcolor(red);
    writeln('ADVERTENCIA');
    textcolor(white);
    writeln('El juego esta en modo DIFICIL, es decir, cuando este en modo JUGADOR,');
    writeln('el mapa tendra un relieve muy irregular, haciendo muy dificil la navegacion dentro de el!');
    writeln;
    textcolor(10);
    writeln('EMPEZEMOS CON EL JUEGO!');
    res := 'SI';
    while (res = 'SI') do 
      // Ciclo que mantiene el juego repitiendose, hasta que el usuario desee.
      begin
        writeln;
        textcolor(10);
        writeln('MODO DE JUEGO');
        writeln;
        repeat 
          textcolor(cyan);
          writeln('Como desea hacer la carga del Tesoro (MANUAL, ALEATORIA, o por ARCHIVO)?');
          // Se pide carga del mapa, ya sea aleatoria, manual o archivo
          textcolor(white);
          readln(carga);
          carga := upcase(carga);
        until (carga = 'MANUAL') or (carga = 'ALEATORIA') or (carga = 'ARCHIVO');
        repeat 
          textcolor(cyan);
          writeln('Desea jugar en modo SUPERVISOR o JUGADOR?');
          // Se pide el modo de usuario, SUPERVISOR o JUGADOR
          textcolor(white);
          readln(modo);
          modo := upcase(modo);
        until (modo = 'SUPERVISOR') or (modo = 'JUGADOR');
        if (carga = 'MANUAL') then
          begin
            writeln;
            textcolor(10);
            writeln('DIMENSIONES DEL MAPA');
            // Dimensiones del mapa
            writeln;
            repeat 
              textcolor(cyan);
              writeln('Desea que las dimensiones del mapa sean generadas de manera ALEATORIA o MANUAL?');
              textcolor(white);
              readln(creacion);
              creacion := upcase(creacion);
            until (creacion = 'ALEATORIA') or (creacion = 'MANUAL');
          end 
        else if (carga = 'ALEATORIA') then
          begin
            creacion := 'ALEATORIA';
          end ;
        if (creacion = 'MANUAL') then
          // Primero se pide al usuario las dimensiones del mapa.
          begin
            repeat 
              textcolor(cyan);
              writeln('Introduzca cantidad de filas: ');
              textcolor(white);
              readln(f);
              textcolor(cyan);
              writeln('Introduzca cantidad de columnas: ');
              textcolor(white);
              readln(c);
              if (f > max) or (c > max) then
                begin
                  textcolor(red);
                  writeln('ERROR, las dimensiones no pueden exceder de 15.');
                  writeln;
                end
               // Si las dimensiones no son adecuadas, se presentaran mensajes de error personalizados
              else if (f < 5) or (c < 5) then
                begin
                  textcolor(red);
                  writeln('ERROR, las dimensiones minimas son de 5.');
                  writeln;
                end ;
            until (f <= max) and (c <= max) and (f >= 5) and (c >= 5);
          end 
        else if (creacion = 'ALEATORIA') then
          begin
            repeat 
              f := random(16);
              // Si el usuario no introduce las dimensiones manuales, se generaran aleatoriamente.
              c := random(16);
              // Las dimensiones minimas para hacer un mapa es de 5 * 5.
              
            until (f >= 5) and (c >= 5);
          end ;
        if (carga = 'MANUAL') then
          begin
            writeln;
            textcolor(10);
            //Pedido de minas
            writeln('CREACION DE MINAS');
            writeln;
            repeat 
              textcolor(cyan);
              writeln('Desea que se generen las minas de manera ALEATORIA o MANUAL');
              textcolor(white);
              //Despues se piden otras configuraciones, como cantidad de minas
              readln(minacion);
              minacion := upcase(minacion);
            until (minacion = 'ALEATORIA') or (minacion = 'MANUAL');
          end 
        else if (carga = 'ALEATORIA') then
          begin
            minacion := 'ALEATORIA';
            repeat 
              nminas := random(21) - f;
            until (nminas >= 5) and (nminas <= f);
          end ;
        if (minacion = 'MANUAL') then
          begin
            textcolor(cyan);
            writeln('Cuantas MINAS desea introducir en el mapa(max ', f, ' minas)');
            textcolor(white);
            readln(nminas);
          end ;
        if (carga = 'MANUAL') then
          begin
            writeln;
            textcolor(10);
            writeln('CREACION DE PISTAS');
            // Pedido de Pistas
            writeln;
            repeat 
              textcolor(cyan);
              writeln('Desea que se generen las PISTAS de manera ALEATORIA o MANUAL');
              textcolor(white);
              //O cantidad de pistas
              readln(pistacion);
              pistacion := upcase(pistacion);
            until (pistacion = 'ALEATORIA') or (pistacion = 'MANUAL');
          end 
        else if (carga = 'ALEATORIA') then
          begin
            pistacion := 'ALEATORIA';
          end ;
        if (pistacion = 'MANUAL') then
          begin
            textcolor(cyan);
            writeln('Cuantas PISTAS desea introducir en el mapa(max ', f * c, ' pistas)');
            textcolor(white);
            readln(npistas);
          end 
        else 
          begin
            npistas := f * c;
          end;
        repeat 
          textcolor(cyan);
          writeln;
          //Luego se elije el color con el cual el usuario se va a guiar
          writeln('Con cual COLOR de pistas te vas a guiar(AMARILLO, VERDE, AZUL) o ALEATORIO?');
          textcolor(white);
          readln(color);
          color := upcase(color);
        until (color = 'AMARILLO') or (color = 'AZUL') or (color = 'VERDE') or (color = 'ALEATORIO');
        if (color = 'ALEATORIO') then
          begin
            y := random(2);
          end ;
        if (y = 0) then
          begin
            color := 'AMARILLO';
          end 
        else if (y = 1) then
          begin
            color := 'AZUL';
          end 
        else 
          begin
            color := 'VERDE';
          end;
        writeln;
        //Se llama el procedimiento para crear el mapa
        clrscr;
        writeln;
        llenarmapa(n, f, c);
        writeln;
        writeln('Desea jugar otra vez?');
        // Pregunta al usuario para jugar otra vez
        readln(res);
        writeln;
        res := upcase(res);
      end;
    textcolor(white);
    writeln('--------------------');
    write('|');
    textcolor(yellow);
    write('GRACIAS ');
    // Mensaje de despedida
    textcolor(cyan);
    write('POR ');
    textcolor(10);
    write('JUGAR!');
    textcolor(white);
    writeln('|');
    writeln('--------------------');
    readkey;
  end.
