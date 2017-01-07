#include "..\..\script_macros.hpp"
/*
    File: fn_adminCompensate.sqf
    Author: ColinM9991

    Description:
    Figure it out.
*/
private ["_value","_action"];
if (FETCH_CONST(life_adminlevel) < 2) exitWith {closeDialog 0; _huan = localize "STR_ANOTF_ErrorLevel"; [_huan,"red","slow"] call life_fnc_notify;};
_value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {_huan = localize "STR_ANOTF_Fail" [_huan,"red","slow"] call life_fnc_notify;};

_action = [
    format [localize "STR_ANOTF_CompWarn",[_value] call life_fnc_numberText],
    localize "STR_Admin_Compensate",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    CASH = CASH + _value;
    _huan = format [localize "STR_ANOTF_Success",[_value] call life_fnc_numberText];
    [_huan,"red","slow"] call life_fnc_notify;
	closeDialog 0;
} else {
    _huan = localize "STR_NOTF_ActionCancel";
    [_huan,"red","slow"] call life_fnc_notify;
	closeDialog 0;
};
