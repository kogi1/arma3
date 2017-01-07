#include "..\..\script_macros.hpp"
/*
    File: fn_gangWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the gang bank.
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;
group player setVariable ["gbank_in_use_by",player,true];

//Series of stupid checks
if (_value > 999999) exitWith {_huan = localize "STR_ATM_WithdrawMax";[_huan,"red","slow"] call life_fnc_notify;};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_ATM_notnumeric"; [_huan,"red","slow"] call life_fnc_notify;};
if (_value > _gFund) exitWith {_huan = localize "STR_ATM_NotEnoughFundsG"; [_huan,"red","slow"] call life_fnc_notify;};
if (_val < 100 && _gFund > 20000000) exitWith {_huan = localize "STR_ATM_WithdrawMin"; [_huan,"red","slow"] call life_fnc_notify;}; //Temp fix for something.
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {_huan = localize "STR_ATM_WithdrawInUseG"; [_huan,"red","slow"] call life_fnc_notify;}; //Check if it's in use.

_gFund = _gFund - _value;
CASH = CASH + _value;
group player setVariable ["gang_bank",_gFund,true];

if (life_HC_isActive) then {
    [1,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [1,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

_huan = format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText];
[_huan,"green","slow"] call life_fnc_notify;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewGang_BEF",_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewGang",profileName,(getPlayerUID player),_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
