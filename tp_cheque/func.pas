(*
 *  Demande un nombre Ö l'utilisateur et renvoie si celui-ci est compris entre 0.01 et 999 999 999.99
 *
 *  Param X
 *  Retourne Booleen : si le nombre est compris entre 0.01 et 999 999 999.99
 *)
function getInput: Boolean;
begin
	WriteLn('Saisissez un nombre : ');
	read(number);
	getInput := (number >= 0.01) AND (number <= 999999999.99);
end;

(*
 *  Stocke dans un tableaux la dÇcomposition du nombre 4 parties.
 *  Index 0 : partie des millions, index 1 : partie des milliers, index 2 : parties des centaines, index 3 : partie dÇcimale
 *
 * Param X
 *)
Procedure decompose;
begin
	
	tabPtr^[0] := floor(number / 1000000);
    tabPtr^[1] := floor(number / 1000) mod 1000;
	tabPtr^[2] := floor(number) mod 1000;
	tabPtr^[3] := round(number * 100) mod 100;
	
end;
    
(*
 *  Cette fonction  prends en paramätre un nombre compris entre 0 et 99 sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *  Traites les exceptions suivantes :
 *  -  91...96 et 71...76 (ex : 'soixante-seize' pas 'soizante-dix-six')
 *  - 11...16 (ex : 'seize' pas 'dix-six')
 *  - 80
 *  - quand les chiffre des unitÇs est 1 (ex : 'trente et un' pas 'trente-un');
 *
 *  Detail du fonctionnement :
 *  Des tableaux stcokent la transcrption scripturales de tout les nombres des unitÇs et des dizaines. Les indexes correspondent au nombre (ex : index 2 = 'deux').
 * Ensuite on le nombre en deux parties, la partie des dizaines et des unitÇs. On ce sert ensuite de ces variables pour choisir le bon index dans les deux tableau
 *  et on concatäne ensuite les deux rÇsultat, en gÇrant les Çventuelles exceptions.
 *
 * Param Integer
 *                  num : 0 < num < 100
 * Retourne String: le nombre de des dizaines et des unitÇs   
 *)
function getTens(num : Integer) : string;
var
     //tableau contenant les transcriptions scripturales des nombres des untitÇs et des dizaines
    units, tens : array[0..9] of String;
    //tableau contenant les transcription scripturales des exceptions 
    exceptions : array[1..10] of String;
    //u = nombre des unitÇ, t = nombre des dizaines
    u,t : integer;
begin
	units[0] := ''; units[1] := 'un'; units[2] := 'deux'; units[3] := 'trois'; units[4] := 'quatre'; units[5] := 'cinq'; units[6] := 'six'; units[7] := 'sept'; units[8] := 'huit'; units[9] := 'neuf';
	tens[1] := 'dix'; tens[2] := 'vingt'; tens[3] := 'trente'; tens[4] := 'quarante'; tens[5] := 'cinquante'; tens[6] := 'soixante'; tens[7] := 'soixante-dix'; tens[8] := 'quatre-vingt'; tens[9] := 'quatre-vingt-dix';
	exceptions[1] := 'onze'; exceptions[2] := 'douze'; exceptions[3] := 'treize'; exceptions[4] := 'quatorze'; exceptions[5] := 'quinze'; exceptions[6] := 'seize'; exceptions[7] := 'quatre-vingts';
	
	if(num < 10) Then
	Begin
        getTens := units[num];
    end
    Else
    Begin
    	t  := Trunc(num / 10);
        u := num mod 10;
        
        //only tens
        if(u = 0) AND (num <> 80) Then
        Begin
        	getTens := tens[t];
        End
         else if(num = 80) then
         begin
         	getTens := exceptions[7];
        end
        //11 - 16
        else if(num > 10) AND (num < 17) Then
        begin
        	getTens := exceptions[u];
        End
        //91 - 96
        else if (num > 90) AND (num < 97) OR  (num > 70) AND (num < 77) Then
        begin
        	getTens := tens[t -1] + '-' + exceptions[u];
        end
        //et un
        else if(u = 1) Then
        begin
            getTens := tens[t] + ' et ' + units[1];
        End
        Else
        //normal case
        Begin
        	getTens := tens[t] + ' ' + units[u];
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
 Function getHundreds(num : integer; thousand : Boolean) : string;
Begin
	if(num = 0) then 
	Begin
        getHundreds := '';
    End
     else if(num = 100) Then
     Begin
        getHundreds := 'cent';
     End
    //case number == 201, 203, 200 000 or 100...199
     else if(thousand = true) AND (num >= 100) OR (num mod 100 <> 0) AND (num > 200) OR (num < 200) AND (num >= 100)  then 
     Begin
         getHundreds :=  getTens(Trunc(num / 100)) + ' cent ' + getTens(num mod 100);
     End
     //case num == 200 - 300 - 400 etc
     Else if(num mod 100 = 0) AND (num <> 0) Then
     Begin
     	getHundreds :=  getTens(trunc(num / 100)) + ' cents ';
    End
    else 
    //case num < 100
    begin
    	getHundreds := getTens(num mod 100);
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
 Function getMillions(num : integer) : string;
Begin
	if(num = 0) then 
	Begin
        getMillions := '';
        End
     Else if(num = 1) then
     Begin
          getMillions := 'un million';
          End
     else
     Begin
         getMillions := getHundreds(num, FALSE) + ' millions';
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
 Function getThousands(num : integer) : string;
Begin
	if(num = 0) then 
	Begin
        getThousands := '';
        End
    else if(num = 1) then
     begin
     	getThousands := 'mille';
    End
    else
     Begin
         getThousands := getHundreds(num, TRUE) +' mille';
         end;
end;

(*
 *  Cette fonction  dÇtermine la bonne orthographe du mot 'euro'. Elle traite notament de l'exception 'd'euro' lorsque
 *  le nombre est plus grand que 999 999 et que la partie des milliers des centaines est Çgale Ö 0.
 *
 * Param X
 * Retourne String: le mot 'euro' bien orthographiÇ
 *)
Function getEuros : String;
begin
	if(number > 999999.99) AND (trunc(number) mod 1000000 = 0) AND (trunc(number) mod 1000 = 0) Then
	begin
		getEuros := 'd''euros';
    end
    else if(Trunc(number) = 1) then
    Begin
    	getEuros := 'euro';
    end
    else if(Trunc(number) = 0) Then
    Begin
    	getEuros := '';
    End
    else
    Begin
    getEuros := 'euros'; 
	end;
end;

(*
 *  Cette fonction  prends en paramätre le nombre de centimes sous forme numÇrique et renvoie
 *  son Çquivalent sous forme de chaåne de caractäre.
 *
 * Param Integer 
 *                  num : nombre de centimes
 * Retourne String: le nombre de centimes
 *)
Function getCents(num : Integer) : String;
begin 
	if(num = 0) Then
	begin
		getCents := '';
    End
    else if(num = 1) Then
    begin
    	getCents := 'un centime';
    end
    else
    Begin
    	getCents := getTens(num) + ' centimes';
    end;
end;

