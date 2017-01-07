#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehTakeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
    if the player has room.
*/
private ["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if (isNull life_trunk_vehicle || !alive life_trunk_vehicle) exitWith {_huan = localize "STR_MISC_VehDoesntExist"; [_huan,"red","slow"] call life_fnc_notify;};
if (!alive player) exitWith {closeDialog 0;};
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; _huan = localize "STR_MISC_VehInvUse"; [_huan,"red","slow"] call life_fnc_notify;};

if ((lbCurSel 3502) isEqualTo -1) exitWith {_huan = localize "STR_Global_NoSelection"; [_huan,"red","slow"] call life_fnc_notify;};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if (!([_num] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_MISC_WrongNumFormat"; [_huan,"red","slow"] call life_fnc_notify;};
_num = parseNumber(_num);
if (_num < 1) exitWith {_huan = localize "STR_MISC_Under1"; [_huan,"red","slow"] call life_fnc_notify;};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if (_index isEqualTo -1) exitWith {};
_value = _data select _index select 1;
if (_num > _value) exitWith {_huan = localize "STR_MISC_NotEnough"; [_huan,"red","slow"] call life_fnc_notify;};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {_huan = localize "STR_NOTF_InvFull"; [_huan,"red","slow"] call life_fnc_notify;};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if (_ctrl == "money") then {
    if (_num == _value) then {
        _data deleteAt _index;
    } else {
        _data set[_index,[_ctrl,(_value - _num)]];
    };

    CASH = CASH + _num;
    [0] call SOCK_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    if ([true,_ctrl,_num] call life_fnc_handleInv) then {
        if (_num == _value) then {
            _data deleteAt _index;
        } else {
            _data set[_index,[_ctrl,(_value - _num)]];
        };
        life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
        [life_trunk_vehicle] call life_fnc_vehInventory;
    } else {
        _huan = localize "STR_NOTF_InvFull";
		[_huan,"red","slow"] call life_fnc_notify;
    };
};
