#include "..\..\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "life_session_time") then {life_session_time = false;};
if (life_session_time) exitWith {_huan = localize "STR_Session_SyncdAlready"; [_huan,"red","slow"] call life_fnc_notify;};

[] call SOCK_fnc_updateRequest;
_huan = localize "STR_Session_SyncData";
[_huan,"green","slow"] call life_fnc_notify;
[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};
