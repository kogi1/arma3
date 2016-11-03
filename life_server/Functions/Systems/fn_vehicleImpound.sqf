#include "\life_server\script_macros.hpp"
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.
_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then {
_plate = _vInfo select 1;
_uid = _vInfo select 0;
};
//Save vehicle inventory
if(LIFE_SETTINGS(getNumber,"save_veh_virtualItems") isEqualTo 1) then {
_trunk = _vehicle getVariable["Trunk",[[],0]];
_trunk = [_trunk] call DB_fnc_mresArray;
} else {
_trunk = [[],0];
};
if(LIFE_SETTINGS(getNumber,"save_veh_gear") isEqualTo 1) then {
_vehItems = getItemCargo _vehicle;
_vehMags = getMagazineCargo _vehicle;
_vehWeapons = getWeaponCargo _vehicle;
_vehBackpacks = getBackpackCargo _vehicle;
_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call DB_fnc_mresArray;
} else {
_cargo = [];
};
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = getAllHitPointsDamage _vehicle;
    _damage = _damage select 2;
    } else {
    _damage = [];
};
_damage = [_damage] call DB_fnc_mresArray;

// because fuel price!
if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _fuel = (fuel _vehicle);
    } else {
    _fuel = 1;
};

if(_impound) then {
if(count _vInfo == 0) then {
life_impound_inuse = false;
(owner _unit) publicVariableClient "life_impound_inuse";
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
deleteVehicle _vehicle;
};
} else {
_query = format["UPDATE vehicles SET active='0',impound='1', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,_fuel,_damage];
_thread = [_query,1] call DB_fnc_asyncCall;
//waitUntil {scriptDone _thread};
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
deleteVehicle _vehicle;
};
life_impound_inuse = false;
(owner _unit) publicVariableClient "life_impound_inuse";
};
} else {
if(count _vInfo == 0) exitWith {
[1,(localize "STR_Garage_Store_NotPersistent")] remoteExec ["life_fnc_broadcast",(owner _unit)];
life_garage_store = false;
(owner _unit) publicVariableClient "life_impound_inuse";
};
if(_uid != getPlayerUID _unit) exitWith {
[1,(localize "STR_Garage_Store_NoOwnership")] remoteExec ["life_fnc_broadcast",(owner _unit)];
life_garage_store = false;
(owner _unit) publicVariableClient "life_impound_inuse";
};
_query = format["UPDATE vehicles SET active='0',impound='1', inventory='%3', gear='%4', fuel='%5', damage='%6' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,_fuel,_damage];
_thread = [_query,1] call DB_fnc_asyncCall;
//waitUntil {scriptDone _thread};
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
deleteVehicle _vehicle;
};
life_garage_store = false;
(owner _unit) publicVariableClient "life_impound_inuse";
[1,(localize "STR_Garage_Store_Success")] remoteExec ["life_fnc_broadcast",(owner _unit)];
};