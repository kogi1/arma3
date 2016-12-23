/*
 *
 *	@File:		holy_script.sqf
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 */
private ["_display","_auswahl","_uid","_dialogID","_desctext","_posDG"];
disableSerialization;
_auswahl = (_this select 0);
_uid = getPlayerUID player;
_dialogID = 1337; //IDD
_dialog = (findDisplay _dialogID);
_textbox = _dialog displayCtrl 1338;
_posDG = ctrlPosition _textbox;


if(!dialog) then {createDialog "holy_help"}; //Thefuck?
waitUntil {!isNull (_dialog)};

switch(_auswahl) do {
	default {hint "Da ist wohl ein Fehler untergekommen...#Default"};
	case 0: {hint "Da ist wohl ein Fehler untergekommen...#case0"};
	//Auswahl
	case 1: {
		_desctext = "<t size='2.0'>
						<t color='#ff0000'>
							<t underline='true'>
								<t align='center'>Informationen</t>
							</t>
						</t>
						<t size='1.0'>
						<br /> 
							<br />
								<br />
									<t align='center'>
										<t shadow='2'>
										Allgemeine Übersicht
										</t>
									</t>
								<br /> 
							<br /> 
						<br /> 
						<br /> Unser Forum: <t colorLink='#0000ff'><a href='http://forum.pk-tanoa.ovh'>Zum Forum</a></t>
						<br /> Unser Ts3-Server: <t colorLink='#0000ff'><a href='ts3server://ts.pk-tanoa.ovh'>Zum Teamspeak</a></t> 
						<br />  
						<br /> Sollten die oben angeführten Links nicht funktionieren, sind hier nocheinmal die Informationen im Klartext: 
						<br /> Forum: https://forum.pk-tanoa.ovh
						<br /> Teamspeak 3 Server: ts3.pk-tanoa.ovh
						<br />  
						<br />  
						<br /> Brauchst du Hilfe oder hast du Fragen?  
						<br /> Dann komm auf unseren Teamspeak unter den Supportbereich und fordere mit entsprechenden Grund Talkpower an.
						<br /> Alle unsere Supporter sind sehr bemüht deinen Fall so schnell wie möglich zu bearbeiten.
						<br />  
						<br /> 
						<br /> 
						<br /> Willst du zur Polizei oder Rettung?
						<br /> Dann informiere und bewerbe dich in unserem Forum.
						<br /> 
						<br /> 
						<br /> 
						<br /> 
						<br /> Wenn du Lust hast im Team mitzuwirken, dann versuch doch deine Chance und bewerbe dich im Forum.
						<br />  
						<br /> 
						<br /> 
						<br /> Auch nehmen wir gerne Spenden entgegen, somit kannst du uns bei der Entwicklung unseres Servers unterstützen. 
						<br /> Alle Infos findest du im Forum oder am TS.
						<br />  
						<br />  
						<br /> <t align='center'>Ein großes Dankeschön an SolidShot und LPGamingTV</t>
						<br />  
						<br />  
						<br />  
						<br />  
						<br />  
						<br />  
						<br />  
						<br /> 
					</t>";
	};
	case 2: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Regelwerk</t></t></t></t>
						<br />
						<br />
						<br />
						<br /> <t colorLink='#ff0000'><a href='http://forum.pk-tanoa.ovh/index.php?thread/2-aktuelles-regelwerk'>Alle aktuellen Regeln findest du im Forum.</a></t>
						<br /> Unwissenheit schützt nicht vor Strafe!
						<br />
						<br /> RDM führt zum Spielausschluss!
						<br /> VDM führt zum Spielausschluss!
						<br /> Bugusing führt zum Spielausschluss!
						<br /> (Bugs müssen sofort im Forum gemeldet werden)
						<br />
						<br /> Wenn Fragen aufkommen steht dir gerne der Support zu Verfügung.
						<br />
						<br />
						<br />
						<br />
						<br />
						<br /> Die Geschwindigkeiten sind einzuhalten:
						<br /> Freilandstraßen: 100km/h
						<br /> In Städten mit Vorangstraße: 60km/h
						<br /> In Städten ohne Vorangstraße: 30km/h
						<br />
						<br />
						<br />
						<br />
						<br /> 
						<br />
						";
	};
	case 3: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Steuerung</t></t></t></t>
						<br />
						<br />
						<br />
						<br /> Z: Spieler Menü und Telefon
						<br /> U: Auf- und Zusperren von Fahrzeugen und Häusern
						<br /> T: Kofferraum vom Fahrzeug öffnen
						<br /> Left Shift + C: Ergeben (Hände auf den Kopf)
						<br /> Left Shift + B: Als Rebelle Personen fesseln (Rebellenlizenz und Kabelbinder benötigt)
						<br /> Left Windows: Interaktions Menu (Fahrzeuge, Personen, Häuser, ATMs,...) Kann unter ESC->Configure->Controls->Custom->Use Action 10 umgestellt werden
						<br /> Left Shift + H: Waffen holstern
						<br /> Left Ctrl + H: Waffen enholstern
						<br /> Shift + Spacebar: Jump
						<br /> ENDE: Ohrenstöpsel
						<br /> Left Shift + G: ausrauben
						<br /> Q: Blinker Links
						<br /> E: Blinker Rechts
						<br /> G: Warnblinker
						<br /> NUM 1: Gestik Hi
						<br /> NUM 2: Gestik Hi 2
						<br /> NUM 3: Gestik Hi 3
						<br /> NUM 4: Gestik Jap
						<br /> NUM 5: Gestik Legpush 
						<br />
						<br />
						<br />
						<br /> <t align='center'>Polizei und Medic</t>
						<br /> F: Fahrzeug-Sirene und Barrieren Menü
						<br /> L: Speed radar (police only and weapon is P07 Suppressed)
						<br /> Left Shift + L: Activates siren lights
						<br /> Left Shift + R: Restrain (police only)
						<br /> O: Schranken und Türen öffnen
						<br />
						<br />
						<br />
						<br />
						<br />
						";
	};
	case 4: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Fahrzeugpreise</t></t></t></t>
						<br />
						<br />
						<br /> <t align='center'>Bald verfügbar...</t>
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						";
	};
	case 5: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Lizenzpreise</t></t></t></t>
						<br />
						<br />
						<br /> Führerschein [B]:      500$
						<br /> Führerschein [C]:    20000$
						<br /> Pilotenschein:      250000$
						<br /> Bootschein:          10000$
						<br /> Taucherzulassung:      900$
						<br /> Eigentumsurkunde:   750000$
						<br /> Waffenschein:       100000$
						<br /> Rebellenausbildung: 750000$
						<br /> 
						<br />
						<br />
						<br />
						<br /> <t size='2.0'><t color='#07EB18'><t align='center'>Verarbeitungslizenzen</t></t></t>
						<br /> Öl Verarbeitung:        10000$
						<br /> Daimant Verarbeitung:   35000$
						<br /> Salz Verarbeitung:      12000$
						<br /> Sand Verarbeitung:      14500$
						<br /> Eisen Verarbeitung:      9500$
						<br /> Kupfer Verarbeitung:     8000$
						<br /> Zement Verarbeitung:     6500$
						<br /> Med. Marijuana Verarb.: 15000$
						<br />
						<br />
						<br /> <t color='#ff0000'><t align='center'>Illegal</t></t>
						<br /> Kokain Verarbeitung:    30000$
						<br /> Heroin Verarbeitung:    25000$
						<br /> Marijuana Verarbeitung: 19500$
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						";
	};
	case 6: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Farmrouten</t></t></t></t>
						<br />
						<br />
						<br /> <t align='center'>Bald verfügbar...</t>
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						";
	};
	case 7: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Events</t></t></t></t>
						
						<br />
						<br />
						<br /> Alle Informationen findest du im Forum oder im Teamspeak unter dem Event-Channel.
						<br />
						<br /> Alle zwei Wochen findet ein Event statt.
						<br />
						<br />
						<br />
						<br /> Event Manager:
						<br /> - AnthonyX
						<br /> - Lukas
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />";
	};
	case 8: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>Unser Team</t></t></t></t>
						<br />
						<br />
						<br /> <t color='#ff9B00'>Serverleitung:</t>
						<br /> Winston
						<br /> Chrination
						<br />
						<br />
						<br /> <t color='#ff0000'>Admin:</t>
						<br /> David Hoffmann
						<br /> Rääph
						<br />
						<br />
						<br /> <t color='#066A02'>Supportleitung:</t>
						<br /> Swift_012
						<br /> Zen17
						<br />
						<br />
						<br /> <t color='#001FFF'>Supporter:</t>
						<br /> Adrian
						<br /> Mr.SatanicSheep
						<br /> AnthonyX
						<br /> Cologne
						<br />
						<br />
						<br /> <t color='#ABABAB'>Mapper:</t>
						<br /> Rääph
						<br />
						<br />
						<br /> <t color='#36FF00'>Scripter:</t>
						<br /> Winston
						<br /> Rääph
						<br />
						<br />
						<br /> <t color='#FFF300'>Foren-Admin:</t>
						<br /> Rääph
						<br /> Winston
						<br />
						<br /> <t color='#490000'>TS3-Techniker:</t>
						<br /> Zen17
						<br />
						<br />
						<br /> <t color='#00FFFF'>Event-Manager:</t>
						<br /> AnthonyX
						<br /> Lukas
						<br />
						<br />
						<br /> <t color='#9BAE00'>Designer</t>
						<br /> Lukas
						<br />
						<br />
						<br />
						<br />
						<br /> <t align='center'>Das gesamte Serverteam wünscht dir viel Spaß am Server.</t>
						<br /> 
						<br />
						<br />
						<br />
						<br />
						";
	};
	case 9: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>...</t></t></t>";
	};
	case 10: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>...</t></t></t>";
	};
	case 11: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>...</t></t></t>";
	};
};
_textbox ctrlSetStructuredText parseText format["%1",_desctext];
_textbox ctrlSetPosition [0,0,0.425 * safezoneW,ctrlTextHeight _textbox];
_textbox ctrlCommit 0;