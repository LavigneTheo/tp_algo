(*
 *  Met … jours une cellule vivante au tours courant. Selon le nombre de nadjacentes vivantes 
 *  insŠre 1 ou 0 dans le tableau du prochain tours.
 *)
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

(*
 *  Met … jours une cellule morte au tours courant. Selon le nombre de adjacentes vivantes 
 *  insŠre 1 ou 0 dans le tableau du prochain tours.
 *)
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

(*
 *  Imprime le tableau du tours cours courant … l'‚cran.
 *  Pour des raisons d'optimisations, le tableau est imprim‚ ligne par ligne. Chaque index du tableau est concat‚n‚
 *  dans une chaine caractŠre qui est ensuite imprim‚ … l'ecran.
 *)
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

(*
 *  Imprime le contours de l'‚cran.
 *)
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

(*
 *  Passe le jeu en mode circulaire. Ecris … l'ecran que le mode courant est "circulaire".
 *)
Procedure switchToCircularMode(var circu : Boolean);
begin
	circu := TRUE;
	gotoxy(40, 19);
    write('Mode : circulaire               ');
end;

(*
 *  Passe le jeu en mode normal. Ecris … l'ecran que le mode courant est "normal".
 *)
Procedure switchToNormalMode(var circu : Boolean);
begin
	circu := FALSE;
	gotoxy(40, 19);
    write('Mode : normal                  ');
end;

(*
 *  Imprime les options utilisablent par l'utilisateur.
 *)
Procedure printOptions();
Begin
    gotoxy(10, 18);
    write('Options : ');
    gotoxy(10, 19);
    write('1 - Continuer (100 tours)');
    gotoxy(10, 20);
    write('2 - charger');
    gotoxy(10, 21);
    write('3 - sauvegarder');
    gotoxy(10, 22);
    write('4 - mode circulaire');
    gotoxy(10, 23);
    write('5 - mode normal');
    gotoxy(10, 24);
    write('6 - Generer grille');
    gotoxy(10, 25);
    write('7 - Gosper Glider Gun');
    gotoxy(10, 26);
    write('8 - Placer planeur');
    gotoxy(10, 27);
    write('9 - Quitter');
    gotoxy(40, 18);
    write('Saisissez l option :');
end;

(*
 *  Sauvegarde le tableau du tours courant dans le fichier texte de sauvegarde
 *  Renvoie faux si une erreur intervient durant la sauvegarde du fichier.
 *)
Function save(var tab : arr) : boolean;
var
    s : String;
    y, x : Integer;
    success : Boolean;
begin
    AssignFile(MyFile, SAVE_PATH);
    success := TRUE;
    try
        ReWrite(MyFile);
        append(MyFile);
        for y := 0 to height -1 do
        Begin     
            s := '';
            For x := 0 to width -1 do
                begin  
                s +=  intToStr(tab[y, x]);
                End;
            WriteLn(MyFile, s);
        End;
        CloseFile(MyFile);
    except
        success := FALSE;
    end;
    save := success;
end;

(*
 *  Charge une sauvegarde dans le tableau du tours courant.
 *  Renvoie faux si une erreur intervient du chargement du fichier.
 *)
function load(var tab : arr; path : string) : Boolean;
var
    s : String;
    y, x : Integer;
    success : Boolean;
begin
	success := TRUE;
	
	try
        AssignFile(MyFile, path);
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
    except
        success := FALSE;
    end;
    load := success;
end;

(*
 *  Deamande un entier … l'utilisateur.
 *)
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

(*
 *  Charge la grille de sauvegarde
 *)
Procedure loadGrid(var tab : arr; path : string);
begin
	gotoxy(40, 20);
	if(NOT load(tab, path)) then 
	begin
		WriteLn('Le chargement du fichier a echouee..                  .');
	End
	else
	begin
		WriteLn('Fichier charge avec succes                ');
		printGrid(tab);
	end;
end;

(*
 *  Charge la grille contenant le canon
 *)
Procedure loadGun(var currTurn : arr; GUN_PATH : string; var circu : boolean);
begin
	switchToNormalMode(circu);
	loadGrid(currTurn, GUN_PATH);
end;

(*
 *  Appel la fonction permettant de persister le tableau dans un fichier texte. 
 *  Notifie l'utisateur du succŠs de l'op‚ration
 *)
Procedure  saveGrid(var tab : arr);
begin
	gotoxy(40, 20);
	if(save(tab)) then write('Sauvegarde reussie!                  ') Else write('La sauvegarde a ‚chouee!               ');
end;

(*
 *  GŠnere un tableau de 0 et de 1 compos‚ de valuers al‚atoires. Imprime le tableau … la fin du processus.
 *)
 Procedure generateRandomGrid(var tab : arr);
 var
    y, x, value : Integer;
Begin
	randomize();
	 for y := 0 to height -1 do
    Begin     
		For x := 0 to width -1 do
            begin  
            	value := random(10);
                if(value > 1) then 
                begin
                	tab[y, x ] := 0;
                End
                else
                begin
                	tab[y, x ] := 1;
                end;
            End;
        End;
        printGrid(tab);
end;

(*
 *  Demande 2 entiers … l'utilisateurs qui peuvent ˆtre ensuite utilis‚s comme des coordonn‚es x et y.
 *)
Procedure askCoord(var x, y : Integer);
Begin
	gotoxy(40, 20);
	write('Choissiez l absisse : ');
	read(x);
	gotoxy(40, 21);
	write('Choissiez l ordonee : ');
	read(y);
	
	gotoxy(40, 20);
	write('                          ');
	gotoxy(40, 21);
	write('                          ');
end;

(*
 *  InsŠre un planeur dans le tableau aux coordonn‚es sp‚cifi‚s par l'utilisateur.
 *)
Procedure createPlanar(var tab : arr; y, x : Integer);
Begin
	tab[y, x + 1] := 1;
	tab[y + 1, x + 2] := 1;
	tab[y + 2, x] := 1;
	tab[y + 2, x + 1] := 1;
	tab[y + 2, x + 2] := 1;
	
	gotoxy(40, 20);
    write('Planeur cree!');
end;

(*
 *  Appel les fonctions n‚c‚ss‚ssaires … la cr‚ation d'un planeur. Imprime le tableau en fin de processus.
 *)
Procedure placePlanar(var tab : arr);
var
    posX, posY : Integer;
begin
	askCoord(posX, posY);
	if(posX < 0) OR (posX > width - 4) OR (posY < 0) OR (posY > height - 4) Then
    Begin
        gotoxy(40, 20);
        write('Coordonees invalides');
    end
    else 
    Begin
    	createPlanar(tab, posY, posX);
    end;
	printGrid(tab);
end;