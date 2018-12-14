Program game_of_life;
{$mode objfpc}
Uses Math, sysutils,  Crt, Classes;

const
    width = 80;
    height = 15;
    FILE_PATH = 'C:/Users/Theo/Desktop/cours/algo/code/game_of_life/m.txt';
    
    QUITTER = 7;
    
    MODE_NORMAL = 'normal';
    MODE_CIRCULAR = 'circular';
    
type
    arr = Array[0..height - 1, 0..width - 1] of Integer;
    
var
    t1, t2 : arr;
    choice : Integer;
    c : char;
    mode : string;
    MyFile: TextFile;
    
    {$i base.pas}
    {$i normal.pas}
    {$i circulaire.pas}

Procedure continue(var tab1, tab2 : arr);
var
    turn : Integer;
begin
	turn := 0;
	While(turn < 100) do
	Begin
		sleep(200);
		if(mode = MODE_CIRCULAR) then
		begin
            updateGridCircu(tab1, tab2);
		end
		else
		Begin
            updateGrid(tab1, tab2);
		end;
		printGrid(tab1);
		turn := turn + 1;
	end;
end;

 Procedure generateRandomGrid(var tab : arr);
 var
    y, x : Integer;
Begin
	 for y := 0 to height -1 do
    Begin     
		For x := 0 to width -1 do
            begin  
            End;
    End;
end;

Begin
	printBorder();
	printOptions();
	
	Repeat
		choice := askOption();
		case choice of
        1 : continue(t1, t2);
        2 : loadGrid(t1);
        3 : saveGrid(t1);
        4 : mode := MODE_CIRCULAR;
        5 : mode := MODE_NORMAL;
        6 : generateRandomGrid(t1);
        end;
    
		Until choice = QUITTER
	
end.
