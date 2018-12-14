Procedure printArr;
var 
    i : Integer;
Begin
    write('[');
    for i := 1 to size do
    begin
       Write(arr[i], ', ');
        end;
     write(']');
 end;
 
 Function comparer(a, b : Integer) : Boolean;
 begin
 	comparer := a > b;
end;

Procedure permuter(var a, b : integer);
var
    tmp : integer;
begin
    tmp := a;
    a
     := b;
    b := tmp;
end;
    
    
    
    