#include "..\..\script_macros.hpp"
/*
    File: fn_seizePlayerAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the seize process..
    Based off Tonic's fn_searchAction.sqf
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {_huan = localize "STR_NOTF_CannotSeizePerson"; [_huan,"red","slow"] call life_fnc_notify;};
[player] remoteExec ["life_fnc_seizeClient",_unit];
life_action_inUse = false;