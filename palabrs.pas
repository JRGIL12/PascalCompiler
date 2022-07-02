program p1;
uses crt;
var
    Texto1,Texto2,Texto3,pal1,pal2,pal3: string;
    i,j,k:integer;
BEGIN
    Texto1:= 'LA CASA ES GRANDE Y BONITA';
    Texto2:= 'EL CAMPO ES BELLO';
    Texto3:= '';
    i:= 1; j:= 1; pal1:= ''; pal2:= ''; pal3:= '';
    while (i <= length(Texto1)) and (j<= length(Texto2)) do
    begin
        if (Texto1[i] <> ' ') then
            pal1:= pal1 + Texto1[i]
        else
        begin
            while (Texto2[j] <> ' ') do
            begin
               pal2:= pal2 + Texto2[j];
               j:= j + 1;
            end;
            j:= j + 1;
            for k:= 1 to length(pal1) do
            begin
                if (POS(pal1[k], pal2) <> 0) and (POS(pal1[k], pal3) = 0) then
                    pal3:= pal3 + pal1[k];
            end;
            Texto3:=Texto3 + pal3 + ' ';
            pal1:= ''; pal2:=''; pal3:='';
        end;
        i:= i + 1;
    end;
    if (i <> j) then
    begin
        if (i <= length(Texto1)) then
            while (Texto1[i] <> ' ') and (i <= length(Texto1)) do
            begin
                pal1:= pal1 + Texto1[i];
                i:= i + 1;
            end
        else if (j <= length(Texto2)) then
            while (Texto2[j] <> ' ') and (j <= length(Texto2)) do
            begin
                pal2:= pal2 + Texto2[j];
                j:= j + 1;
            end;
        for k:= 1 to length(pal1) do
        begin
            if (POS(pal1[k], pal2) <> 0) and (POS(pal1[k], pal3) = 0) then
                pal3:= pal3 + pal1[k];
        end;
        Texto3:=Texto3 + pal3;
    end;
    writeln(Texto3);
    readkey;
END.
