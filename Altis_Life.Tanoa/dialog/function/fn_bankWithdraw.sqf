#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {_huan = localize "STR_ATM_WithdrawMax"; [_huan,"red","slow"] call life_fnc_notify;};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_ATM_notnumeric"; [_huan,"red","slow"] call life_fnc_notify;};
if (_value > BANK) exitWith {_huan = localize "STR_ATM_NotEnoughFunds"; [_huan,"red","slow"] call life_fnc_notify;};
if (_value < 100 && BANK > 20000000) exitWith {_huan = localize "STR_ATM_WithdrawMin"; [_huan,"red","slow"] call life_fnc_notify;}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
_huan = format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText];
[_huan,"green","slow"] call life_fnc_notify;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
