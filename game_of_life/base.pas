    
Procedure updateLiving(var tab2 : arr; y, x, nbChild : Integer);
Begin
    if(nbChild = 2) OR (nbChild = 3) Then
    Begin
    	tab2[y, x] := 1;
    end
    Else
    Begin
    	tab2[y, x] := 0;
    end;
End;

Procedure updateDead(var tab2 : arr; y, x, nbChild : Integer);
Begin
    if(nbChild = 3) Then
    Begin
    	tab2[y, x] := 1;
    end
    Else
    Begin
    	tab2[y, x] := 0;
    end;
End;

Procedure printGrid(tab1 : arr);
var
    x, y: Integer;
    line : String;
Begin
	for y := 0 to height -1 do
	begin  
		line := '';
		for x := 0 to width -1 do
        begin  
            if(tab1[y, x] = 1) Then
            Begin
            	line += 'X';
            End
            Else
            Begin
            	line += ' ';
            end;
        End;
        gotoxy(2, y + 2);
        write(line);
	end;
end;

Procedure printBorder;
var
    x, y : Integer;
Begin
	for x := 1 to width do
	begin  
		gotoxy(x, 1);
		write('*');
		gotoxy(x, height + 2);
		write('*');
    end;
    for x := 1 to height + 2 do
	begin  
		gotoxy(1, x);
		write('*');
		gotoxy(width + 2, x);
		write('*');
    end;
end;

Procedure printOptions();
Begin
    gotoxy(10, 18);
    write('Options : ');
    gotoxy(10, 19);
    write('1 - Continuer');
    gotoxy(10, 20);
    write('2 - charger');
    gotoxy(10, 21);
    write('3 - sauvegarder');
    gotoxy(10, 22);
    write('4 - mode circulaire');
    gotoxy(10, 23);
    write('5 - mode normal');
    gotoxy(10, 24);
    write('6 - quitter');
    gotoxy(40, 18);
    write('Saisissez l option :');
end;

    Procedure save(var tab : arr);
    var
        s : String;
        y, x : Integer;
    begin
    AssignFile(MyFile, FILE_PATH);
 
    ReWrite(MyFile);
    append(MyFile);
    for y := 0 to height -1 do
    Begin     
        s := '';
		For x := 0 to width -1 do
            begin  
            s +=  intToStr(t1[y, x]);
            End;
        WriteLn(MyFile, s);
    End;
    CloseFile(MyFile);
end;

Procedure load(var tab : arr);
var
    s : String;
    y, x : Integer;
begin
	AssignFile(MyFile, FILE_PATH);
	reset(MyFile);
   
    for y := 0 to height -1 do
    Begin     
        readln(MyFile, s);
        for x := 1 to width do
        Begin   
        	tab[y , x - 1] := strToInt(s[x]);
        end;
    End;
    CloseFile(MyFile);
end;

Function askOption: Integer;
var
    c : Integer;
Begin
	 gotoxy(60, 18);
    write('  ');
    gotoxy(60, 18);
    read(c);
    askOption := c;
end;

Procedure loadGrid(var tab : arr);
begin
	load(tab);
	printGrid(tab);
end;

Procedure  saveGrid(var tab : arr);
begin
	save(tab);
	gotoxy(40, 19);
	write('Sauvegarde reussie!');
end;