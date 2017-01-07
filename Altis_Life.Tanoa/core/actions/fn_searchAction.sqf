/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
_huan = localize "STR_NOTF_Searching";
[_huan,"red","slow"] call life_fnc_notify;
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {_huan = localize "STR_NOTF_CannotSearchPerson"; [_huan,"red","slow"] call life_fnc_notify;};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;