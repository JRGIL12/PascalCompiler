program noDividirEntreCero2; 

var
  dividendo, divisor: integer;


begin
  write('Dime el dividendo: ');
  readln(dividendo);
  write('Dime el divisor: ');
  divisor := 1;
  while divisor = 0 do 
    begin
      write('No debe ser 0. Dimelo otra vez: ');
      readln(divisor);
    end;
  writeLn('La división es ', dividendo / divisor);
  readln;
end.