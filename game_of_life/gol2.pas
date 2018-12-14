Program game_of_life;
{$mode objfpc}
Uses Math, sysutils,  Crt, Classes;

(*
 * Code disponble … l'adresse : https://github.com/LavigneTheo/tp_algo/tree/master/game_of_life
 *)

const
    width = 80;
    height = 15;
    
    (*
     *  Noms des fichiers texte contenant la sauvegarde et le canon
     *)
    SAVE_FILE = 'save.txt';
    GUN_FILE = 'gosperGliderGun.txt';
    
    QUITTER = 9;
    
type
    arr = Array[0..height - 1, 0..width - 1] of Integer;
    
var
    currentTurn, nextTurn : arr;
    choice : Integer;
    c : char;
    circular : boolean;
    MyFile: TextFile;
    currentDir : string;
    
    {$i base.pas}
    {$i normal.pas}
    {$i circulaire.pas}

(*
 *  Effectue 100 tours. Selon que l'on soit en mode circulaire, ou en mode normal, appel une fonction diff‚rente.
 *)
Procedure continue(var tab1, tab2 : arr);
var
    turn : Integer;
begin
	turn := 0;
	While(turn < 100) do
	Begin
		if(circular) then
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

Begin
    currentDir := getPath();
	printBorder();
	printOptions();
	switchToCircularMode(circular);
    
	Repeat
		choice := askOption();
		
		case choice of
        1 : continue(currentTurn, nextTurn);
        2 : loadGrid(currentTurn, currentDir + SAVE_FILE);
        3 : saveGrid(currentTurn, currentDir + SAVE_FILE);
        4 : switchToCircularMode(circular);
        5 : switchToNormalMode(circular);
        6 : generateRandomGrid(currentTurn);
        7 : loadGun(currentTurn, currentDir + GUN_FILE, circular);
        8 : placePlanar(currentTurn);
    end;
    
    Until choice = QUITTER

end.
