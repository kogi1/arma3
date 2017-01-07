#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: NiiRoZz
    Description:
    Display markers for all players
*/
if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; _huan = localize "STR_ANOTF_ErrorLevel"; [_huan,"red","slow"] call life_fnc_notify;};

[] spawn TON_fnc_MapMarkersAdmin;
