(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans le coin en haut … gauche.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildTopCircuLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildTopCircuLeftCircu := tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x + 1] + tab[height - 1,  x + 1] + tab[height - 1, x] + tab[height - 1, width - 1] + tab[y, width - 1] + tab[y + 1, width - 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans coin en haut … droite.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildTopCircuRightCircu(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopCircuRightCircu := tab[y, x - 1]  + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, 0] + tab[y, 0] + tab[height - 1, 0] + tab[height - 1,  x] + tab[height - 1, x - 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours d'une case situ‚e dans sur la premiŠre ligne.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildTopCircu(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopCircu := tab[y, x -1] + tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, x + 1]  + tab[height - 1, x + 1] + tab[height - 1, x] + tab[height - 1, x - 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans le coin en bas … gauche.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildBottomCircuLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircuLeftCircu := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1,  x + 1] + tab[y - 1, width - 1] + tab[y, width - 1] + tab[0, width - 1] + tab[0, x] + tab[0, x + 1];
End; 

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e dans le coin en bas … droite.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildBottomCircuRightCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircuRightCircu := tab[y, x -1] + tab[y - 1, x] + tab[y - 1, x -1] + tab[0, x - 1] + tab[0, x] + tab[0, 0] + tab[y, 0] + tab[y - 1, 0];
End;   

(*
 *  Renvoie le nombre de cellules vivantes autours d'une case situ‚e sur la derniŠre ligne.
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildBottomCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircu := tab[y, x - 1] + tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y -1, x + 1] + tab[0, x - 1] + tab[0, x] + tab[0, x + 1];
End;    

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en d‚but de ligne (… gauche).
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildLeftCircu := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x +1] + tab[y + 1, x] + tab[y + 1, x + 1] + tab[y + 1, width - 1] + tab[y, width - 1] + tab[y - 1, width -1];
End;  

(*
 *  Renvoie le nombre de cellules vivantes autours de la case situ‚e en fin de ligne (… droite).
 *  Le tableau est trait‚ de maniŠre circulaire, si l'index de la case adjacente est hors des limites du tableau, 
 *  elle va chercher la cellule situ‚e … l'autre extr‚mit‚e.
 *)
Function nbChildRightCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildRightCircu := tab[y, x - 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y - 1, 0] + tab[y, 0] + tab[y + 1, 0];
End;  

(*
 *  Renvoie le nombre de cellules vivantes autours d'une case qui n'est pas sur une bordure.
 *)
Function nbChildNormalCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildNormalCircu := tab[y, x + 1] + tab[y + 1, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y, x - 1] + tab[y - 1, x - 1] + tab[y - 1, x] + tab[y - 1, x + 1];
End;  
	

(*
 *  Met … jour la grille de maniŠre circulaire. Appelle la fonction permettant de d‚terminer le nombre de cellules adjacentes
 *  qui sont vivantes. Appel des fonctions diff‚rentes si la cellule se situe sur un bord.
 *  Une fois le nombre d'enfant obtenu, appel les fonctions qui d‚termine si la cellule doit vivre ou mourir au prochai tours. 
 *  Enfin stocke les donn‚es du tours suivant dans le tableau du tours courant.
 *)
Procedure updateGridCircu(var tab1, tab2 : arr);
var
    y, x, nbChild : Integer;
Begin
	for y := 0 to height - 1 do
	begin   
		for x := 0 to width - 1do
        begin   
        //bottom
            if(y = 0) Then
            Begin
                if(x = 0) Then
                Begin
                    nbChild := nbChildTopCircuLeftCircu(tab1, y, x);
                End
                Else if(x = width - 1) Then
                Begin
                    nbChild := nbChildTopCircuRightCircu(tab1, y, x);
                End
                Else
                Begin
                    nbChild := nbChildTopCircu(tab1, y, x);
                end;
            End
            Else if(y = height - 1) Then
            Begin
            	if(x = 0) Then
            	Begin
            		nbChild := nbChildBottomCircuLeftCircu(tab1, y, x);
            	end
            	Else if(x = width - 1)Then
            	Begin
            		nbChild := nbChildBottomCircuRightCircu(tab1, y, x);
            	End
            	Else
            	Begin
            		nbChild := nbChildBottomCircu(tab1, y, x);
            	end;
            End
            Else if(x = 0)Then
            Begin
                nbChild := nbChildLeftCircu(tab1, y, x);
            end
            Else if(x = width - 1)Then
            Begin
                nbChild := nbChildRightCircu(tab1, y, x);
            end
            Else
            Begin
            	nbChild := nbChildNormalCircu(tab1, y, x);
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
    End;
	tab1 := tab2;
end;

