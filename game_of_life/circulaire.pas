
Function nbChildTopCircuLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildTopCircuLeftCircu := tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x + 1] + tab[height - 1,  x + 1] + tab[height - 1, x] + tab[height - 1, width - 1] + tab[y, width - 1] + tab[y + 1, width - 1];
End;    

Function nbChildTopCircuRightCircu(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopCircuRightCircu := tab[y, x - 1]  + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, 0] + tab[y, 0] + tab[height - 1, 0] + tab[height - 1,  x] + tab[height - 1, x - 1];
End;    

Function nbChildTopCircu(var tab : arr; y, x : Integer) : Integer;
Begin
	nbChildTopCircu := tab[y, x -1] + tab[y, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y + 1, x + 1]  + tab[height - 1, x + 1] + tab[height - 1, x] + tab[height - 1, x - 1];
End;    

Function nbChildBottomCircuLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircuLeftCircu := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1,  x + 1] + tab[y - 1, width - 1] + tab[y, width - 1] + tab[0, width - 1] + tab[0, x] + tab[0, x + 1];
End; 

Function nbChildBottomCircuRightCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircuRightCircu := tab[y, x -1] + tab[y - 1, x] + tab[y - 1, x -1] + tab[0, x - 1] + tab[0, x] + tab[0, 0] + tab[y, 0] + tab[y - 1, 0];
End;   

Function nbChildBottomCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildBottomCircu := tab[y, x - 1] + tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y -1, x + 1] + tab[0, x - 1] + tab[0, x] + tab[0, x + 1];
End;    

Function nbChildLeftCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildLeftCircu := tab[y, x + 1] + tab[y - 1, x] + tab[y - 1, x +1] + tab[y + 1, x] + tab[y + 1, x + 1];
End;  

Function nbChildRightCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildRightCircu := tab[y, x - 1] + tab[y - 1, x] + tab[y - 1, x - 1] + tab[y + 1, x] + tab[y + 1, x - 1];
End;  

Function nbChildNormalCircu(var tab : arr; y, x: Integer) : Integer;
Begin
	nbChildNormalCircu := tab[y, x + 1] + tab[y + 1, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y, x - 1] + tab[y - 1, x - 1] + tab[y - 1, x] + tab[y - 1, x + 1];
End;  

Procedure updateGridCircu(var tab1, tab2 : arr);
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

