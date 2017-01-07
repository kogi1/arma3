/*
    File: fn_keyDrop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Drops the key.
*/
private ["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if (_sel isEqualTo -1) exitWith {_huan = localize "STR_NOTF_noDataSelected";[_huan,"red","slow"] call life_fnc_notify;};
if ((_list lbData _sel) isEqualTo "") exitWith {_huan = localize "STR_NOTF_didNotSelectVehicle";[_huan,"red","slow"] call life_fnc_notify;};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;
if (_vehicle isKindOf "House_F") exitWith {_huan = localize "STR_NOTF_cannotRemoveHouseKeys";[_huan,"red","slow"] call life_fnc_notify;};
_owners = _vehicle getVariable "vehicle_info_owners";

_index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
life_vehicles = life_vehicles - [_vehicle];
_owners deleteAt _index;
_vehicle setVariable ["vehicle_info_owners",_owners,true];

[] spawn life_fnc_keyMenu;
