Program game_of_life;
Uses Math, SysUtils,  Crt;

const
    min = 0;
    max = 99;
    width = 10;
    height = 10;

type
    arr = Array[min..max] of Boolean;
    
var
    t1, t2 : arr;
    merde : Integer;
    c : char;

Function nbChildTopLeft(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i + width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i + width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildTopLeft := nbChild;
End;    

Function nbChildTopRigtht(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i + width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i + width - 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
   nbChildTopRigtht := nbChild;
End;    

Function nbChildTop(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i + width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i + width - 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i + width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildTop := nbChild;
End;    

Function nbChildBottomLeft(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildBottomLeft := nbChild;
End; 

Function nbChildBottomRigth(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width - 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildBottomRigth := nbChild;
End;   

Function nbChildBottom(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width - 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i - width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildBottom := nbChild;
End;    

Function nbChildLeft(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i - width - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i  + width ]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i - width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
  nbChildLeft := nbChild;
End;  

Function nbChildRight(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i - width - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i  + width ]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i - width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    
  
    nbChildRight := nbChild;
End;  

Function nbChildNormal(var tab : arr; i : Integer) : Integer;
var
    nbChild : Integer;
Begin
	nbChild := 0;
	if(tab[i  - width - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - width + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i - 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[ i + 1]) Then
	Begin
		nbChild := nbChild + 1;
	End;
	if(tab[i  + width - 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i  + width]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    if(tab[i  + width + 1]) Then
    Begin
    	nbChild := nbChild + 1;
    end;
    nbChildNormal := nbChild;
End;  

Procedure updateLiving(var tab2 : arr; i, nbChild : Integer);
Begin
    if(nbChild = 2) Then
    Begin
    	tab2[i] := TRUE;
    end
    Else
    Begin
    	tab2[i] := FALSE;
    end;
End;

Procedure updateDead(var tab2 : arr; i, nbChild : Integer);
Begin
    if(nbChild = 3) Then
    Begin
    	tab2[i] := TRUE;
    end
    Else
    Begin
    	tab2[i] := FALSE;
    end;
End;
    
Procedure updateGrid(var tab1, tab2 : arr);
var
    it, nbChild : Integer;
Begin
	for it := 0 to width * height - 1 do
	begin   
		if(it < width) Then
        Begin
        	if(it = 0) Then
        	Begin
        		nbChild := nbChildTopLeft(tab1, it);
        	End
        	else if(it = width - 1) Then
        	Begin
        		nbChild := nbChildTopRigtht(tab1, it);
            End
            Else
            Begin
            	nbChild := nbChildTop(tab1, it);
            End;
        End  
        Else if(it >= width * height - width) Then
        Begin
            if(it mod width = 0) Then
            Begin
            	nbChild := nbChildBottomLeft(tab1, it);
        	End
        	Else if(it  = width * height -1) Then
        	Begin
                    nbChild := nbChildBottomRigth(tab1, it);
            End
            Else
            Begin
            	nbChild := nbChildBottom(tab1, it);
            end;
        End
        Else if(it mod width = 0) Then
        Begin
            nbChild := nbChildLeft(tab1, it);
        End
        Else if(it mod width = width - 1) Then
        Begin
            nbChild := nbChildRight(tab1, it);
		End
		Else
		Begin
			nbChild := nbChildNormal(tab1, it);
		end;
		
		if(t1[it]) Then
        Begin
            updateLiving(tab2, it, nbChild);
        End
        Else
        Begin
            updateDead(tab2, it, nbChild);
        End;
    End;
	tab1 := tab2;
end;

Procedure printGrid(tab1 : arr);
var
    x, y: Integer;
Begin
	for x := 1 to width do
	begin  
		gotoxy(x, 1);
		write('*');
		gotoxy(x, height + 2);
		write('*');
    end;
    for x := 1 to height + 1 do
	begin  
		gotoxy(1, x);
		write('*');
		gotoxy(width + 2, x);
		write('*');
    end;
    
	for y := 0 to height -1 do
	begin  
		for x := 0 to width -1 do
        begin  
            if(tab1[width * y + x]) Then
            Begin
            	gotoxy(2 + x, y + 2);
            	write('X');
            End
            Else
            Begin
            	gotoxy(2 + x, y + 2);
            	write(' ');
            end;
        End;
        WriteLn();
	end;
	
end;

Begin
    t1[0] := TRUE;
    t1[1] := TRUE;
    t1[2] := TRUE;
    t1[3] := TRUE;
    t1[4] := TRUE;
    t1[5] := TRUE;
    t1[10] := TRUE;
    t1[11] := TRUE;
    t1[12] := TRUE;
    t1[13] := TRUE;
    t1[14] := TRUE;
    
	printGrid(t1);
	While(merde < 100) do
	Begin
		sleep(500);
		updateGrid(t1, t2);
		printGrid(t1);
		merde := merde + 1;
	end;
end.
