Program cheque;
Uses Math;

type
        tab = array[0..3] of  integer;
        Tptr = ^tab;

var 
    //Nombre saisis par l'utilisateur
    number : Real;
    //Poiteur vers le tableau qui stocke la d‚composition du nombre
    tabPtr : Tptr;
    //Stocke le r‚sultat
    res : string;
    
    {$i func.pas}
    
    (***************************************************** MAIN *********************************************************)
    
(*
 *  Demande un  nombre … l'utilisateur jusqu'a ce que celui-ci soit valide.
 *  Decompose le nombre, et appŠle les fonctions permettant d'obtenir la transcritption scripturale du nombre.
 *  Imprime ensuite le nombre dans la console.
 *  LibŠre la m‚moire dynamiquement et ferme le progamme.
 *
 *)
begin
	While getInput() = FALSE do;
	new(tabPtr);
	
	decompose();
    
    res :=                  getMillions(tabPtr^[0]);
    res := res + ' ' + getThousands(tabPtr^[1]);
    res := res + ' ' + getHundreds(tabPtr^[2],  FALSE);
    res := res + ' ' + getEuros();
    res := res + ' ' + getCents(tabPtr^[3]);
    
    Writeln(res);
	Readln();
	
	dispose(tabPtr);
end.