Function nbChildTopLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildTopLeft := tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x + 1];
End;    

Function nbChildTopRight(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopRight := tab[y, x - 1]  + tab[y + 1, x] + tab[y + 1, x - 1];
End;    

Function nbChildTop(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTop := tab[y, x -1] + tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, x + 1] ;
End;    

Function nbChildBottomLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomLeft := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1,  x + 1];
End; 

Function nbChildBottomRight(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomRight := tab[y, x -1] + tab[y - 1, x] + tab[y - 1, x -1];
End;   

Function nbChildBottom(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottom := tab[y, x - 1] + tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y -1, x + 1];
End;    

Function nbChildLeft(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildLeft := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x +1] + tab[y + 1, x] + tab[y + 1, x + 1];
End;  

Function nbChildRight(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildRight := tab[y, x - 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y + 1, x] + tab[y + 1, x - 1];
End;  

Function nbChildNormal(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildNormal := tab[y, x + 1] + tab[y + 1, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y, x - 1] + tab[y - 1, x - 1] + tab[y - 1, x] + tab[y - 1, x + 1];
End;  

Procedure updateGrid(var tab1, tab2 : arr);
var
    y, x, nbChild : Integer;
Begin
	for y := 0 to height do
	begin   
		for x := 0 to width do
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
            if(t1[y, x] = 1) Then
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


