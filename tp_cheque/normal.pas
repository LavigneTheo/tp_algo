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
	nbChildNormal := tab[y, x + 1] + tab[y + 1, x + 1] + tab[y + 1, x] + tab[y + 1, x - 1] + tab[y, x - 1] + tab[y - 1, x - 1] + tab[y - 1, x] + tab[y - 1, x - 1];
End;  