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
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>Übersicht</t></t></t><t size=1.0><br /> <br /><br />Dies ist die Übersicht vom Hilfe Menü. <br /> <br /> <br /> ERSTELLT VON AustrianNoob :) <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1 <br /> 1</t>";
	};
	case 2: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT2</t></t></t>";
	};
	case 3: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT3</t></t></t>";
	};
	case 4: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT4</t></t></t>";
	};
	case 5: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT5</t></t></t>";
	};
	case 6: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT6</t></t></t>";
	};
	case 7: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT7</t></t></t>";
	};
	case 8: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT8</t></t></t>";
	};
	case 9: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT9</t></t></t>";
	};
	case 10: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT10</t></t></t>";
	};
	case 11: {
		_desctext = "<t size=2.0><t color='#ff0000'><t underline='true'><t align='center'>TEXT11</t></t></t>";
	};
};
_textbox ctrlSetStructuredText parseText format["%1",_desctext];
_textbox ctrlSetPosition [0,0,0.425 * safezoneW,ctrlTextHeight _textbox];
_textbox ctrlCommit 0;