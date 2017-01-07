#include "..\..\script_macros.hpp"
/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
if !(playerSide isEqualTo west) exitWith {_huan = localize "STR_Cop_wantedList_notCop"; [_huan,"red","slow"] call life_fnc_notify;};
if ((lbCurSel 2406) isEqualTo -1) exitWith {_huan = localize "STR_Cop_wantedList_noPlayerSelected"; [_huan,"red","slow"] call life_fnc_notify;};
if ((lbCurSel 2407) isEqualTo -1) exitWith {_huan = localize "STR_Cop_wantedList_noCrimeSelected"; [_huan,"red","slow"] call life_fnc_notify;};
private _unit = lbData [2406,lbCurSel 2406];
_unit = call compile format ["%1",_unit];
private _amount = lbData [2407,lbCurSel 2407];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[1,"STR_Wanted_AddP",true,[_unit getVariable ["realname",name _unit],_amount,getPlayerUID _unit]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if (life_HC_isActive) then {
    [getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
    [getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};