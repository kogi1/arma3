#include "..\..\script_macros.hpp"
/*
 Player clicked arrest/ok
*/
private ["_time"];
if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {};
//Get minutes
_time = ctrlText 1400;
if(! ([_time] call TON_fnc_isnumber)) exitWith {
 _huan = localize "STR_ATM_notnumeric";
 [_huan,"red","slow"] call life_fnc_notify;
};
_time = parseNumber _time; //requested number
_time = round _time;
if(_time < 5 || _time > 120) exitWith { _huan = "Die Zeit muss zwischen 5 und 60 Monaten liegen!"; [_huan,"red","slow"] call life_fnc_notify;};
closeDialog 0;
[life_pInact_curTarget, _time] call life_fnc_arrestAction;