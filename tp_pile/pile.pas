Program program_pile;

const 
    max = 10;
    debut = 1;

type
        arr = Array[debut..max] of Integer;

var
    sommet : Integer;
    tab : arr;
    
    (*
     *  Cette fontion d‚termine si la pile est pleine. La pile est pleine lorsque le sommet est ‚gal au dernier index du tableau.
     *  Lorsque la pile est pleine, renvoie un bool‚en "TRUE" sinon "FALSE".
     *)
    Function pile_pleine(sommet : Integer) : Boolean;
    begin
    	if(sommet = max) Then
    	begin
    		pile_pleine := TRUE;
        end
        else 
        Begin
        	pile_pleine := FALSE;
        	end;
    	end;

    (*
     *  Cette fontion d‚termine si la pile est vide. La pile est vide lorsque le sommet est ‚gal … 0.
     *  Dans ce cas la fonction renvoie un bool‚en "TRUE", sinon "FALSE".
     *)
    Function pile_vide(sommet : Integer) : Boolean;
    begin
    	if(sommet = 0) Then
    	begin
    		pile_vide := TRUE;
        end
        else 
        begin
        	pile_vide := FALSE;
        	end;
    	end;

    (*
     *  InsŠre un ‚l‚ment dans la pile dans le cas ou la pile n'est pas pleine. 
     *  Incr‚mente la valeur du sommet de 1.
     *)
    Procedure empiler(var tableau : arr; var sommet : Integer; valeur : Integer) ;
    Begin
    	if(pile_pleine(sommet) = FALSE) Then
    	begin
    		sommet := sommet + 1;
    		tableau[sommet] := valeur;
        end
        Else
        begin
        	WriteLn('pile pleine');
        	end;
    	end;
    
    (*
     *  D‚pile un ‚l‚ment, dans le cas o— la pile n'est pas d‚j… vide.
     *  D‚cr‚mente la valeur du sommet de 1.
     *)
    Function depiler(var tableau : arr; var sommet : Integer) : Integer;
    Begin
    	if(pile_vide(sommet) = FALSE) then  
    	begin
    		sommet := sommet - 1;
    		depiler := tableau[sommet + 1];
    		
        end
        Else
        begin
        	 WriteLn('Impossible de depiler une pile vide');
        	 depiler := -1;
        	end;
    	end;
Begin
	
	sommet := 0;
	
	empiler(tab, sommet, 1);
	empiler(tab, sommet, 2);
	empiler(tab, sommet, 3);
	empiler(tab, sommet, 4);
	empiler(tab, sommet, 5);
	empiler(tab, sommet, 6);
	empiler(tab, sommet, 7);
	empiler(tab, sommet, 8);
	empiler(tab, sommet, 9);
	empiler(tab, sommet, 10);
	//Pile pleine
	empiler(tab, sommet, 11);
	empiler(tab, sommet, 12);
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	
	empiler(tab, sommet, 13);
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	//Pile vide
	WriteLn(depiler(tab, sommet));
	WriteLn(depiler(tab, sommet));
	
end.