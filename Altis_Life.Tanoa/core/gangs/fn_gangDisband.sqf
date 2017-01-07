#include "..\..\script_macros.hpp"
/*
    File: fn_gangDisband.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the user about disbanding the gang and if the user accepts the gang will be
    disbanded and removed from the database.
*/
private "_action";
_action = [
    localize "STR_GNOTF_DisbandWarn",
    localize "STR_Gang_Disband_Gang",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    _huan = localize "STR_GNOTF_DisbandGangPro";
	[_huan,"red","slow"] call life_fnc_notify;

    if (life_HC_isActive) then {
        [group player] remoteExec ["HC_fnc_removeGang",HC_Life];
    } else {
        [group player] remoteExec ["TON_fnc_removeGang",RSERV];
    };

} else {
    _huan = localize "STR_GNOTF_DisbandGangCanc";
	[_huan,"red","slow"] call life_fnc_notify;
};