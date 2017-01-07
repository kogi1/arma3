#include "..\..\script_macros.hpp"
/*
    File: fn_safeOpen.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the safe inventory menu.
*/
if (dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,objNull,[objNull]];
if (isNull life_safeObj) exitWith {};
if (playerSide != civilian) exitWith {};
if ((life_safeObj getVariable ["safe",-1]) < 1) exitWith {_huan = localize "STR_Civ_VaultEmpty"; [_huan,"red","slow"] call life_fnc_notify;};
if (life_safeObj getVariable ["inUse",false]) exitWith {_huan = localize "STR_Civ_VaultInUse"; [_huan,"red","slow"] call life_fnc_notify;};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
    _huan = format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
	[_huan,"red","slow"] call life_fnc_notify;
};
if (!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};

disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj setVariable ["inUse",true,true];

[life_safeObj] spawn {
    waitUntil {isNull (findDisplay 3500)};
    (_this select 0) setVariable ["inUse",false,true];
};