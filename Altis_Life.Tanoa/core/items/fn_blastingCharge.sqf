#include "..\..\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private ["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if (isNull _vault) exitWith {}; //Bad object
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {_huan = localize "STR_ISTR_Blast_VaultOnly"; [_huan,"red","slow"] call life_fnc_notify;};
if (_vault getVariable ["chargeplaced",false]) exitWith {_huan = localize "STR_ISTR_Blast_AlreadyPlaced"; [_huan,"red","slow"] call life_fnc_notify;};
if (_vault getVariable ["safe_open",false]) exitWith {_huan = localize "STR_ISTR_Blast_AlreadyOpen"; [_huan,"red","slow"] call life_fnc_notify;};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
     _huan = format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
	 [_huan,"red","slow"] call life_fnc_notify;
};

private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

if ((nearestObject [_pos,_vaultHouse]) getVariable ["locked",true]) exitWith {_huan = localize "STR_ISTR_Blast_Exploit"; [_huan,"red","slow"] call life_fnc_notify;};
if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed",true,[]] remoteExecCall ["life_fnc_broadcast",west];
_huan = localize "STR_ISTR_Blast_KeepOff";
[_huan,"green","slow"] call life_fnc_notify;

[] remoteExec ["life_fnc_demoChargeTimer",[west,player]];
[] remoteExec ["TON_fnc_handleBlastingCharge",2];
