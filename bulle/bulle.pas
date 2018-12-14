Program tri_bulle;

const
    size  = 9;

var
    arr : array[1..size] of integer;
    i, j, save: Integer;
    

    
    {$I functions.pas}
    
begin
	
	arr[1] := 10;
	arr[2] := 9;
	arr[3] := 7;
	arr[4] := 98;
	arr[5] := 12;
	arr[6] := 1;
	arr[7] := 8;
	arr[8] := 12;
	arr[9] := 121;
	
	(*for i := 0 to size - 1 do
    begin
        for j := 0 to size - i - 1 do
        begin
        	if (arr[j] > arr[j +1]) then
        	begin
        		if (comparer(arr[i], arr[i + 1])) Then
        		Begin
        			permuter(arr[i], arr[i + 1]);
        			end;
        		end;
        	end;
        end; *)
        
        permuter(arr[1], arr[2]);
        printArr();
end.