Program program_quicksort;

var 
    tab : Array[1..10] of Integer;
    
         Procedure printTab(i, endd : Integer);
     var
        it : Integer;
     begin
     	
     	for it := i to endd do
     	begin
     		Write(tab[it], ', ')
        end;
        WriteLn();
     	end;
    
    Procedure swap(index1, index2 : Integer);
    var
        save : Integer;
    begin
    	save := tab[index1];
    	tab[index1] := tab[index2];
    	tab[index2] := save;
    	end;
    
    Function partition(low, high : Integer): Integer;
    var 
        pivot, i, j : Integer;
    begin
    pivot := tab[high];
    i := low;
    for j := low to high - 1 do
    Begin
        if (tab[j] < pivot) then
        begin
            if (i <> j) then
            Begin
               swap(i, j);
            end;
            i := i + 1;
        end;
    end;
    swap(i, high);
    partition := i;
    	end;
    
    Procedure quicksort(low, high : Integer) ;
    var
        p : Integer;
    begin
    	if(low < high) Then
    	begin
    		p := partition(low, high);
            quicksort(low, p - 1);
            quicksort(p + 1, high);
    		end;
    	end;
     

        
begin 
	tab[1] := 10;
	tab[2] := 2;
	tab[3] := 9;
	tab[4] := 11;
	tab[5] := 6;
	tab[6] := 5;
	tab[7] := 19;
	tab[8] := 12;
	tab[9] := 3;
	tab[10] := 4;
	
	quicksort(1, 10);
	printTab(1, 10);
	
	Readln();
end.