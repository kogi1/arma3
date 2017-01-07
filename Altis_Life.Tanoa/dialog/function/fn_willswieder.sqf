#include "..\..\script_macros.hpp"
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price"];
disableSerialization;
if((lbCurSel 28020) isEqualTo (-1)) exitWith {_huan = localize "STR_Global_NoSelection"; [_huan,"red","slow"] call life_fnc_notify;};
_vehicle = lbData[28020,(lbCurSel 28020)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[28020,(lbCurSel 28020)];
_pid = getPlayerUID player;
_unit = player;
if(isNil "_vehicle") exitWith {_huan = localize "STR_Garage_Selection_Error"; [_huan,"red","slow"] call life_fnc_notify;};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
_vehicleLife = "Default"; //Use Default class if it doesn't exist
diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};
_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"impound");
if(!((typeName _price) isEqualTo (typeName 0)) OR _price < 1) then {_price = 1000};
if(BANK < _price) exitWith {_huan = format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText]; [_huan,"red","slow"] call life_fnc_notify;};
if((typeName life_garage_sp) isEqualTo (typeName [])) then {
[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1] remoteExec ["TON_fnc_spawnVehicle",RSERV];
} else {
if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
[_vid,_pid,life_garage_sp,_unit,_price] remoteExec ["TON_fnc_spawnVehicle",RSERV];
} else {
[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp] remoteExec ["TON_fnc_spawnVehicle",RSERV];
};
};
_huan = localize "STR_Garage_SpawningVeh";
[_huan,"green","slow"] call life_fnc_notify;
BANK = BANK - _price;
[1] call SOCK_fnc_updatePartial;
closeDialog 0;