(*
 *  Demande un nombre Ö l'utilisateur et renvoie si celui-ci est compris entre 0.01 et 999 999 999.99
 *
 *  Param X
 *  Retourne Booleen : si le nombre est compris entre 0.01 et 999 999 999.99
 *)
function obtenirSaisie: Boolean;
begin
	WriteLn('Saisissez un nombre : ');
	read(nombre);
	obtenirSaisie := (nombre >= 0.01) AND (nombre <= 999999999.99);
end;

(*
 *  Stocke dans un tableaux la dÇcomposition du nombre 4 parties.
 *  Index 0 : partie des millions, index 1 : partie des milliers, index 2 : parties des centaines, index 3 : partie dÇcimale
 *
 * Param X
 *)
Procedure decompose;
begin
	
	tabPtr^[0] := Trunc(nombre / 1000000);
    tabPtr^[1] := Trunc(nombre / 1000) mod 1000;
	tabPtr^[2] := Trunc(nombre) mod 1000;
	tabPtr^[3] := round(nombre * 100) mod 100;
	
end;
    
(*
 *  Cette fonction  prends en paramätre un nombre compris entre 0 et 99 sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *  Traites les exceptions suivantes :
 *  -  91...96 et 71...76 (ex : 'soixante-seize' pas 'soizante-dix-six')
 *  - 11...16 (ex : 'seize' pas 'dix-six')
 *  - 80
 *  - quand les chiffre des unites est 1 (ex : 'trente et un' pas 'trente-un');
 *
 *  Detail du fonctionnement :
 *  Des tableaux stcokent la transcrption scripturales de tout les nombres des unites et des dizaines. Les indexes correspondent au nombre (ex : index 2 = 'deux').
 * Ensuite on le nombre en deux parties, la partie des dizaines et des unites. On ce sert ensuite de ces variables pour choisir le bon index dans les deux tableau
 *  et on concatäne ensuite les deux rÇsultat, en gÇrant les Çventuelles exceptions.
 *
 * Param Integer
 *                  num : 0 < num < 100
 * Retourne String: le nombre de des dizaines et des unites   
 *)
function ORTH(num : Integer) : string;
var
     //tableau contenant les transcriptions scripturales des nombres des untitÇs et des dizaines
    unites, dizaines : array[1..9] of String;
    //tableau contenant les transcription scripturales des exceptions 
    exceptions : array[1..7] of String;
    //u = nombre des unitÇ, t = nombre des dizaines
    u,d : integer;
begin
	unites[1] := 'un'; unites[2] := 'deux'; unites[3] := 'trois'; unites[4] := 'quatre'; unites[5] := 'cinq'; unites[6] := 'six'; unites[7] := 'sept'; unites[8] := 'huit'; unites[9] := 'neuf';
	dizaines[1] := 'dix'; dizaines[2] := 'vingt'; dizaines[3] := 'trente'; dizaines[4] := 'quarante'; dizaines[5] := 'cinquante'; dizaines[6] := 'soixante'; dizaines[7] := 'soixante-dix'; dizaines[8] := 'quatre-vingt'; dizaines[9] := 'quatre-vingt-dix';
	exceptions[1] := 'onze'; exceptions[2] := 'douze'; exceptions[3] := 'treize'; exceptions[4] := 'quatorze'; exceptions[5] := 'quinze'; exceptions[6] := 'seize'; exceptions[7] := 'quatre-vingts';
	
	if(num < 10) Then
	Begin
        ORTH := unites[num];
    end
    Else
    Begin
    	d  := Trunc(num / 10);
        u := num mod 10;
        
        //only dizaines
        if(u = 0) AND (num <> 80) Then
        Begin
        	ORTH := dizaines[d];
        End
         else if(num = 80) then
         begin
         	ORTH := exceptions[7];
        end
        //11 - 16
        else if(num > 10) AND (num < 17) Then
        begin
        	ORTH := exceptions[u];
        End
        //91 - 96
        else if (num > 90) AND (num < 97) OR  (num > 70) AND (num < 77) Then
        begin
        	if(num = 71) Then
        	begin
        		ORTH := dizaines[d -1] + '-et-' + exceptions[u];
            end
            else 
            begin
            	ORTH := dizaines[d -1] + '-' + exceptions[u];
            	end;
        	
        end
        //et un
        else if(u = 1) Then
        begin
            ORTH := dizaines[d] + ' et ' + unites[1];
        End
        Else
        //normal case
        Begin
        	ORTH := dizaines[d] + ' ' + unites[u];
        end;
    end;
end;

(*
 *  Cette fonction  prends en paramätre le nombre de centaines d'euros sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *  Traites les exceptions suivantes :
 *  -  Quand le nombre est Çgale Ö 100, renvoie 'cent' pas 'un cent'
 *  - Quand le nombre des centaines est multipliÇ par un nombre et suivis d'autre nombres renvoie 'cent' (ex : 304)
 *  - Si c'est un nombre en centaine de millier, renvoie 'cent'. Ceci est dÇterminÇ grace au Booleen 'thousand'.
 *
 * Param Integer
 *                  num : nombre de centaines, 0 < num < 1000
 *             Boolean 
 *                  thousand : si l'on traite la partie des milliers
 * Retourne String: le nombre de centaines d'euros  
 *)
 Function centaines(num : integer; thousand : Boolean) : string;
Begin
	if(num = 0) then 
	Begin
        centaines := '';
    End
     else if(num = 100) Then
     Begin
        centaines := 'cent';
     End
    //case nombre == 201, 203, 200 000 or 100...199
     else if(thousand = true) AND (num >= 100) OR (num mod 100 <> 0) AND (num > 100) OR (num < 200) AND (num >= 100)  then 
     Begin
         centaines :=  ORTH(Trunc(num / 100)) + ' cent ' + ORTH(num mod 100);
     End
     //case num == 200 - 300 - 400 etc
     Else if(num mod 100 = 0) AND (num <> 0) Then
     Begin
     	centaines :=  ORTH(trunc(num / 100)) + ' cents ';
    End
    else 
    //case num < 100
    begin
    	centaines := ORTH(num mod 100);
    	end;
end;

(*
 *  Cette fonction  prends en paramätre le nombre de millions d'euros sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *  Lorsqu'il n'y a qu'un million, renvoie 'un million' et pas 'un millions'.
 *
 * Param Integer
 *                  num : nombre de millions, 0 < num < 1000
 * Retourne String: le nombre de millions d'euros  
 *)
 Function millions(num : integer) : string;
Begin
	if(num = 0) then 
	Begin
        millions := '';
        End
     Else if(num = 1) then
     Begin
          millions := 'un million';
          End
     else
     Begin
         millions := centaines(num, FALSE) + ' millions';
         end;
end;

(*
 *  Cette fonction  prends en paramätre le nombre de milliers d'euros sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *  Lorsqu'il n'y a qu'un millier, renvoie 'mille' et pas 'un mille'.
 *  
 *
 * Param Integer
 *                  num : nombre de milliers, 0 < num < 1000
 * Retourne String: le nombre de milliers d'euros  
 *)
 Function milliers(num : integer) : string;
Begin
	if(num = 0) then 
	Begin
        milliers := '';
        End
    else if(num = 1) then
     begin
     	milliers := 'mille';
    End
    else
     Begin
         milliers := centaines(num, TRUE) +' mille';
         end;
end;

(*
 *  Cette fonction  dÇtermine la bonne orthographe du mot 'euro'. Elle traite notament de l'exception 'd'euro' lorsque
 *  le nombre est plus grand que 999 999 et que la partie des milliers des centaines est Çgale Ö 0.
 *
 * Param X
 * Retourne String: le mot 'euro' bien orthographiÇ
 *)
Function euros : String;
begin
	if(nombre > 999999.99) AND (trunc(nombre) mod 1000000 = 0) AND (trunc(nombre) mod 1000 = 0) Then
	begin
		euros := 'd''euros';
    end
    else if(Trunc(nombre) = 1) then
    Begin
    	euros := 'euro';
    end
    else if(Trunc(nombre) <> 0) Then
     Begin
    euros := 'euros'; 
    end
    else
    Begin
    	euros := '';
    End;
    
   
end;

(*
 *  Cette fonction  prends en paramätre le nombre de centimes sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *
 * Param Integer 
 *                  num : nombre de centimes
 * Retourne String: le nombre de centimes
 *)
Function centimes(num : Integer) : String;
begin 
	if(num = 0) Then
	begin
		centimes := '';
    End
    else if(num = 1) Then
    begin
    	centimes := 'un centime';
    end
    else
    Begin
    	centimes := ORTH(num) + ' centimes';
    end;
end;

