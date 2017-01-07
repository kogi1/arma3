#include "..\..\script_macros.hpp"
/*
 File: fn_notification_system.sqf
 Date: 2016-07-23 18:15:17
 Author: Patrick "Lucian" Schmidt
 Description:
 Arguments:
 
 ["TEXT","color","fast"] call life_fnc_notification_system;
 red
 orange
 yellow
 green
 blue
 lightblue
 darkblue
 
0: Text <STRING>
1: Type <BOOLEAN> false = noError true = Error
2: Speed <STRING> fast = fadeout nach 5 sek, slow = fadeout nach 15 sek
 
 0: Text <STRING>
 1: Type <BOOLEAN>
 2: Speed <STRING>
*/
params[
 "_text",
 "_color",
 ["_speed","",[""]]
];
if (isServer || !hasInterface) exitWith {};
disableSerialization;
_display = finddisplay 46;
playSound "notifyme";
/*
switch (_color) do {
    case ("red"): {_headerColor = [0.79,0,0,0.7]};
    case ("orange") : {_headerColor = [0.92,0.51,0.7]};
    case ("yellow") : {_headerColor = [0.96,0.9,0,0.7]};
    case ("green") : {_headerColor = [0.16,0.95,0,0.7]};
    case ("blue") : {_headerColor = [0,0.11,0.74,0.7]};
    case ("lightblue") : {_headerColor = [0,0.49,0.8,0.7]};
    case ("darkblue") : {_headerColor = [0.05,0.03,0.38,0.7]};
    default {_headerColor = [0.16,0.95,0,0.7]};
};
*/


private _headerColor = if(_color == "green")then{
	[0.16,0.95,0,0.8];
}else{
	if(_color == "red")then{
		[0.79,0,0,0.8];
	}else{
		if(_color == "orange")then{
			[0.92,0.51,0.8];
		}else{
			if(_color == "blue")then{
				[0,0.11,0.74,0.8];
			}else{
				[0.16,0.95,0,0.8];
			};
		};
	};
};

if (_text isEqualType "") then {
 _text = parseText _text;
};
private _Header = _display ctrlCreate ["RscText", -1];
_Header ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.01 * safezoneH + safezoneY, 0.2 * safezoneW, 0.011 * safezoneH];
_Header ctrlSetBackgroundColor _headerColor;
_Header ctrlSetFade 1;
_Header ctrlCommit 0;
_Header ctrlSetFade 0;
_Header ctrlCommit 0.4;
private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText _text;
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.2 * safezoneW, 0.5];
_TextField ctrlCommit 0;
_TextField ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.2 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlSetBackgroundColor [0,0,0,0.75];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;
_TextField ctrlSetFade 0;
_TextField ctrlCommit 0.4;
[_TextField,_Header,_speed] spawn {
 disableSerialization;
 if (_this select 2 isEqualTo "fast") then {
 uiSleep 5;
 } else {
 uiSleep 10;
 };
 private _TextField = _this select 0;
 private _Header = _this select 1;
 _TextField ctrlSetFade 1;
 _TextField ctrlCommit 0.3;
 _Header ctrlSetFade 1;
 _Header ctrlCommit 0.3;
 uiSleep 0.3;
 ctrlDelete _Header;
 ctrlDelete _TextField;
};
private _posText = (ctrlPosition (_TextField)) select 1;
private _posHeader = (ctrlPosition (_Header)) select 1;
private _textHigh = (ctrlPosition (_TextField)) select 3;
if (count life_open_notifications > 0) then {
 private _activeNotifications = 0;
 {
 private _ctrlHeader = _x select 0;
 private _ctrlText = _x select 1;
 if (!isNull _ctrlHeader && !isNull _ctrlText) then {
 _ctrlHeader ctrlSetPosition [0.005 * safezoneW + safezoneX, (_posHeader + _textHigh + 1.5*(0.011 * safezoneH))];
 _ctrlText ctrlSetPosition [0.005 * safezoneW + safezoneX, (_posText + _textHigh + 1.5*(0.011 * safezoneH))];
 _ctrlHeader ctrlCommit 0.25;
 _ctrlText ctrlCommit 0.25;
 _posText = (_posText + _textHigh + 1.5*(0.011 * safezoneH));
 _posHeader = (_posHeader + _textHigh + 1.5*(0.011 * safezoneH));
 _textHigh = (ctrlPosition (_ctrlText)) select 3;
 if (_activeNotifications > 3) then {
 _ctrlText ctrlSetFade 1;
 _ctrlHeader ctrlSetFade 1;
 _ctrlText ctrlCommit 0.2;
 _ctrlHeader ctrlCommit 0.2;
 };
 _activeNotifications = _activeNotifications + 1;
 };
 } forEach life_open_notifications;
};
life_open_notifications = ([[_Header,_TextField]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)}; // Add the Element to the Front of the Array and remove the deleted Arrays