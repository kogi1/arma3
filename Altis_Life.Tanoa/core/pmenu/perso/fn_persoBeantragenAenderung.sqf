/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoBeantragenAenderung.sqf
	Beschreibung:
		Überprüft nochmal die Eingaben/Auswahlen des Personalausweises und schickt die dann zum Server.
		
	Sie dürfen meine Funktionen/Scripte nur mit der "License-FvS.txt" nutzen sowie der Einhaltung der Regeln.
		Im Missionshauptverzeichnis oder in einem leicht zu findenen Ordner muss die "License-FvS.txt" vorhanden sein!
			Beispiel-Pfad: 
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
	You are only allowed to use my scripts/functions with my littly "License-FvS.txt" and the agreements to the rules.
		The "License-FvS.txt" has to be in your mission root folder or in an easy to finding folder
			Destination example:
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
*/
if(playerside != civilian) exitWith {}; 
disableSerialization;
if((lbCurSel 70003) == -1) exitWith {};
if((lbCurSel 70004) == -1) exitWith {};
if((lbCurSel 70006) == -1) exitWith {};
if((lbCurSel 70007) == -1) exitWith {};
if((lbCurSel 70008) == -1) exitWith {};
if((lbCurSel 70009) == -1) exitWith {};
if((lbCurSel 70010) == -1) exitWith {};
if((lbCurSel 70013) == -1) exitWith {};
if((lbCurSel 70018) == -1) exitWith {};
if((lbCurSel 70011) == -1) exitWith {};
if((lbCurSel 70012) == -1) exitWith {};
if(ctrlText 70002 == "" && fvs_namenInfo) exitWith {_huan = "Du willst den Namen zwar aendern, aber es ist kein Neuer angegeben. Name darf nicht leer sein und mindestens 4 Zeichen enthalten!"; [_huan,"red","slow"] call life_fnc_notify;};
if(life_cash < 250000) exitWith {_huan = parseText format ["Du hast nicht genug Geld auf der Hand.<br/>Aktuell: $%2<br/>Fehlend: $%1",(250000 - life_cash), life_cash]; [_huan,"red","slow"] call life_fnc_notify;};
_sex = call compile format ["%1",lbData[70003,(lbCurSel 70003)]];
_cm = call compile format ["%1",lbValue[70004,(lbCurSel 70004)]];
_kg = call compile format ["%1",lbValue[70006,(lbCurSel 70006)]];
_blg = call compile format ["%1",lbData[70007,(lbCurSel 70007)]];
_bT = call compile format ["%1",lbValue[70008,(lbCurSel 70008)]];
_bM = call compile format ["%1",lbValue[70009,(lbCurSel 70009)]];
_bJ = call compile format ["%1",lbValue[70010,(lbCurSel 70010)]];
_plzst = call compile format ["%1",lbValue[70013,(lbCurSel 70013)]];
_str = call compile format ["%1",lbData[70011,(lbCurSel 70011)]]; 
_hausnr = call compile format ["%1",lbValue[70012,(lbCurSel 70012)]]; 
_bildID = call compile format ["%1",lbValue[70018,(lbCurSel 70018)]]; 
_insert = [];
if(fvs_namen_a) then {
	_insert pushBack (ctrlText 70002);
} else {
	_insert pushBack profileName;
};
_insert pushBack str((date select 0) - _bJ);
_insert pushBack _sex;
_insert pushBack _blg;
_insert pushBack _str;
_insert pushBack fvs_handynr;
_insert pushBack fvs_email;
_insert pushBack str(_cm);
_insert pushBack str(_kg);
_insert pushBack str(_bT);
_insert pushBack str(_bM);
_insert pushBack str(_bJ);
_insert pushBack str(_plzst);
_insert pushBack str(_hausnr);
_insert pushBack str(_bildID);
_uid = (getplayerUID player);
_side = side player;
[_insert,_uid,_side,player] remoteExec ["DB_fnc_persoUpdate",2];

_name = _insert select 0;
_alter = _insert select 1;
_sex = _insert select 2;
_bltg = _insert select 3;
_stra = _insert select 4;
_email = _insert select 6;
_cm = _insert select 7;
_kg = _insert select 8;
_t = _insert select 9;
_m = _insert select 10;
_j = _insert select 11;
_plz = _insert select 12;
_hsnr = _insert select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_insert select 12) >> "name");
_bildID = _insert select 14;
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
closeDialog 0;
if(fvs_namen_a) then {
	_huan = parseText format ["Du hast deinen Personalausweis geaendert. Du wirst automatisch nach 5 Minuten aus dem Spiel entfernt, damit du dein Profilnamen aendern kannst. Es wurde eine Gebuehr von $250.000 erhoben.<br/><br/>Daten des Personalausweises im Ueberblick:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Koerpergroesse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11 %12 %13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,fvs_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
	[_huan,"green","slow"] call life_fnc_notify;
	player setVariable ["personaltext",_insert,true];
	fvs_namen_a = false;
	fvs_checking_a = false;
	life_cash = life_cash - 250000;
	[] call SOCK_fnc_updateRequest;
	sleep (60 * 5);
	endMission "persoA";
} else {
	_huan = parseText format ["Du hast deinen Personalausweis geaendert. Es wurde eine Gebuehr von $250.000 erhoben. <br/><br/>Daten des Personalausweises im Ueberblick:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Koerpergroesse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11 %12 %13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,fvs_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
	[_huan,"green","slow"] call life_fnc_notify;
	player setVariable ["personaltext",_insert,true];
	fvs_namen_a = false;
	fvs_checking_a = false;
	life_cash = life_cash - 250000;
	[] call SOCK_fnc_updateRequest;
};