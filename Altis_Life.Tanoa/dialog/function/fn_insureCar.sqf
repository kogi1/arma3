#include "..\..\script_macros.hpp" 
/* 
 File: fn_insureCar.sqf 
 Author: Guit0x "Lintox" 
 Description: 
 Insure a vehicle from the garage. 
*/ 
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_multiplier","_price","_purchasePrice","_insurancePrice"]; 
disableSerialization; 
if ((lbCurSel 2802) isEqualTo -1) exitWith {_huan = localize "STR_Global_NoSelection"; [_huan,"red","slow"] call life_fnc_notify;}; 
_vehicle = lbData[2802,(lbCurSel 2802)]; 
_vehicle = (call compile format["%1",_vehicle]) select 0; 
_vehicleLife = _vehicle; 
_vid = lbValue[2802,(lbCurSel 2802)]; 
_pid = getPlayerUID player; 
_unit = player; 
if(isNil "_vehicle") exitWith {_huan = localize "STR_Garage_Selection_Error"; [_huan,"red","slow"] call life_fnc_notify;}; 
if ((time - life_action_delay) < 1.5) exitWith {_huan = localize "STR_NOTF_ActionDelay"; [_huan,"red","slow"] call life_fnc_notify;}; 
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then { 
 _vehicleLife = "Default"; //Use Default class if it doesn't exist 
 diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle]; 
}; 
_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price"); 
switch (playerSide) do { 
 case civilian: { 
 _multiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_CIVILIAN"); 
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN"); 
 }; 
 case west: { 
 _multiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_COP"); 
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP"); 
 }; 
 case independent: { 
 _multiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_MEDIC"); 
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC"); 
 }; 
 case east: { 
 _multiplier = LIFE_SETTINGS(getNumber,"vehicle_insurance_multiplier_OPFOR"); 
 _purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR"); 
 }; 
}; 
_insurancePrice = _purchasePrice * _multiplier; 
if(!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500}; 
if(BANK < _insurancePrice) exitWith {_huan = format[(localize "STR_GNOTF_NotEnoughMoney"),[_insurancePrice] call life_fnc_numberText]; [_huan,"red","slow"] call life_fnc_notify;}; 
if (life_HC_isActive) then { 
 [_vid,_pid,_insurancePrice,player,life_garage_type] remoteExecCall ["HC_fnc_insureCar",HC_Life]; 
} else { 
 [_vid,_pid,_insurancePrice,player,life_garage_type] remoteExecCall ["TON_fnc_insureCar",RSERV]; 
}; 
_huan = localize "STR_InsuranceApply"; 
[_huan,"greeb","slow"] call life_fnc_notify;
BANK = BANK - _insurancePrice; 
life_action_delay = time; 
closeDialog 0;