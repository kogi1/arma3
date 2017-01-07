#include "..\..\script_macros.hpp"
/*
    File: fn_safeTake.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private ["_ctrl","_num","_safeInfo"];
disableSerialization;

if ((lbCurSel 3502) isEqualTo -1) exitWith {_huan = localize "STR_Civ_SelectItem"; [_huan,"red","slow"] call life_fnc_notify;};
_ctrl = CONTROL_DATA(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable ["safe",0];

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_MISC_WrongNumFormat"; [_huan,"red","slow"] call life_fnc_notify;};
_num = parseNumber(_num);
if (_num < 1) exitWith {_huan = localize "STR_Cop_VaultUnder1"; [_huan,"red","slow"] call life_fnc_notify;};
if (!(_ctrl isEqualTo "goldBar")) exitWith {_huan = localize "STR_Cop_OnlyGold"; [_huan,"red","slow"] call life_fnc_notify;};
if (_num > _safeInfo) exitWith {_huan = format [localize "STR_Civ_IsntEnoughGold",_num]; [_huan,"red","slow"] call life_fnc_notify;};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {_huan = localize "STR_NOTF_InvFull"; [_huan,"red","slow"] call life_fnc_notify;};


//Take it
if (!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {_huan = localize "STR_NOTF_CouldntAdd"; [_huan,"red","slow"] call life_fnc_notify;};
life_safeObj setVariable ["safe",_safeInfo - _num,true];
[life_safeObj] call life_fnc_safeInventory;
