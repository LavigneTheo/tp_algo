Program insertion_tete;

type
    tData = Integer;
     node_ptr = ^Node;
    Node = record
		next : node_ptr;
		data : tData;
	end;
	
var
    head : node_ptr;
   
Procedure insert(head : node_ptr; data : tData);
var
    Tmp : node_ptr;
begin
	new(Tmp);
	Tmp^.data := data;
	Tmp^.next := head^.next;
	head^.next := Tmp;
end;

Function delete(head : node_ptr) : tData;
var
    res : tData;
    Tmp : node_ptr;
begin
	res := head^.next^.data;
	Tmp := head^.next;
	head^.next := Tmp^.next;
	dispose(Tmp);
	delete := res;
end;
    
begin
	
	new(head);
	
	insert(head, 1);
	insert(head, 2);
	insert(head, 3);
	insert(head, 4);
	insert(head, 5);
	
	WriteLn(delete(head));
		WriteLn(delete(head));
		WriteLn(delete(head));
				WriteLn(delete(head));
	
	dispose(head);
end.