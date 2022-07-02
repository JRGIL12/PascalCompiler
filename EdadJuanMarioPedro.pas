program EdadJuanMarioPedro; 

var
  EJ, EM, EP: integer;


begin
  WriteLn(' ingrese la edad de Juan');
  ReadLn(EJ);
  WriteLn(' Ingrese la edad de Mario ');
  ReadLn(EM);
  WriteLn(' Ingrese la edad de Pedro');
  ReadLn(EP);
  WriteLn('');
  // se examina quien es contemporáneo
  if ((EJ = EM) and (EJ <> EP)) then
    Write(' Juan es contemporáneo con Mario') ;
  if ((EM <> EJ) and (EM = EP)) then
    Write(', Mario >es contemporáneo con Pedro') ;
  if ((EP <> EM) and (EP = EJ)) then
    Write(', Pedro es contemporáneo con Juan ') ;
  if ((EP = EM) and (EP = EJ)) then
    WriteLn(' Mario, juan y pedro son contemporáneos') ;
  if ((EJ <> EM) and (EJ <> EP) and (EM <> EP)) then
    Write(' Ninguno de ellos es contemporáneo') ;
  readln;
end.
