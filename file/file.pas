Program file_program;

const
    debut = 1;
    fin = 10;
    size = fin - debut + 1;

type
    arr = Array[debut..fin] of Integer;
    
var
    tete, queue : Integer;
    tableau : arr;
    
    Function getIndex(value : Integer) : Integer;
    Begin
    	getIndex := value mod size;
    end;
    
    Function file_vide(queue, tete : Integer) : Boolean;
    Begin
        if(tete = queue) Then
        Begin
        	file_vide := TRUE;
        End
        Else
        begin
        	file_vide := FALSE;
        End;
    End;
    
    Function file_pleine(queue, tete : Integer) : Boolean;
    Begin
            if(getIndex(queue) = getIndex(tete)) AND (queue <> tete) Then
            Begin
            	file_pleine := TRUE;
            End
            Else
            Begin
            	file_pleine := FALSE;
            end;
        end;
        
        Procedure enfiler(var tab : arr; tete: Integer; var queue : Integer; valeur : Integer);
        Begin
        	if(not file_pleine(queue, tete)) Then
        	Begin
                tab[getIndex(queue)] := valeur;
                queue := queue + 1;
            End
            Else
            Begin
            	WriteLn('ERREUR : la file est pleine!');
            End;
        end;
        
     Function defiler(var tab : arr; var tete : Integer; queue : Integer) : Integer;
     var 
        index : Integer;
     Begin
     	if(not file_vide(queue, tete)) Then
     	Begin
     		index := getIndex(tete);
     		tete := tete + 1;
     		defiler := tab[index];
        end
        Else
        Begin
        	WriteLn('ERREUR : La file est vide');
        end;
    end;
Begin
	tete := 0;
	queue := 0;
	enfiler(tableau, tete, queue, 1);
	enfiler(tableau, tete, queue, 2);
    enfiler(tableau, tete, queue, 3);
    enfiler(tableau, tete, queue, 4);
    enfiler(tableau, tete, queue, 5);
    enfiler(tableau, tete, queue, 6);
    enfiler(tableau, tete, queue, 7);
    enfiler(tableau, tete, queue, 8);
    enfiler(tableau, tete, queue, 9);
    enfiler(tableau, tete, queue, 10);
    //file pleine
    enfiler(tableau, tete, queue, 11);
    enfiler(tableau, tete, queue, 12);
		
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
	WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    //file vide
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    
    enfiler(tableau, tete, queue, 11);
	enfiler(tableau, tete, queue, 12);
    enfiler(tableau, tete, queue, 13);
    enfiler(tableau, tete, queue, 14);
    enfiler(tableau, tete, queue, 15);
    enfiler(tableau, tete, queue, 16);
    enfiler(tableau, tete, queue, 17);
     WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    enfiler(tableau, tete, queue, 18);
    enfiler(tableau, tete, queue, 19);
    enfiler(tableau, tete, queue, 20);
    
    
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
	WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    
    enfiler(tableau, tete, queue, 21);
    enfiler(tableau, tete, queue, 22);
    enfiler(tableau, tete, queue, 23);
    
     WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    //file vide
    WriteLn(defiler(tableau, tete, queue));
	WriteLn(defiler(tableau, tete, queue));
    WriteLn(defiler(tableau, tete, queue));
    
End.
