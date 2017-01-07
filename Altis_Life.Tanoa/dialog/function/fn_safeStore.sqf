#include "..\..\script_macros.hpp"
/*
    File: fn_safeStore.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private ["_ctrl","_num"];
disableSerialization;
_ctrl = CONTROL_DATA(3503);
_num = ctrlText 3506;

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_MISC_WrongNumFormat"; [_huan,"red","slow"] call life_fnc_notify;};
_num = parseNumber(_num);
if (_num < 1) exitWith {_huan = localize "STR_Cop_VaultUnder1"; [_huan,"red","slow"] call life_fnc_notify;};
if (!(_ctrl isEqualTo "goldBar")) exitWith {_huan = localize "STR_Cop_OnlyGold"; [_huan,"red","slow"] call life_fnc_notify;};
if (_num > life_inv_goldbar) exitWith {_huan = format [localize "STR_Cop_NotEnoughGold",_num]; [_huan,"red","slow"] call life_fnc_notify;};

//Store it.
if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {_huan = localize "STR_Cop_CantRemove"; [_huan,"red","slow"] call life_fnc_notify;};
_safeInfo = life_safeObj getVariable ["safe",0];
life_safeObj getVariable ["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;
