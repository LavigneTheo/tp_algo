Program bulle;

const
    max = 5;

var
    
    arr : array[0..4] of integer;

    {$i func.pas}
    
	 Procedure trie_shaker;
var
    permutation : Boolean;
    k, j, l, tour: Integer;
begin
	tour := 0;
	k := max - 1;
	While(k > 0) do
	begin
		l := k;
		k := 0;
		permutation := FALSE;
		
		for j := 0 to l - 1 do
		begin
			if(compare(arr[j], arr[j + 1])) Then
			begin
				permuter(arr, j);
				permutation := TRUE;
				k := j ;
				end;
			end;
			
			for j := 0 to l - 1 do
		begin
			if(compare(arr[l - j], arr[l + 1 - j])) Then
			begin
				permuter(arr, j);
				permutation := TRUE;
				end;
			end;
			tour := tour + 1;
		end;
		writeln(tour);
	end;
	
    
begin
	arr[0] := 1;
	arr[1] := 0;
	arr[2] := 3;
	arr[3] := 4;
    arr[4] := 5;
	
	trie_shaker();
	printArr(arr);
	Readln();
	
end.
