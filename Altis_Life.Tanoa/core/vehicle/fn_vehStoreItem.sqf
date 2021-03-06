#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehStoreItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
    if the vehicle has room for the item.
*/
private ["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; _huan = localize "STR_MISC_VehInvUse"; [_huan,"red","slow"] call life_fnc_notify;};

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if (!([_num] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_MISC_WrongNumFormat"; [_huan,"red","slow"] call life_fnc_notify;};
_num = parseNumber(_num);
if (_num < 1) exitWith {_huan = localize "STR_MISC_Under1"; [_huan,"red","slow"] call life_fnc_notify;};

_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;

_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {_huan = localize "STR_NOTF_canOnlyStoreInLandVeh"; [_huan,"red","slow"] call life_fnc_notify;};

if (_ctrl == "money") then {
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (CASH < _num) exitWith {_huan = localize "STR_NOTF_notEnoughCashToStoreInVeh"; [_huan,"red","slow"] call life_fnc_notify;};
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    CASH = CASH - _num;
    [0] call SOCK_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {_huan = localize "STR_NOTF_VehicleFullOrInsufCap"; [_huan,"red","slow"] call life_fnc_notify;};

    if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {_huan = localize "STR_CouldNotRemoveItemsToPutInVeh"; [_huan,"red","slow"] call life_fnc_notify;};
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
};