    Function compare(a, b : Integer) : Boolean;
begin
	compare := a > b;
end;

Procedure permuter(var  arr2: array of integer; index : Integer);
var 
    save : Integer;
begin
	
	save := arr2[index];
	arr2[index] := arr[index + 1];
	arr2[index + 1] := save;

end;
    
  
 Procedure trier1;
var
    permutation : Boolean;
    i, j : Integer;
begin
	i := 0;
	While(permutation AND (i < max - 1) ) do
	begin
		permutation := FALSE;
		for j := 0 to max - 2 do
		begin
			
			if(compare(arr[j], arr[j + 1])) Then
			begin
				permuter(arr, j);
				permutation := TRUE;
				end;
			end;
			i := i +1;
		end;
	end;
	
	
	 Procedure trier2;
var
    permutation : Boolean;
    k, j, l: Integer;
begin
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
		end;
	end;
	
Procedure printArr(var arr : array of Integer);
var
    i : integer;
begin
	write('[');
	for i := 0 to 4 do
	begin
		if(i <> 4) Then
		begin
			write(arr[i], ', ');
			end
		else 
		begin 
			write(arr[i], ']');
			end;
		end;
	end;
	