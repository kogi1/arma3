/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoErgebnis.sqf
	Beschreibung:
		Überprüft die Personalausweisdaten auf das richtige Format (Strings) und weist den Personalausweis dem Spieler zu.
		
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
_text = [_this,0,[],[[]]] call BIS_fnc_param;
if(_text isEqualTo []) exitWith {0 cutText ["Fehler: Personalausweis muss angelegt werden","BLACK FADED"]; 0 cutFadeOut 9999999; [] call fvs_fnc_persoNeu};
if((count _text) < 15 || (count _text) > 15 || !(_this isEqualType [])) exitWith {endMission "fehlerprof";};
if(!((_text select 0) isEqualTo profileName)) exitWith {
	[(_text select 0)] spawn {
		[
			format["Du hast dich versucht mit einem anderem Profilname (%1) anzumelden, aber '%2' ist für den Personalausweis hinterlegt! Ändere deinen Namen im Profil oder melde dich beim Support im Teamspeak auf %3 oder im Forum unter <a href='http://%4'>%4</a></t>",profileName, _this select 0,getText(missionConfigFile >> "server" >> "ts"),getText(missionConfigFile >> "server" >> "web")],
			"Personalausweis - Falscher Name - Case-Sensitive (Groß-/Kleinschreibung)",
			"Verstanden",
			false
		] call BIS_fnc_guiMessage;
		endMission "falschprof";
	};
};
if(!(_text isEqualTypeArray ["","","","","","","","","","","","","","",""]) || (typeName _text != "ARRAY")) exitWith {endMission "fformatprof";};
_name = _text select 0;
_alter = _text select 1;
_sex = _text select 2;
_bltg = _text select 3;
_stra = _text select 4;
_handynr = _text select 5;
_email = _text select 6;
_cm = _text select 7;
_kg = _text select 8;
_t = _text select 9;
_m = _text select 10;
_j = _text select 11;
_plz = _text select 12;
_hsnr = _text select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_text select 12) >> "name");
_bildID = _text select 14;
_bildName = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _bildID >> "name");
hint parseText format["Daten des Personalausweises im Ueberblick:<br/><br/>Name: %1<br/>Strasse: %2 %3<br/>Plz/Ort: %4 %5<br/><br/>Email: %6<br/>Handynummer: 0%7<br/>Koerpergroesse: %8cm<br/>Gewicht: %9kg<br/>Alter: %10 Jahre<br/>Geburtsdatum: %11 %12 %13<br/>Blutgruppe: %14<br/><br/>Fotobezeichnung: %15 %16",_name,_stra,_hsnr,_plz,_wohnort,_email,_handynr,_cm,_kg,_alter,_t,_m,_j,_bltg,_bildID,_bildName];
//[_huan,"green","slow"] call life_fnc_notify;
player setVariable ["personaltext",_text,true];
fvs_persoReady = true;