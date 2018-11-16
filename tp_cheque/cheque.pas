Program cheque;
Uses Math;

type
        tab = array[0..3] of  integer;
        Tptr = ^tab;

var 
    //Nombre saisis par l'utilisateur
    nombre : Real;
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
	While obtenirSaisie() = FALSE do;
	new(tabPtr);
	
	decompose();
    
    res :=                  millions(tabPtr^[0]);
    res := res + ' ' + milliers(tabPtr^[1]);
    res := res + ' ' + centaines(tabPtr^[2],  FALSE);
    res := res + ' ' + euros();
    res := res + ' ' + centimes(tabPtr^[3]);
    
    Writeln(res);
	Readln();
	
	dispose(tabPtr);
end.