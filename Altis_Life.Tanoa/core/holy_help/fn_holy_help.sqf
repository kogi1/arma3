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
						<br /> Sollten die oben angeführten Links nicht funktionieren, sind hier nocheinmal die Informationen im Klartest: 
						<br /> Forum: https://forum.pk-tanoa.ovh
						<br /> Teamspeak 3 Server: ts3.pk-tanoa.ovh
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1 
						<br /> 1
					</t>";
	};
	case 2: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT2</t></t></t>";
	};
	case 3: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT3</t></t></t>";
	};
	case 4: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT4</t></t></t>";
	};
	case 5: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT5</t></t></t>";
	};
	case 6: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT6</t></t></t>";
	};
	case 7: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT7</t></t></t>";
	};
	case 8: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT8</t></t></t>";
	};
	case 9: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT9</t></t></t>";
	};
	case 10: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT10</t></t></t>";
	};
	case 11: {
		_desctext = "<t size='2.0'><t color='#ff0000'><t underline='true'><t align='center'>TEXT11</t></t></t>";
	};
};
_textbox ctrlSetStructuredText parseText format["%1",_desctext];
_textbox ctrlSetPosition [0,0,0.425 * safezoneW,ctrlTextHeight _textbox];
_textbox ctrlCommit 0;