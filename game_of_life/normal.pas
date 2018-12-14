(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans le coin en haut … gauche.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildTopLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildTopLeft := tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x + 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans le coin en haut … droite.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildTopRight(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopRight := tab[y, x - 1]  + tab[y + 1, x] + tab[y + 1, x - 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en premiŠre ligne.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildTop(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTop := tab[y, x -1] + tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, x + 1] ;
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en bas … gauche.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildBottomLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomLeft := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1,  x + 1];
End; 

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en bas … droite.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildBottomRight(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomRight := tab[y, x -1] + tab[y - 1, x] + tab[y - 1, x -1];
End;   

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en derniŠre ligne.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildBottom(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottom := tab[y, x - 1] + tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y -1, x + 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case d‚but de ligne (… gauche).
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildLeft := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x +1] + tab[y + 1, x] + tab[y + 1, x + 1];
End;  

(*
 *  Renvoie le nombre de cellules vivantes autours de la case fin de ligne (… droite).
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildRight(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildRight := tab[y, x - 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y + 1, x] + tab[y + 1, x - 1];
End;  

(*
 *  Renvoie le nombre de cellules vivantes autours de la case.
 *  Les cellules adjacentes en dehors des limites du tableau sont ignor‚s.
 *)
Function nbChildNormal(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildNormal := tab[y, x + 1] + tab[y + 1, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y, x - 1] + tab[y - 1, x - 1] + tab[y - 1, x] + tab[y - 1, x + 1];
End;  

(*
 *  Met … jour la grille en igorant les cases adjacentes hors des limites du ntableau. Appelle la fonction permettant de d‚terminer le nombre de cellules adjacentes
 *  qui sont vivantes d'une cellule. Appel des fonctions diff‚rentes si la cellule se situe sur un bord.
 *  Une fois le nombre d'enfant obtenu, d‚termine si la cellule doit ˆtre vivante ou morte au prochain tours. 
 *  Enfin stocke les valeurs du tours suivant dans le tableau du tours courant.
 *)
Procedure updateGrid(var tab1, tab2 : arr);
var
    y, x, nbChild : Integer;
Begin
	for y := 0 to height - 1 do
	begin   
		for x := 0 to width - 1 do
        begin   
        //bottom
            if(y = 0) Then
            Begin
                if(x = 0) Then
                Begin
                    nbChild := nbChildTopLeft(tab1, y, x);
                End
                Else if(x = width - 1) Then
                Begin
                    nbChild := nbChildTopRight(tab1, y, x);
                End
                Else
                Begin
                    nbChild := nbChildTop(tab1, y, x);
                end;
            End
            Else if(y = height - 1) Then
            Begin
            	if(x = 0) Then
            	Begin
            		nbChild := nbChildBottomLeft(tab1, y, x);
            	end
            	Else if(x = width - 1)Then
            	Begin
            		nbChild := nbChildBottomRight(tab1, y, x);
            	End
            	Else
            	Begin
            		nbChild := nbChildBottom(tab1, y, x);
            	end;
            End
            Else if(x = 0)Then
            Begin
                nbChild := nbChildLeft(tab1, y, x);
            end
            Else if(x = width - 1)Then
            Begin
                nbChild := nbChildRight(tab1, y, x);
            end
            Else
            Begin
            	nbChild := nbChildNormal(tab1, y, x);
            end;
            if(tab1[y, x] = 1) Then
            Begin
                updateLiving(tab2, y, x, nbChild);
            End
            Else
            Begin
                updateDead(tab2, y, x, nbChild);
            End;
        End;
    end;
	tab1 := tab2;
end;


