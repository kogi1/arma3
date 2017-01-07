#include "..\..\script_macros.hpp"
/*
    File: fn_freezePlayer.sqf
    Author: ColinM9991

    Description:
    Freezes selected player.
*/
private ["_admin"];
_admin = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (life_frozen) then {
    _huan = localize "STR_NOTF_Unfrozen";
	[_huan,"green","slow"] call life_fnc_notify;
    [1,format [localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
    disableUserInput false;
    life_frozen = false;
} else {
    _huan = localize "STR_NOTF_Frozen";
	[_huan,"green","slow"] call life_fnc_notify;
    [1,format [localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
    disableUserInput true;
    life_frozen = true;
};
